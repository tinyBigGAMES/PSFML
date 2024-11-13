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
==============================================================================}

unit PSFML.MemoryDLL;

{$I PSFML.inc}

interface

uses
  WinApi.Windows,
  System.Math,
  System.SysUtils;

function  LoadLibrary(const AData: Pointer): THandle; stdcall;
procedure FreeLibrary(const AModule: THandle); stdcall;
function  GetProcAddress(const AModule: THandle; const AName: PAnsiChar): Pointer; stdcall;

implementation

{$IF NOT DECLARED(IMAGE_BASE_RELOCATION)}
type
  {$ALIGN 4}
  IMAGE_BASE_RELOCATION = record
    VirtualAddress: DWORD;
    SizeOfBlock: DWORD;
  end;
  {$ALIGN ON}
  PIMAGE_BASE_RELOCATION = ^IMAGE_BASE_RELOCATION;
{$IFEND}

{$IF NOT DECLARED(PIMAGE_DATA_DIRECTORY)}
type
  PIMAGE_DATA_DIRECTORY = ^IMAGE_DATA_DIRECTORY;
{$IFEND}

{$IF NOT DECLARED(PIMAGE_SECTION_HEADER)}
type
  PIMAGE_SECTION_HEADER = ^IMAGE_SECTION_HEADER;
{$IFEND}

{$IF NOT DECLARED(PIMAGE_EXPORT_DIRECTORY)}
type
  PIMAGE_EXPORT_DIRECTORY = ^IMAGE_EXPORT_DIRECTORY;
{$IFEND}

{$IF NOT DECLARED(PIMAGE_DOS_HEADER)}
type
  PIMAGE_DOS_HEADER = ^IMAGE_DOS_HEADER;
{$IFEND}

{$IF NOT DECLARED(PIMAGE_NT_HEADERS64)}
type
  IMAGE_NT_HEADERS64 = record
    Signature: DWORD;
    FileHeader: IMAGE_FILE_HEADER;
    OptionalHeader: IMAGE_OPTIONAL_HEADER64;
  end;
  PIMAGE_NT_HEADERS64 = ^IMAGE_NT_HEADERS64;
{$IFEND}

{$IF NOT DECLARED(PIMAGE_TLS_DIRECTORY64)}
type
  PIMAGE_TLS_DIRECTORY64 = ^IMAGE_TLS_DIRECTORY64;
{$IFEND}

{$IF NOT DECLARED(PUINT_PTR)}
type
  PUINT_PTR = ^UINT_PTR;
{$IFEND}

const
  IMAGE_REL_BASED_ABSOLUTE = 0;
  IMAGE_REL_BASED_HIGHLOW = 3;
  IMAGE_REL_BASED_DIR64 = 10;
  IMAGE_DIRECTORY_ENTRY_EXPORT = 0;
  IMAGE_DIRECTORY_ENTRY_IMPORT = 1;
  IMAGE_DIRECTORY_ENTRY_TLS = 9;
  IMAGE_FILE_MACHINE_AMD64 = $8664;
  IMAGE_NT_SIGNATURE = $00004550;
  IMAGE_ORDINAL_FLAG64 = $8000000000000000;
  ProtectionFlags: array[Boolean, Boolean, Boolean] of DWORD =
  (
    ((PAGE_NOACCESS, PAGE_WRITECOPY), (PAGE_READONLY, PAGE_READWRITE)),
    ((PAGE_EXECUTE, PAGE_EXECUTE_WRITECOPY), (PAGE_EXECUTE_READ, PAGE_EXECUTE_READWRITE))
  );
  ERROR_BAD_EXE_FORMAT = 193;
  ERROR_MOD_NOT_FOUND = 126;
  ERROR_OUTOFMEMORY = 14;
  ERROR_PROC_NOT_FOUND = 127;
  ERROR_DLL_INIT_FAILED = 1114;

const
  IMAGE_SIZEOF_BASE_RELOCATION = SizeOf(IMAGE_BASE_RELOCATION);
  HOST_MACHINE = IMAGE_FILE_MACHINE_AMD64;

