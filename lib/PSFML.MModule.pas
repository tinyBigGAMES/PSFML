{==============================================================================
                         ___  ___  ___  __  __  _ ™
                        | _ \/ __|| __||  \/  || |
                        |  _/\__ \| _| | |\/| || |__
                        |_|  |___/|_|  |_|  |_||____|
                              SFML for Pascal

                  Copyright © 2024-present tinyBigGAMES™ LLC
                           All Rights Reserved.

                    https://github.com/tinyBigGAMES/PSFML
                   See LICENSE file for license information
-----------------------------------------------------------------------------
Based on:
  https://github.com/Fr0sT-Brutal/Delphi_MemoryModule

  - Fixed crash running in Win64
==============================================================================}


unit PSFML.MModule;

{$I PSFML.inc}

interface

uses
  WinApi.Windows;

function  LoadLibrary(AData: Pointer): THandle;
procedure FreeLibrary(AModule: THandle);
function  GetProcAddress(AModule: THandle; const AName: PAnsiChar): Pointer;

implementation

const
  IMAGE_REL_BASED_ABSOLUTE = 0;
  IMAGE_REL_BASED_HIGHLOW = 3;
  IMAGE_REL_BASED_DIR64 = 10;

  IMAGE_ORDINAL_FLAG = IMAGE_ORDINAL_FLAG64;
  HOST_MACHINE = IMAGE_FILE_MACHINE_AMD64;

type
{$IF NOT DECLARED(IMAGE_BASE_RELOCATION)}
{$ALIGN 4}
  IMAGE_BASE_RELOCATION = record
    VirtualAddress: DWORD;
    SizeOfBlock: DWORD;
  end;
{$ALIGN ON}
  PIMAGE_BASE_RELOCATION = ^IMAGE_BASE_RELOCATION;
{$IFEND}

const
  IMAGE_SIZEOF_BASE_RELOCATION = SizeOf(IMAGE_BASE_RELOCATION);

type
{$IF NOT DECLARED(PIMAGE_DATA_DIRECTORY)}
  PIMAGE_DATA_DIRECTORY = ^IMAGE_DATA_DIRECTORY;
{$IFEND}
{$IF NOT DECLARED(PIMAGE_SECTION_HEADER)}
  PIMAGE_SECTION_HEADER = ^IMAGE_SECTION_HEADER;
{$IFEND}
{$IF NOT DECLARED(PIMAGE_EXPORT_DIRECTORY)}
  PIMAGE_EXPORT_DIRECTORY = ^IMAGE_EXPORT_DIRECTORY;
{$IFEND}
{$IF NOT DECLARED(PIMAGE_DOS_HEADER)}
  PIMAGE_DOS_HEADER = ^IMAGE_DOS_HEADER;
{$IFEND}
{$IF NOT DECLARED(PIMAGE_NT_HEADERS)}
  PIMAGE_NT_HEADERS = ^IMAGE_NT_HEADERS;
{$IFEND}
{$IF NOT DECLARED(PUINT_PTR)}
  PUINT_PTR = ^UINT_PTR;
{$IFEND}

  PIMAGE_TLS_DIRECTORY = PIMAGE_TLS_DIRECTORY64;

  TMemoryModuleRec = record
    Headers: PIMAGE_NT_HEADERS;
    CodeBase: Pointer;
    Modules: array of HMODULE;
    NumModules: Integer;
    Initialized: Boolean;
    IsRelocated: Boolean;
    PageSize: DWORD;
  end;

  PMemoryModuleRec = ^TMemoryModuleRec;

  TDllEntryProc = function(AHinstDLL: HINST; AFdwReason: DWORD;
    AReserved: Pointer): BOOL; stdcall;

  TSectionFinalizeData = record
    Address: Pointer;
    AlignedAddress: Pointer;
    Size: SIZE_T;
    Characteristics: DWORD;
    Last: Boolean;
  end;

procedure Abort;
begin
  raise TObject.Create;
end;

function StrComp(const AStr1, AStr2: PAnsiChar): Integer;
var
  P1, P2: PAnsiChar;
