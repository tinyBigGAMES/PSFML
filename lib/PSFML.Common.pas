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

unit PSFML.Common;

{$I PSFML.inc}

interface

uses
  System.SysUtils,
  System.IOUtils,
  System.Classes,
  System.SyncObjs,
  System.Math,
  WinApi.Messages,
  WinApi.Windows,
  PSFML;

type
  { TVirtualBuffer }
  TVirtualBuffer = class(TCustomMemoryStream)
  protected
    FHandle: THandle;
    FName: string;
    procedure Clear;
  public
    constructor Create(aSize: Cardinal);
    destructor Destroy; override;
    function Write(const aBuffer; aCount: Longint): Longint; override;
    function Write(const aBuffer: TBytes; aOffset, aCount: Longint): Longint; override;
    procedure SaveToFile(aFilename: string);
    property Name: string read FName;
    function  Eob: Boolean;
    function  ReadString: WideString;
    class function LoadFromFile(const aFilename: string): TVirtualBuffer;
  end;

{ TRingBuffer }
  TRingBuffer<T> = class
  private type
    PType = ^T;
  private
    FBuffer: array of T;
    FReadIndex, FWriteIndex, FCapacity: Integer;
  public
    constructor Create(ACapacity: Integer);
    function Write(const AData: array of T; ACount: Integer): Integer;
    function Read(var AData: array of T; ACount: Integer): Integer;
    function DirectReadPointer(ACount: Integer): Pointer;
    function AvailableBytes: Integer;
    procedure Clear;
  end;

  { TVirtualRingBuffer }
  TVirtualRingBuffer<T> = class
  private type
    PType = ^T;
  private
    FBuffer: TVirtualBuffer;
    FReadIndex, FWriteIndex, FCapacity: Integer;
    function GetArrayValue(AIndex: Integer): T;
    procedure SetArrayValue(AIndex: Integer; AValue: T);
  public
    constructor Create(ACapacity: Integer);
    destructor Destroy; override;
    function Write(const AData: array of T; ACount: Integer): Integer;
    function Read(var AData: array of T; ACount: Integer): Integer;
    function DirectReadPointer(ACount: Integer): Pointer;
    function AvailableBytes: Integer;
    procedure Clear;
  end;

  { TBaseObject }
  TBaseObject = class
  public
    constructor Create(); virtual;
    destructor Destroy(); override;
  end;

function  HasConsoleOutput(): Boolean;
function  UnitToScalarValue(const aValue, aMaxValue: Double): Double;
procedure FreeNilObject(const [ref] AObject: TObject);
function  ResourceExist(const AInstance: HINST; const AResName: string): Boolean;
procedure EnterCriticalSection();
procedure LeaveCriticalSection();
function  AsUTF8(const AText: string): Pointer;
function  GetTempStaticBuffer(): PByte;
function  GetTempStaticBufferSize(): Integer;
function  GetScreenWorkAreaSize(): sfVector2i;
function  SampleTimeToPosition(SampleRate: Integer; TimeInSeconds: Double; Channels: Integer; SampleSizeInBits: Integer): Int64;
function  FloatToSmallInt(Value: Single): SmallInt; inline;
procedure ClearKeyboardBuffer();
function  WasRunFromConsole() : Boolean;
function  IsStartedFromDelphiIDE: Boolean;
function  EnableVirtualTerminalProcessing(): DWORD;

implementation

const
  CTempStaticBufferSize = 4096;

var
  CriticalSection: TCriticalSection;
  Marshaller: TMarshaller;
  TempStaticBuffer: array[0..CTempStaticBufferSize - 1] of Byte;

function HasConsoleOutput(): Boolean;
var
  LStdHandle: THandle;
begin
  LStdHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  Result := (LStdHandle <> INVALID_HANDLE_VALUE) and
            (GetFileType(LStdHandle) = FILE_TYPE_CHAR);
end;

function  UnitToScalarValue(const aValue, aMaxValue: Double): Double;
var
  LGain: Double;
  LFactor: Double;
  LVolume: Double;
begin
  LGain := (EnsureRange(aValue, 0.0, 1.0) * 50) - 50;
  LFactor := Power(10, LGain * 0.05);
  LVolume := EnsureRange(aMaxValue * LFactor, 0, aMaxValue);
  Result := LVolume;