type
  TMemoryModuleRec = record
    Headers: PIMAGE_NT_HEADERS64;
    CodeBase: Pointer;
    Modules: array of HMODULE;
    NumModules: Integer;
    Initialized: Boolean;
    IsRelocated: Boolean;
    PageSize: DWORD;
  end;
  PMemoryModule = ^TMemoryModuleRec;

  TDllEntryProc = function(hinstDLL: HINST; fdwReason: DWORD; lpReserved: Pointer): BOOL; stdcall;
  TSectionFinalizeData = record
    Address: Pointer;
    AlignedAddress: Pointer;
    Size: SIZE_T;
    Characteristics: DWORD;
    Last: Boolean;
  end;

procedure Abort;
begin
  raise Exception.Create('Critical error in MemoryDLL unit.');
end;

function StrComp(const Str1, Str2: PAnsiChar): Integer;
var
  P1, P2: PAnsiChar;
begin
  P1 := Str1;
  P2 := Str2;
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
function IMAGE_SNAP_BY_ORDINAL(Ordinal: NativeUInt): Boolean; inline;
begin
  Result := ((Ordinal and IMAGE_ORDINAL_FLAG64) <> 0);
end;
{$IFEND}

function GET_HEADER_DICTIONARY(Module: PMemoryModule; Idx: Integer): PIMAGE_DATA_DIRECTORY;
begin
  Result := @((Module.Headers^.OptionalHeader.DataDirectory[Idx]));
end;

function ALIGN_DOWN(Address: Pointer; Alignment: DWORD): Pointer;
begin
  Result := Pointer(NativeUInt(Address) and not (Alignment - 1));
end;

function CopySections(data: Pointer; old_headers: PIMAGE_NT_HEADERS64; module: PMemoryModule): Boolean;
var
  I: Integer;
  LSize: Integer;
  LCodeBase: Pointer;
  LDest: Pointer;
  LSection: PIMAGE_SECTION_HEADER;
begin
  LCodeBase := module.CodeBase;
  LSection := PIMAGE_SECTION_HEADER(IMAGE_FIRST_SECTION(module.Headers));
  for I := 0 to module.Headers^.FileHeader.NumberOfSections - 1 do
  begin
    if LSection^.SizeOfRawData = 0 then
    begin
      LSize := old_headers^.OptionalHeader.SectionAlignment;
      if LSize > 0 then
      begin
        LDest := VirtualAlloc(
          PByte(LCodeBase) + LSection^.VirtualAddress,
          LSize,
          MEM_COMMIT,
          PAGE_READWRITE
        );
        if LDest = nil then
          Exit(False);
        LSection^.Misc.PhysicalAddress := LSection^.VirtualAddress;
        ZeroMemory(LDest, LSize);
      end;
      Inc(LSection);
      Continue;
    end;
    LDest := VirtualAlloc(
      PByte(LCodeBase) + LSection^.VirtualAddress,
      LSection^.SizeOfRawData,
      MEM_COMMIT,
      PAGE_READWRITE
    );
    if LDest = nil then
      Exit(False);
    CopyMemory(
      LDest,
      PByte(data) + LSection^.PointerToRawData,
      LSection^.SizeOfRawData
    );
    LSection^.Misc.PhysicalAddress := LSection^.VirtualAddress;
    Inc(LSection);
  end;
  Result := True;
end;

function GetRealSectionSize(Module: PMemoryModule; Section: PIMAGE_SECTION_HEADER): DWORD;
begin
  Result := Section^.SizeOfRawData;
  if Result = 0 then
  begin
    if (Section^.Characteristics and IMAGE_SCN_CNT_INITIALIZED_DATA) <> 0 then
      Result := Module.Headers^.OptionalHeader.SizeOfInitializedData
    else if (Section^.Characteristics and IMAGE_SCN_CNT_UNINITIALIZED_DATA) <> 0 then
      Result := Module.Headers^.OptionalHeader.SizeOfUninitializedData;
  end;
end;

function FinalizeSection(Module: PMemoryModule; const SectionData: TSectionFinalizeData): Boolean;
var
  LProtect: DWORD;
  LOldProtect: DWORD;
  LExecutable: Boolean;
  LReadable: Boolean;
  LWriteable: Boolean;