begin
  P1 := AStr1;
  P2 := AStr2;
  while True do
  begin
    if (P1^ <> P2^) or (P1^ = #0) then
      Exit(Ord(P1^) - Ord(P2^));
    Inc(P1);
    Inc(P2);
  end;
end;

{$IF NOT DECLARED(IMAGE_ORDINAL)}
function IMAGE_ORDINAL(Ordinal: NativeUInt): Word; inline;
begin
  Result := Ordinal and $FFFF;
end;
{$IFEND}
{$IF NOT DECLARED(IMAGE_SNAP_BY_ORDINAL)}
function IMAGE_SNAP_BY_ORDINAL(AOrdinal: NativeUInt): Boolean; inline;
begin
  Result := ((AOrdinal and IMAGE_ORDINAL_FLAG) <> 0);
end;
{$IFEND}

function GET_HEADER_DICTIONARY(AModule: PMemoryModuleRec;
  AIdx: Integer): PIMAGE_DATA_DIRECTORY;
begin
  Result := PIMAGE_DATA_DIRECTORY
    (@(AModule.Headers.OptionalHeader.DataDirectory[AIdx]));
end;

function ALIGN_DOWN(AAddress: Pointer; AAlignment: DWORD): Pointer;
begin
  Result := Pointer(UIntPtr(AAddress) and not(AAlignment - 1));
end;

function CopySections(AData: Pointer; AOldHeaders: PIMAGE_NT_HEADERS;
  AModule: PMemoryModuleRec): Boolean;
var
  I, LSize: Integer;
  LCodeBase: Pointer;
  LDest: Pointer;
  LSection: PIMAGE_SECTION_HEADER;
begin
  LCodeBase := AModule.CodeBase;
  LSection := PIMAGE_SECTION_HEADER (IMAGE_FIRST_SECTION(AModule.Headers));

  for I := 0 to AModule.Headers.FileHeader.NumberOfSections - 1 do
  begin
    if LSection.SizeOfRawData = 0 then
    begin
      LSize := AOldHeaders.OptionalHeader.SectionAlignment;
      if LSize > 0 then
      begin
        LDest := VirtualAlloc(PByte(LCodeBase) + LSection.VirtualAddress,
          LSize, MEM_COMMIT, PAGE_READWRITE);
        if LDest = nil then
          Exit(False);
        LDest := PByte(LCodeBase) + LSection.VirtualAddress;
        LSection.Misc.PhysicalAddress := DWORD(LDest);
        ZeroMemory(LDest, LSize);
      end;
      Inc(LSection);
      Continue;
    end;

    LDest := VirtualAlloc(PByte(LCodeBase) + LSection.VirtualAddress,
      LSection.SizeOfRawData, MEM_COMMIT, PAGE_READWRITE);
    if LDest = nil then Exit(False);

    LDest := PByte(LCodeBase) + LSection.VirtualAddress;
    CopyMemory(LDest, PByte(AData) + LSection.PointerToRawData,
      LSection.SizeOfRawData);
    LSection.Misc.PhysicalAddress := DWORD(LDest);
    Inc(LSection);
  end;

  Result := True;
end;

const
  ProtectionFlags: array [Boolean, Boolean, Boolean] of DWORD = ((
    (PAGE_NOACCESS, PAGE_WRITECOPY), (PAGE_READONLY, PAGE_READWRITE)), (
    (PAGE_EXECUTE, PAGE_EXECUTE_WRITECOPY), (PAGE_EXECUTE_READ,
    PAGE_EXECUTE_READWRITE)));

function GetRealSectionSize(AModule: PMemoryModuleRec;
  ASection: PIMAGE_SECTION_HEADER): DWORD;
begin
  Result := ASection.SizeOfRawData;
  if Result = 0 then
    if (ASection.Characteristics and
      IMAGE_SCN_CNT_INITIALIZED_DATA) <> 0 then
      Result := AModule.Headers.OptionalHeader.SizeOfInitializedData
    else if (ASection.Characteristics and
      IMAGE_SCN_CNT_UNINITIALIZED_DATA) <> 0
    then
      Result := AModule.Headers.OptionalHeader.SizeOfUninitializedData;
end;

function FinalizeSection(AModule: PMemoryModuleRec;
  const ASectionData: TSectionFinalizeData): Boolean;
var
  LProtect, LOldProtect: DWORD;
  LExecutable, LReadable, LWriteable: Boolean;
begin
  if ASectionData.Size = 0 then
    Exit(True);

  if (ASectionData.Characteristics and IMAGE_SCN_MEM_DISCARDABLE) <> 0 then
  begin
    if (ASectionData.Address = ASectionData.AlignedAddress) and
      (ASectionData.Last or
      (AModule.Headers.OptionalHeader.SectionAlignment = AModule.PageSize) or
      (ASectionData.Size mod AModule.PageSize = 0)) then
      VirtualFree(ASectionData.Address, ASectionData.Size, MEM_DECOMMIT);
    Exit(True);
  end;

  LExecutable := (ASectionData.Characteristics and IMAGE_SCN_MEM_EXECUTE) <> 0;
  LReadable := (ASectionData.Characteristics and IMAGE_SCN_MEM_READ) <> 0;
  LWriteable := (ASectionData.Characteristics and IMAGE_SCN_MEM_WRITE) <> 0;
  LProtect := ProtectionFlags[LExecutable][LReadable][LWriteable];
  if (ASectionData.Characteristics and IMAGE_SCN_MEM_NOT_CACHED) <> 0 then
    LProtect := LProtect or PAGE_NOCACHE;

  Result := VirtualProtect(ASectionData.Address, ASectionData.Size,
    LProtect, LOldProtect);
end;

function FinalizeSections(LModule: PMemoryModuleRec): Boolean;
var
  I: Integer;
  LSection: PIMAGE_SECTION_HEADER;
  LImageOffset: UIntPtr;
  LSectionData: TSectionFinalizeData;
  LSectionAddress, LAlignedAddress: Pointer;
  LSectionSize: DWORD;
begin
  LSection := PIMAGE_SECTION_HEADER (IMAGE_FIRST_SECTION(LModule.Headers));

  LImageOffset := (NativeUInt(LModule.CodeBase) and $FFFFFFFF00000000);

  LSectionData.Address := Pointer(UIntPtr(LSection.Misc.PhysicalAddress) or
    LImageOffset);
  LSectionData.AlignedAddress := ALIGN_DOWN(LSectionData.Address,
    LModule.PageSize);
  LSectionData.Size := GetRealSectionSize(LModule, LSection);
  LSectionData.Characteristics := LSection.Characteristics;
  LSectionData.Last := False;
  Inc(LSection);

  for I := 1 to LModule.Headers.FileHeader.NumberOfSections - 1 do
  begin
    LSectionAddress := Pointer(UIntPtr(LSection.Misc.PhysicalAddress) or
      LImageOffset);
    LAlignedAddress := ALIGN_DOWN(LSectionData.Address, LModule.PageSize);
    LSectionSize := GetRealSectionSize(LModule, LSection);
    if (LSectionData.AlignedAddress = LAlignedAddress) or
      (PByte(LSectionData.Address) + LSectionData.Size > PByte(LAlignedAddress))
    then
    begin
      if (LSection.Characteristics and IMAGE_SCN_MEM_DISCARDABLE = 0) or
        (LSectionData.Characteristics and IMAGE_SCN_MEM_DISCARDABLE = 0) then
        LSectionData.Characteristics :=
          (LSectionData.Characteristics or LSection.Characteristics) and
          not IMAGE_SCN_MEM_DISCARDABLE
      else
        LSectionData.Characteristics := LSectionData.Characteristics or
          LSection.Characteristics;
      LSectionData.Size := PByte(LSectionAddress) + LSectionSize -
        PByte(LSectionData.Address);
      Inc(LSection);
      Continue;
    end;

    if not FinalizeSection(LModule, LSectionData) then Exit(False);

    LSectionData.Address := LSectionAddress;
    LSectionData.AlignedAddress := LAlignedAddress;
    LSectionData.Size := LSectionSize;
    LSectionData.Characteristics := LSection.Characteristics;

    Inc(LSection);
  end;

  LSectionData.Last := True;
  if not FinalizeSection(LModule, LSectionData) then Exit(False);

  Result := True;
end;

function ExecuteTLS(AModule: PMemoryModuleRec): Boolean;
var
  LCodeBase: Pointer;
  LDirectory: PIMAGE_DATA_DIRECTORY;
  LTls: PIMAGE_TLS_DIRECTORY;
  LCallback: PPointer;

  function FixPtr(AOldPtr: Pointer): Pointer;
  begin
    Result := Pointer(NativeUInt(AOldPtr) -
      AModule.Headers.OptionalHeader.ImageBase + NativeUInt(LCodeBase));
  end;

begin
  Result := True;
  LCodeBase := AModule.CodeBase;

  LDirectory := GET_HEADER_DICTIONARY(AModule, IMAGE_DIRECTORY_ENTRY_TLS);
  if LDirectory.VirtualAddress = 0 then Exit;

  LTls := PIMAGE_TLS_DIRECTORY(PByte(LCodeBase) + LDirectory.VirtualAddress);

  LCallback := Pointer(LTls.AddressOfCallBacks);
  if LCallback <> nil then
  begin
    LCallback := FixPtr(LCallback);
    while LCallback^ <> nil do
    begin
      PIMAGE_TLS_CALLBACK(FixPtr(LCallback^))(LCodeBase, DLL_PROCESS_ATTACH,
        nil);
      Inc(LCallback);
    end;
  end;
end;

function PerformBaseRelocation(AModule: PMemoryModuleRec;
  ADelta: NativeInt): Boolean;
var
  I: Cardinal;
  LCodeBase: Pointer;
  LDirectory: PIMAGE_DATA_DIRECTORY;
  LRelocation: PIMAGE_BASE_RELOCATION;
  LDest: Pointer;
  LRelInfo: ^UInt16;
  LPatchAddrHL: PDWORD;
  LPatchAddr64: PULONGLONG;
  LRelType, LOffset: Integer;
begin
  LCodeBase := AModule.CodeBase;
  LDirectory := GET_HEADER_DICTIONARY(AModule,
    IMAGE_DIRECTORY_ENTRY_BASERELOC);
  if LDirectory.Size = 0 then
    Exit(ADelta = 0);

  LRelocation := PIMAGE_BASE_RELOCATION(PByte(LCodeBase) +
    LDirectory.VirtualAddress);
  while LRelocation.VirtualAddress > 0 do
  begin
    LDest := Pointer(PByte(LCodeBase) + LRelocation.VirtualAddress);
    LRelInfo := Pointer(PByte(LRelocation) + IMAGE_SIZEOF_BASE_RELOCATION);
    for I := 0 to Trunc(((LRelocation.SizeOfBlock -
      IMAGE_SIZEOF_BASE_RELOCATION) / 2)) - 1 do
    begin
      LRelType := LRelInfo^ shr 12;
      LOffset := LRelInfo^ and $FFF;

      case LRelType of
        IMAGE_REL_BASED_ABSOLUTE: ;
        IMAGE_REL_BASED_HIGHLOW:
          begin
            LPatchAddrHL := Pointer(PByte(LDest) + LOffset);
            Inc(LPatchAddrHL^, ADelta);
          end;

        IMAGE_REL_BASED_DIR64:
          begin
            LPatchAddr64 := Pointer(PByte(LDest) + LOffset);
            Inc(LPatchAddr64^, ADelta);
          end;
      end;
      Inc(LRelInfo);
    end;

    LRelocation := PIMAGE_BASE_RELOCATION(PByte(LRelocation) +
      LRelocation.SizeOfBlock);
  end;

  Result := True;
end;

function BuildImportTable(AModule: PMemoryModuleRec): Boolean; stdcall;
var
  LCodeBase: Pointer;
  LDirectory: PIMAGE_DATA_DIRECTORY;
  LImportDesc: PIMAGE_IMPORT_DESCRIPTOR;
  LThunkRef: PUINT_PTR;
  LFuncRef: ^FARPROC;
  LHandle: HMODULE;
  LThunkData: PIMAGE_IMPORT_BY_NAME;
begin
  LCodeBase := AModule.CodeBase;
  Result := True;

  LDirectory := GET_HEADER_DICTIONARY(AModule, IMAGE_DIRECTORY_ENTRY_IMPORT);
  if LDirectory.Size = 0 then
    Exit(True);

  LImportDesc := PIMAGE_IMPORT_DESCRIPTOR(PByte(LCodeBase) +
    LDirectory.VirtualAddress);
  while (not IsBadReadPtr(LImportDesc, SizeOf(IMAGE_IMPORT_DESCRIPTOR))) and
    (LImportDesc.Name <> 0) do
  begin
    LHandle := WinApi.Windows.LoadLibraryA
      (PAnsiChar(PByte(LCodeBase) + LImportDesc.Name));
    if LHandle = 0 then
    begin
      SetLastError(ERROR_MOD_NOT_FOUND);
      Result := False;
      Break;
    end;

    try
      SetLength(AModule.Modules, AModule.NumModules + 1);
    except
      WinApi.Windows.FreeLibrary(LHandle);
      SetLastError(ERROR_OUTOFMEMORY);
      Result := False;
      Break;
    end;
    AModule.Modules[AModule.NumModules] := LHandle;
    Inc(AModule.NumModules);

    if LImportDesc.OriginalFirstThunk <> 0 then
    begin
      LThunkRef := Pointer(PByte(LCodeBase) + LImportDesc.OriginalFirstThunk);
      LFuncRef := Pointer(PByte(LCodeBase) + LImportDesc.FirstThunk);
    end
    else
    begin
      LThunkRef := Pointer(PByte(LCodeBase) + LImportDesc.FirstThunk);
      LFuncRef := Pointer(PByte(LCodeBase) + LImportDesc.FirstThunk);
    end;

    while LThunkRef^ <> 0 do
    begin
      if IMAGE_SNAP_BY_ORDINAL(LThunkRef^) then
        LFuncRef^ := WinApi.Windows.GetProcAddress(LHandle,
          PAnsiChar(IMAGE_ORDINAL(LThunkRef^)))
      else
      begin
        LThunkData := PIMAGE_IMPORT_BY_NAME(PByte(LCodeBase) + LThunkRef^);
        LFuncRef^ := WinApi.Windows.GetProcAddress(LHandle,
          PAnsiChar(@(LThunkData.Name)));
      end;
      if LFuncRef^ = nil then
      begin
        Result := False;
        Break;
      end;
      Inc(LFuncRef);
      Inc(LThunkRef);
    end;

    if not Result then
    begin
      WinApi.Windows.FreeLibrary(LHandle);
      SetLastError(ERROR_PROC_NOT_FOUND);
      Break;
    end;

    Inc(LImportDesc);
  end;
end;

procedure MMUnload(AModule: Pointer);
var
  I: Integer;
  LDllEntry: TDllEntryProc;
  LMmodule: PMemoryModuleRec;
begin
  if AModule = nil then
    Exit;

  LMmodule := PMemoryModuleRec(AModule);

  if LMmodule.Initialized then
  begin
    @LDllEntry := Pointer(PByte(LMmodule.CodeBase) +
      LMmodule.Headers.OptionalHeader.AddressOfEntryPoint);
    LDllEntry(HINST(LMmodule.CodeBase), DLL_PROCESS_DETACH, nil);
  end;

  if Length(LMmodule.Modules) <> 0 then
  begin
    for I := 0 to LMmodule.NumModules - 1 do
      if LMmodule.Modules[I] <> 0 then
        WinApi.Windows.FreeLibrary(LMmodule.Modules[I]);

    SetLength(LMmodule.Modules, 0);
  end;

  if LMmodule.CodeBase <> nil then
    VirtualFree(LMmodule.CodeBase, 0, MEM_RELEASE);

  HeapFree(GetProcessHeap(), 0, LMmodule);
end;

function MMLoad(AData: Pointer): Pointer;
var
  LDosHeader: PIMAGE_DOS_HEADER;
  LOldHeader: PIMAGE_NT_HEADERS;
  LCode, LHeaders: Pointer;
  LLocationDelta: NativeInt;
  LSysInfo: SYSTEM_INFO;
  LDllEntry: TDllEntryProc;
  LSuccessfull: Boolean;
  LModule: PMemoryModuleRec;
begin
  Result := nil;
  LModule := nil;

  try
    LDosHeader := PIMAGE_DOS_HEADER(AData);
    if (LDosHeader.e_magic <> IMAGE_DOS_SIGNATURE) then
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;

    LOldHeader := PIMAGE_NT_HEADERS(PByte(AData) + LDosHeader._lfanew);
    if LOldHeader.Signature <> IMAGE_NT_SIGNATURE then
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;

    if LOldHeader.FileHeader.Machine <> IMAGE_FILE_MACHINE_AMD64 then
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;

    if (LOldHeader.OptionalHeader.SectionAlignment and 1) <> 0 then
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;

    LCode := VirtualAlloc(Pointer(LOldHeader.OptionalHeader.ImageBase),
      LOldHeader.OptionalHeader.SizeOfImage, MEM_RESERVE or MEM_COMMIT,
      PAGE_READWRITE);
    if LCode = nil then
    begin
      LCode := VirtualAlloc(nil, LOldHeader.OptionalHeader.SizeOfImage,
        MEM_RESERVE or MEM_COMMIT, PAGE_READWRITE);
      if LCode = nil then
      begin
        SetLastError(ERROR_OUTOFMEMORY);
        Exit;
      end;
    end;

    LModule := PMemoryModuleRec(HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY,
      SizeOf(TMemoryModuleRec)));
    if LModule = nil then
    begin
      VirtualFree(LCode, 0, MEM_RELEASE);
      SetLastError(ERROR_OUTOFMEMORY);
      Exit;
    end;

    LModule.CodeBase := LCode;
    GetNativeSystemInfo(LSysInfo);
    LModule.PageSize := LSysInfo.dwPageSize;

    LHeaders := VirtualAlloc(LCode, LOldHeader.OptionalHeader.SizeOfHeaders,
      MEM_COMMIT, PAGE_READWRITE);

    CopyMemory(LHeaders, LDosHeader, LOldHeader.OptionalHeader.SizeOfHeaders);
    LModule.Headers := PIMAGE_NT_HEADERS(PByte(LHeaders) + LDosHeader._lfanew);

    if not CopySections(AData, LOldHeader, LModule) then Abort;

    LLocationDelta := NativeUInt(LCode) - LOldHeader.OptionalHeader.ImageBase;
    if LLocationDelta <> 0 then
      LModule.IsRelocated := PerformBaseRelocation(LModule, LLocationDelta)
    else
      LModule.IsRelocated := True;

    if not BuildImportTable(LModule) then Abort;
    if not FinalizeSections(LModule) then Abort;
    if not ExecuteTLS(LModule) then Abort;

    if LModule.Headers.OptionalHeader.AddressOfEntryPoint <> 0 then
    begin
      @LDllEntry :=
        Pointer(PByte(LCode) + LModule.Headers.OptionalHeader.
        AddressOfEntryPoint);
      LSuccessfull := LDllEntry(HINST(LCode), DLL_PROCESS_ATTACH, nil);
      if not LSuccessfull then
      begin
        SetLastError(ERROR_DLL_INIT_FAILED);
        Abort;
      end;
      LModule.Initialized := True;
    end;

    Result := LModule;
  except
    MMUnload(LModule);
    Exit;
  end;