end;

procedure FreeNilObject(const [ref] AObject: TObject);
var
  LTemp: TObject;
begin
  if not Assigned(AObject) then Exit;
  try
    CriticalSection.Enter;
    LTemp := AObject;
    TObject(Pointer(@AObject)^) := nil;
    LTemp.Free;
  finally
    CriticalSection.Leave;
  end;
end;

function ResourceExist(const AInstance: HINST; const AResName: string): Boolean;
begin
  Result := Boolean((FindResource(HInstance, PChar(AResName), RT_RCDATA) <> 0));
end;

procedure SetDefaultIcon(AWindow: HWND);
var
  IconHandle: HICON;
begin
  IconHandle := LoadIcon(HInstance, 'MAINICON');
  if IconHandle <> 0 then
  begin
    SendMessage(aWindow, WM_SETICON, ICON_BIG, IconHandle);
  end;
end;


procedure EnterCriticalSection();
begin
  CriticalSection.Enter;
end;

procedure LeaveCriticalSection();
begin
  CriticalSection.Leave;
end;

function  AsUTF8(const AText: string): Pointer;
begin
  Result := Marshaller.AsUtf8(AText).ToPointer;
end;

function  GetTempStaticBuffer: PByte;
begin
  Result := @TempStaticBuffer[0];
end;

function  GetTempStaticBufferSize(): Integer;
begin
  Result := CTempStaticBufferSize;
end;


function  GetScreenWorkAreaSize(): sfVector2i;
var
  LRect: TRect;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, LRect, 0);
  Result.X := LRect.Width;
  Result.Y := LRect.Height;
end;

function SampleTimeToPosition(SampleRate: Integer; TimeInSeconds: Double; Channels: Integer; SampleSizeInBits: Integer): Int64;
begin
  Result := Round(SampleRate * TimeInSeconds * Channels * (SampleSizeInBits div 8));
end;

function FloatToSmallInt(Value: Single): SmallInt; inline;
begin
  Result := Round(EnsureRange(Value, -1.0, 1.0) * 32767);
end;

procedure ClearKeyboardBuffer();
var
  inputRecord: TInputRecord;
  eventsRead: DWORD;
begin
  // Flush the keyboard buffer by reading all pending input events
  while PeekConsoleInput(GetStdHandle(STD_INPUT_HANDLE), inputRecord, 1,
    eventsRead) and (eventsRead > 0) do
  begin
    ReadConsoleInput(GetStdHandle(STD_INPUT_HANDLE), inputRecord, 1,
      eventsRead);
    // Optionally, you can process the input events if needed
  end;
end;

function WasRunFromConsole() : Boolean;
var
  SI: TStartupInfo;
begin
  SI.cb := SizeOf(TStartupInfo);
  GetStartupInfo(SI);
  Result := ((SI.dwFlags and STARTF_USESHOWWINDOW) = 0);
end;

function IsStartedFromDelphiIDE: Boolean;
begin
  // Check if the IDE environment variable is present
  Result := (GetEnvironmentVariable('BDS') <> '');
end;

function EnableVirtualTerminalProcessing(): DWORD;
var
  HOut: THandle;
  LMode: DWORD;
begin
  HOut := GetStdHandle(STD_OUTPUT_HANDLE);
  if HOut = INVALID_HANDLE_VALUE then
  begin
    Result := GetLastError;
    Exit;
  end;

  if not GetConsoleMode(HOut, LMode) then
  begin
    Result := GetLastError;
    Exit;
  end;

  LMode := LMode or ENABLE_VIRTUAL_TERMINAL_PROCESSING;
  if not SetConsoleMode(HOut, LMode) then
  begin
    Result := GetLastError;
    Exit;
  end;

  Result := 0;  // Success
end;

{ =========================================================================== }

{ TBuffer }
procedure TVirtualBuffer.Clear;
begin
  if (Memory <> nil) then
  begin
    if not UnmapViewOfFile(Memory) then
      raise Exception.Create('Error deallocating mapped memory');
  end;

  if (FHandle <> 0) then
  begin
    if not CloseHandle(FHandle) then
      raise Exception.Create('Error freeing memory mapping handle');
  end;
end;