begin
  if SectionData.Size = 0 then
    Exit(True);
  if (SectionData.Characteristics and IMAGE_SCN_MEM_DISCARDABLE) <> 0 then
  begin
    if (SectionData.Address = SectionData.AlignedAddress) and
       (SectionData.Last or
        (Module.Headers^.OptionalHeader.SectionAlignment = Module.PageSize) or
        (SectionData.Size mod Module.PageSize = 0)) then
    begin
      VirtualFree(SectionData.Address, SectionData.Size, MEM_DECOMMIT);
    end;
    Exit(True);
  end;
  LExecutable := (SectionData.Characteristics and IMAGE_SCN_MEM_EXECUTE) <> 0;
  LReadable   := (SectionData.Characteristics and IMAGE_SCN_MEM_READ) <> 0;
  LWriteable  := (SectionData.Characteristics and IMAGE_SCN_MEM_WRITE) <> 0;
  LProtect := ProtectionFlags[LExecutable][LReadable][LWriteable];
  if (SectionData.Characteristics and IMAGE_SCN_MEM_NOT_CACHED) <> 0 then
    LProtect := LProtect or PAGE_NOCACHE;
  Result := VirtualProtect(SectionData.Address, SectionData.Size, LProtect, LOldProtect);
end;

function FinalizeSections(Module: PMemoryModule): Boolean;
var
  I: Integer;
  LSection: PIMAGE_SECTION_HEADER;
  LImageOffset: NativeUInt;
  LSectionData: TSectionFinalizeData;
  LSectionAddress: Pointer;
  LAlignedAddress: Pointer;
  LSectionSize: DWORD;
begin
  LSection := PIMAGE_SECTION_HEADER(IMAGE_FIRST_SECTION(Module.Headers));
  LImageOffset := NativeUInt(Module.CodeBase);
  LSectionData.Address := Pointer(LImageOffset + LSection^.VirtualAddress);
  LSectionData.AlignedAddress := ALIGN_DOWN(LSectionData.Address, Module.PageSize);
  LSectionData.Size := GetRealSectionSize(Module, LSection);
  LSectionData.Characteristics := LSection^.Characteristics;
  LSectionData.Last := False;
  Inc(LSection);
  for I := 1 to Module.Headers^.FileHeader.NumberOfSections - 1 do
  begin
    LSectionAddress := Pointer(LImageOffset + LSection^.VirtualAddress);
    LAlignedAddress := ALIGN_DOWN(LSectionData.Address, Module.PageSize);
    LSectionSize := GetRealSectionSize(Module, LSection);
    if (LSectionData.AlignedAddress = LAlignedAddress) or
       (PByte(LSectionData.Address) + LSectionData.Size > PByte(LAlignedAddress)) then
    begin
      if (LSection^.Characteristics and IMAGE_SCN_MEM_DISCARDABLE = 0) or
         (LSectionData.Characteristics and IMAGE_SCN_MEM_DISCARDABLE = 0) then
        LSectionData.Characteristics := (LSectionData.Characteristics or LSection^.Characteristics) and not IMAGE_SCN_MEM_DISCARDABLE
      else
        LSectionData.Characteristics := LSectionData.Characteristics or LSection^.Characteristics;
      LSectionData.Size := NativeUInt(LSectionAddress) + LSectionSize - NativeUInt(LSectionData.Address);
      Inc(LSection);
      Continue;
    end;
    if not FinalizeSection(Module, LSectionData) then
      Exit(False);
    LSectionData.Address := LSectionAddress;
    LSectionData.AlignedAddress := ALIGN_DOWN(LSectionData.Address, Module.PageSize);
    LSectionData.Size := LSectionSize;
    LSectionData.Characteristics := LSection^.Characteristics;
    Inc(LSection);
  end;
  LSectionData.Last := True;
  if not FinalizeSection(Module, LSectionData) then
    Exit(False);
  Result := True;
end;

function ExecuteTLS(Module: PMemoryModule): Boolean;
var
  LCodeBase: Pointer;
  LDirectory: PIMAGE_DATA_DIRECTORY;
  LTLS: PIMAGE_TLS_DIRECTORY64;
  LCallback: PPointer;

  function FixPtr(OldPtr: Pointer): Pointer;
  begin
    Result := Pointer(NativeUInt(OldPtr) - Module.Headers^.OptionalHeader.ImageBase + NativeUInt(LCodeBase));
  end;

begin
  Result := True;
  LCodeBase := Module.CodeBase;
  LDirectory := GET_HEADER_DICTIONARY(Module, IMAGE_DIRECTORY_ENTRY_TLS);
  if LDirectory^.VirtualAddress = 0 then
    Exit;
  LTLS := PIMAGE_TLS_DIRECTORY64(PByte(LCodeBase) + LDirectory^.VirtualAddress);
  LCallback := PPointer(LTLS^.AddressOfCallBacks);
  if LCallback <> nil then
  begin
    LCallback := FixPtr(LCallback);
    while LCallback^ <> nil do
    begin
      PIMAGE_TLS_CALLBACK(FixPtr(LCallback^))(LCodeBase, DLL_PROCESS_ATTACH, nil);
      Inc(LCallback);
    end;
  end;