end;

function MMBind(AModule: Pointer; const AName: PAnsiChar): Pointer;
var
  LCodeBase: Pointer;
  LIdx: Integer;
  I: DWORD;
  LNameRef: PDWORD;
  LOrdinal: PWord;
  LExportDir: PIMAGE_EXPORT_DIRECTORY;
  LDirectory: PIMAGE_DATA_DIRECTORY;
  LTemp: PDWORD;
  LMmodule: PMemoryModuleRec;
begin
  Result := nil;
  LMmodule := PMemoryModuleRec(AModule);

  LCodeBase := LMmodule.CodeBase;
  LDirectory := GET_HEADER_DICTIONARY(LMmodule, IMAGE_DIRECTORY_ENTRY_EXPORT);

  if LDirectory.Size = 0 then
  begin
    SetLastError(ERROR_PROC_NOT_FOUND);
    Exit;
  end;

  LExportDir := PIMAGE_EXPORT_DIRECTORY(PByte(LCodeBase) +
    LDirectory.VirtualAddress);
  if (LExportDir.NumberOfNames = 0) or (LExportDir.NumberOfFunctions = 0) then
  begin
    SetLastError(ERROR_PROC_NOT_FOUND);
    Exit;
  end;

  LNameRef := Pointer(PByte(LCodeBase) + LExportDir.AddressOfNames);
  LOrdinal := Pointer(PByte(LCodeBase) + LExportDir.AddressOfNameOrdinals);
  LIdx := -1;
  for I := 0 to LExportDir.NumberOfNames - 1 do
  begin
    if StrComp(AName, PAnsiChar(PByte(LCodeBase) + LNameRef^)) = 0 then
    begin
      LIdx := LOrdinal^;
      Break;
    end;
    Inc(LNameRef);
    Inc(LOrdinal);
  end;

  if (LIdx = -1) then
  begin
    SetLastError(ERROR_PROC_NOT_FOUND);
    Exit;
  end;

  if (DWORD(LIdx) > LExportDir.NumberOfFunctions) then
  begin
    SetLastError(ERROR_PROC_NOT_FOUND);
    Exit;
  end;

  LTemp := Pointer(PByte(LCodeBase) + LExportDir.AddressOfFunctions +
    LIdx * 4);
  Result := Pointer(PByte(LCodeBase) + LTemp^);
end;

function  LoadLibrary(AData: Pointer): THandle;
begin
  Result := THandle(MMLoad(AData));
end;

procedure FreeLibrary(AModule: THandle);
begin
  MMUnload(Pointer(AModule));
end;

function  GetProcAddress(AModule: THandle; const AName: PAnsiChar): Pointer;
begin
  Result := MMBind(Pointer(AModule), AName)
end;

end.