constructor TVirtualBuffer.Create(aSize: Cardinal);
var
  P: Pointer;
begin
  inherited Create;
  FName := TPath.GetGUIDFileName;
  FHandle := CreateFileMapping(INVALID_HANDLE_VALUE, nil, PAGE_READWRITE, 0, aSize, PChar(FName));
  if FHandle = 0 then
    begin
      Clear;
      raise Exception.Create('Error creating memory mapping');
      FHandle := 0;
    end
  else
    begin
      P := MapViewOfFile(FHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0);
      if P = nil then
        begin
          Clear;
          raise Exception.Create('Error creating memory mapping');
        end
      else
        begin
          Self.SetPointer(P, aSize);
          Position := 0;
        end;
    end;
end;

destructor TVirtualBuffer.Destroy;
begin
  Clear;
  inherited;
end;

function TVirtualBuffer.Write(const aBuffer; aCount: Longint): Longint;
var
  Pos: Int64;
begin
  if (Position >= 0) and (aCount >= 0) then
  begin
    Pos := Position + aCount;
    if Pos > 0 then
    begin
      if Pos > Size then
      begin
        Result := 0;
        Exit;
      end;
      System.Move(aBuffer, (PByte(Memory) + Position)^, aCount);
      Position := Pos;
      Result := aCount;
      Exit;
    end;
  end;
  Result := 0;
end;

function TVirtualBuffer.Write(const aBuffer: TBytes; aOffset, aCount: Longint): Longint;
var
  Pos: Int64;
begin
  if (Position >= 0) and (aCount >= 0) then
  begin
    Pos := Position + aCount;
    if Pos > 0 then
    begin
      if Pos > Size then
      begin
        Result := 0;
        Exit;
      end;
      System.Move(aBuffer[aOffset], (PByte(Memory) + Position)^, aCount);
      Position := Pos;
      Result := aCount;
      Exit;
    end;
  end;
  Result := 0;
end;

procedure TVirtualBuffer.SaveToFile(aFilename: string);
var
  LStream: TFileStream;
begin
  LStream := TFile.Create(aFilename);
  try
    LStream.Write(Memory^, Size);
  finally
    LStream.Free;
  end;
end;

class function TVirtualBuffer.LoadFromFile(const aFilename: string): TVirtualBuffer;
var
  LStream: TStream;
  LBuffer: TVirtualBuffer;
begin
  Result := nil;
  if aFilename.IsEmpty then Exit;
  if not TFile.Exists(aFilename) then Exit;
  LStream := TFile.OpenRead(aFilename);
  try
    LBuffer := TVirtualBuffer.Create(LStream.Size);
    if LBuffer <> nil then
    begin
      LBuffer.CopyFrom(LStream);
    end;
  finally
    FreeAndNil(LStream);
  end;
  Result := LBuffer;
end;

function  TVirtualBuffer.Eob: Boolean;
begin
  Result := Boolean(Position >= Size);
end;

function  TVirtualBuffer.ReadString: WideString;
var
  LLength: LongInt;
begin
  Read(LLength, SizeOf(LLength));
  SetLength(Result, LLength);
  if LLength > 0 then Read(Result[1], LLength * SizeOf(Char));
end;

{ TRingBuffer }
constructor TRingBuffer<T>.Create(ACapacity: Integer);
begin
  SetLength(FBuffer, ACapacity);
  FReadIndex := 0;
  FWriteIndex := 0;
  FCapacity := ACapacity;
  Clear;
end;

function TRingBuffer<T>.Write(const AData: array of T;
  ACount: Integer): Integer;
var
  i, WritePos: Integer;
begin
  EnterCriticalSection;
  try
    for i := 0 to ACount - 1 do
    begin
      WritePos := (FWriteIndex + i) mod FCapacity;
      FBuffer[WritePos] := AData[i];
    end;
    FWriteIndex := (FWriteIndex + ACount) mod FCapacity;
    Result := ACount;
  finally
    LeaveCriticalSection;
  end;
end;

function TRingBuffer<T>.Read(var AData: array of T; ACount: Integer): Integer;
var
  i, ReadPos: Integer;
begin
  for i := 0 to ACount - 1 do
  begin
    ReadPos := (FReadIndex + i) mod FCapacity;
    AData[i] := FBuffer[ReadPos];
  end;
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
  Result := ACount;