end;

function PerformBaseRelocation(Module: PMemoryModule; Delta: NativeInt): Boolean;
var
  I: Cardinal;
  LCodeBase: Pointer;
  LDirectory: PIMAGE_DATA_DIRECTORY;
  LRelocation: PIMAGE_BASE_RELOCATION;
  LDest: Pointer;
  LRelInfo: ^UInt16;
  LPatchAddrHL: PDWORD;
  LPatchAddr64: PULONGLONG;
  LRelType: Integer;
  LOffset: Integer;
begin
  LCodeBase := Module.CodeBase;
  LDirectory := GET_HEADER_DICTIONARY(Module, IMAGE_DIRECTORY_ENTRY_BASERELOC);
  if LDirectory^.Size = 0 then
    Exit(Delta = 0);
  LRelocation := PIMAGE_BASE_RELOCATION(PByte(LCodeBase) + LDirectory^.VirtualAddress);
  while LRelocation.VirtualAddress > 0 do
  begin
    LDest := Pointer(NativeUInt(LCodeBase) + LRelocation.VirtualAddress);
    LRelInfo := Pointer(NativeUInt(LRelocation) + IMAGE_SIZEOF_BASE_RELOCATION);
    for I := 0 to (LRelocation.SizeOfBlock - IMAGE_SIZEOF_BASE_RELOCATION) div 2 - 1 do
    begin
      LRelType := LRelInfo^ shr 12;
      LOffset := LRelInfo^ and $FFF;
      case LRelType of
        IMAGE_REL_BASED_ABSOLUTE:;
        IMAGE_REL_BASED_HIGHLOW:
          begin
            LPatchAddrHL := PDWORD(NativeUInt(LDest) + NativeUInt(LOffset));
            Inc(LPatchAddrHL^, Delta);
          end;
        IMAGE_REL_BASED_DIR64:
          begin
            LPatchAddr64 := PULONGLONG(NativeUInt(LDest) + NativeUInt(LOffset));
            Inc(LPatchAddr64^, Delta);
          end;
      end;
      Inc(LRelInfo);
    end;
    LRelocation := PIMAGE_BASE_RELOCATION(NativeUInt(LRelocation) + LRelocation.SizeOfBlock);
  end;
  Result := True;
end;

function BuildImportTable(Module: PMemoryModule): Boolean; stdcall;
var
  LCodeBase: Pointer;
  LDirectory: PIMAGE_DATA_DIRECTORY;
  LImportDesc: PIMAGE_IMPORT_DESCRIPTOR;
  LThunkRef: PUINT_PTR;
  LFuncRef: ^FARPROC;
  LHandle: HMODULE;
  LThunkData: PIMAGE_IMPORT_BY_NAME;
begin
  LCodeBase := Module.CodeBase;
  Result := True;
  LDirectory := GET_HEADER_DICTIONARY(Module, IMAGE_DIRECTORY_ENTRY_IMPORT);
  if LDirectory^.Size = 0 then
    Exit(True);
  LImportDesc := PIMAGE_IMPORT_DESCRIPTOR(PByte(LCodeBase) + LDirectory^.VirtualAddress);
  while LImportDesc^.Name <> 0 do
  begin
    LHandle := WinAPI.Windows.LoadLibraryA(PAnsiChar(PByte(LCodeBase) + LImportDesc^.Name));
    if LHandle = 0 then
    begin
      SetLastError(ERROR_MOD_NOT_FOUND);
      Result := False;
      Break;
    end;
    try
      SetLength(Module.Modules, Module.NumModules + 1);
    except
       WinAPI.Windows.FreeLibrary(LHandle);
      SetLastError(ERROR_OUTOFMEMORY);
      Result := False;
      Break;
    end;
    Module.Modules[Module.NumModules] := LHandle;
    Inc(Module.NumModules);
    if LImportDesc^.OriginalFirstThunk <> 0 then
    begin
      LThunkRef := PUINT_PTR(PByte(LCodeBase) + LImportDesc^.OriginalFirstThunk);
      LFuncRef := Pointer(PByte(LCodeBase) + LImportDesc^.FirstThunk);
    end
    else
    begin
      LThunkRef := PUINT_PTR(PByte(LCodeBase) + LImportDesc^.FirstThunk);
      LFuncRef := Pointer(PByte(LCodeBase) + LImportDesc^.FirstThunk);
    end;
    while LThunkRef^ <> 0 do
    begin
      if IMAGE_SNAP_BY_ORDINAL(LThunkRef^) then
        LFuncRef^ :=  WinAPI.Windows.GetProcAddress(LHandle, PAnsiChar(IMAGE_ORDINAL(LThunkRef^)))
      else
      begin
        LThunkData := PIMAGE_IMPORT_BY_NAME(PByte(LCodeBase) + LThunkRef^);
        LFuncRef^ :=  WinAPI.Windows.GetProcAddress(LHandle, PAnsiChar(@LThunkData^.Name));
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
       WinAPI.Windows.FreeLibrary(LHandle);
      SetLastError(ERROR_PROC_NOT_FOUND);
      Break;
    end;
    Inc(LImportDesc);
  end;
end;

procedure MemoryFreeLibrary(const AModule: Pointer); stdcall;
var
  I: Integer;
  LDllEntry: TDllEntryProc;
  LMemModule: PMemoryModule;
begin
  if AModule = nil then Exit;
  LMemModule := PMemoryModule(AModule);
  if LMemModule^.Initialized then
  begin
    @LDllEntry := Pointer(PByte(LMemModule^.CodeBase) + LMemModule^.Headers^.OptionalHeader.AddressOfEntryPoint);
    LDllEntry(HINST(LMemModule^.CodeBase), DLL_PROCESS_DETACH, nil);
  end;
  if Length(LMemModule^.Modules) <> 0 then
  begin
    for I := 0 to LMemModule^.NumModules - 1 do
      if LMemModule^.Modules[I] <> 0 then
         WinAPI.Windows.FreeLibrary(LMemModule^.Modules[I]);
    SetLength(LMemModule^.Modules, 0);
  end;
  if LMemModule^.CodeBase <> nil then
    VirtualFree(LMemModule^.CodeBase, 0, MEM_RELEASE);
  HeapFree(GetProcessHeap(), 0, LMemModule);
end;

function MemoryLoadLibrary(const AData: Pointer): Pointer; stdcall;
var
  LDosHeader: PIMAGE_DOS_HEADER;
  LOldHeader: PIMAGE_NT_HEADERS64;
  LCode: Pointer;
  LHeaders: Pointer;
  LLocationDelta: NativeInt;
  LSysInfo: SYSTEM_INFO;
  LDllEntry: TDllEntryProc;
  LSuccessfull: Boolean;
  LModule: PMemoryModule;