end;

function TRingBuffer<T>.DirectReadPointer(ACount: Integer): Pointer;
begin
  Result := @FBuffer[FReadIndex mod FCapacity];
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
end;

function TRingBuffer<T>.AvailableBytes: Integer;
begin
  Result := (FCapacity + FWriteIndex - FReadIndex) mod FCapacity;
end;

procedure TRingBuffer<T>.Clear;
var
  I: Integer;
begin

  EnterCriticalSection;
  try
    for I := Low(FBuffer) to High(FBuffer) do
    begin
      FBuffer[I] := Default(T);
    end;
    FReadIndex := 0;
    FWriteIndex := 0;
  finally
    LeaveCriticalSection;
  end;
end;

{ TVirtualRingBuffer }
function TVirtualRingBuffer<T>.GetArrayValue(AIndex: Integer): T;
begin
  Result := PType(PByte(FBuffer.Memory) + AIndex * SizeOf(T))^;
end;

procedure TVirtualRingBuffer<T>.SetArrayValue(AIndex: Integer; AValue: T);
begin
  PType(PByte(FBuffer.Memory) + AIndex * SizeOf(T))^ := AValue;
end;

constructor TVirtualRingBuffer<T>.Create(ACapacity: Integer);
begin
  FBuffer := TVirtualBuffer.Create(ACapacity*SizeOf(T));
  FReadIndex := 0;
  FWriteIndex := 0;
  FCapacity := ACapacity;
  Clear;
end;

destructor TVirtualRingBuffer<T>.Destroy;
begin
  FBuffer.Free;
  inherited;
end;

function TVirtualRingBuffer<T>.Write(const AData: array of T;
  ACount: Integer): Integer;
var
  i, WritePos: Integer;
begin
  EnterCriticalSection;
  try
    for i := 0 to ACount - 1 do
    begin
      WritePos := (FWriteIndex + i) mod FCapacity;
      SetArrayValue(WritePos, AData[i]);
    end;
    FWriteIndex := (FWriteIndex + ACount) mod FCapacity;
    Result := ACount;
  finally
    LeaveCriticalSection;
  end;
end;

function TVirtualRingBuffer<T>.Read(var AData: array of T; ACount: Integer): Integer;
var
  i, ReadPos: Integer;
begin
  for i := 0 to ACount - 1 do
  begin
    ReadPos := (FReadIndex + i) mod FCapacity;
    AData[i] := GetArrayValue(ReadPos);
  end;
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
  Result := ACount;
end;

function TVirtualRingBuffer<T>.DirectReadPointer(ACount: Integer): Pointer;
begin
  Result := PType(PByte(FBuffer.Memory) + (FReadIndex mod FCapacity) * SizeOf(T));
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
end;

function TVirtualRingBuffer<T>.AvailableBytes: Integer;
begin
  Result := (FCapacity + FWriteIndex - FReadIndex) mod FCapacity;
end;

procedure TVirtualRingBuffer<T>.Clear;
var
  I: Integer;
begin

  EnterCriticalSection;
  try
    for I := 0 to FCapacity-1 do
    begin
     SetArrayValue(I, Default(T));
    end;

    FReadIndex := 0;
    FWriteIndex := 0;
  finally
    LeaveCriticalSection;
  end;
end;

{ TBaseObject }
constructor TBaseObject.Create();
begin
  inherited;
end;

destructor TBaseObject.Destroy();
begin
  inherited;
end;

{$REGION ' UNIT INIT '}
var
  InputCodePage: Cardinal;
  OutputCodePage: Cardinal;

initialization
begin
  // save current console codepage
  InputCodePage := GetConsoleCP();
  OutputCodePage := GetConsoleOutputCP();

  // set code page to UTF8
  SetConsoleCP(CP_UTF8);
  SetConsoleOutputCP(CP_UTF8);

  // init critical section
  CriticalSection := TCriticalSection.Create;

  // init virtual terminal processing
  EnableVirtualTerminalProcessing();
end;

finalization
begin
  // free critical section
  FreeAndNil(CriticalSection);

  // restore code page
  SetConsoleCP(InputCodePage);
  SetConsoleOutputCP(OutputCodePage);
end;
{$ENDREGION}

end.