begin
  Result := nil;
  LModule := nil;
  try
    LDosHeader := PIMAGE_DOS_HEADER(AData);
    if (LDosHeader^.e_magic <> IMAGE_DOS_SIGNATURE) then
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;
    LOldHeader := PIMAGE_NT_HEADERS64(PByte(AData) + LDosHeader^._lfanew);
    if LOldHeader^.Signature <> IMAGE_NT_SIGNATURE then
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;
    if LOldHeader^.FileHeader.Machine <> IMAGE_FILE_MACHINE_AMD64 then
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;
    if (LOldHeader^.OptionalHeader.SectionAlignment and 1) <> 0 then
    begin
      SetLastError(ERROR_BAD_EXE_FORMAT);
      Exit;
    end;
    LCode := VirtualAlloc(
      Pointer(LOldHeader^.OptionalHeader.ImageBase),
      LOldHeader^.OptionalHeader.SizeOfImage,
      MEM_RESERVE or MEM_COMMIT,
      PAGE_READWRITE
    );
    if LCode = nil then
    begin
      LCode := VirtualAlloc(
        nil,
        LOldHeader^.OptionalHeader.SizeOfImage,
        MEM_RESERVE or MEM_COMMIT,
        PAGE_READWRITE
      );
      if LCode = nil then
      begin
        SetLastError(ERROR_OUTOFMEMORY);
        Exit;
      end;
    end;
    LModule := PMemoryModule(HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, SizeOf(TMemoryModuleRec)));
    if LModule = nil then
    begin
      VirtualFree(LCode, 0, MEM_RELEASE);
      SetLastError(ERROR_OUTOFMEMORY);
      Exit;
    end;
    LModule^.CodeBase := LCode;
    LModule^.Headers := LOldHeader;
    GetNativeSystemInfo(LSysInfo);
    LModule^.PageSize := LSysInfo.dwPageSize;
    LHeaders := VirtualAlloc(
      LCode,
      LOldHeader^.OptionalHeader.SizeOfHeaders,
      MEM_COMMIT,
      PAGE_READWRITE
    );
    CopyMemory(
      LHeaders,
      AData,
      LOldHeader^.OptionalHeader.SizeOfHeaders
    );
    LModule^.Headers := PIMAGE_NT_HEADERS64(PByte(LHeaders) + LDosHeader^._lfanew);
    if not CopySections(AData, LOldHeader, LModule) then
      Abort;
    LLocationDelta := NativeUInt(LCode) - LOldHeader^.OptionalHeader.ImageBase;
    if LLocationDelta <> 0 then
      LModule^.IsRelocated := PerformBaseRelocation(LModule, LLocationDelta)
    else
      LModule^.IsRelocated := True;
    if not BuildImportTable(LModule) then
      Abort;
    if not FinalizeSections(LModule) then
      Abort;
    if not ExecuteTLS(LModule) then
      Abort;
    if LModule^.Headers^.OptionalHeader.AddressOfEntryPoint <> 0 then
    begin
      @LDllEntry := Pointer(PByte(LCode) + LModule^.Headers^.OptionalHeader.AddressOfEntryPoint);
      LSuccessfull := LDllEntry(HINST(LCode), DLL_PROCESS_ATTACH, nil);
      if not LSuccessfull then
      begin
        SetLastError(ERROR_DLL_INIT_FAILED);
        Abort;
      end;
      LModule^.Initialized := True;
    end;
    Result := LModule;
  except
    MemoryFreeLibrary(LModule);
    Exit;
  end;
end;

function MemoryGetProcAddress(const AModule: Pointer; const AName: PAnsiChar): Pointer; stdcall;
var
  LCodeBase: Pointer;
  LIdx: Integer;
  I: DWORD;
  LNameRef: PDWORD;
  LOrdinal: PWord;
  LExportDir: PIMAGE_EXPORT_DIRECTORY;
  LDirectory: PIMAGE_DATA_DIRECTORY;
  LTemp: PDWORD;
  LMemModule: PMemoryModule;
begin
  Result := nil;
  LMemModule := PMemoryModule(AModule);
  LCodeBase := LMemModule^.CodeBase;
  LDirectory := GET_HEADER_DICTIONARY(LMemModule, IMAGE_DIRECTORY_ENTRY_EXPORT);
  if LDirectory^.Size = 0 then
  begin
    SetLastError(ERROR_PROC_NOT_FOUND);
    Exit;
  end;
  LExportDir := PIMAGE_EXPORT_DIRECTORY(PByte(LCodeBase) + LDirectory^.VirtualAddress);
  if (LExportDir^.NumberOfNames = 0) or (LExportDir^.NumberOfFunctions = 0) then
  begin
    SetLastError(ERROR_PROC_NOT_FOUND);
    Exit;
  end;
  LNameRef := PDWORD(PByte(LCodeBase) + LExportDir^.AddressOfNames);
  LOrdinal := PWord(PByte(LCodeBase) + LExportDir^.AddressOfNameOrdinals);
  LIdx := -1;
  for I := 0 to LExportDir^.NumberOfNames - 1 do
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
  if (DWORD(LIdx) >= LExportDir^.NumberOfFunctions) then
  begin
    SetLastError(ERROR_PROC_NOT_FOUND);
    Exit;
  end;
  LTemp := PDWORD(PByte(LCodeBase) + LExportDir^.AddressOfFunctions + LIdx * SizeOf(DWORD));
  Result := Pointer(PByte(LCodeBase) + LTemp^);
end;

function LoadLibrary(const AData: Pointer): THandle;
begin
  Result := THandle(MemoryLoadLibrary(AData));
end;

function GetProcAddress(const AModule: THandle; const AName: PAnsiChar): Pointer;
begin
  Result := MemoryGetProcAddress(Pointer(AModule), AName);
end;

procedure FreeLibrary(const AModule: THandle);
begin
  MemoryFreeLibrary(Pointer(AModule));
end;

end.
