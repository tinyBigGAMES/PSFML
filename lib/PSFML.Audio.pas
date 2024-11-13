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

unit PSFML.Audio;

interface

{$I PSFML.inc}

uses
  System.SysUtils,
  System.Generics.Collections,
  PSFML,
  PSFML.Ext,
  PSFML.Math;

const
  // Audio Constants
  sfAudioBufferCount    = 256;
  sfAudioChannelCount   = 16;
  sfAudioDynamicChannel = -1;
  sfAudioInvalidIndex   = -2;

{ Init }
procedure sfAudio_open(); cdecl;
procedure sfAudio_close(); cdecl;
procedure sfAudio_pause(aPause: Boolean); cdecl;
procedure sfAudio_reset(); cdecl;

{ Music }
function  sfAudio_loadMusic(var AInputStream: PsfInputStream; const AFilename: string): Integer; cdecl; overload;
function  sfAudio_loadMusic(const AZipFilename, AFilename: string; const APassword: string=sfZipFileDefaultPassword): Integer; cdecl; overload;
procedure sfAudio_unloadMusic(var AMusic: Integer); cdecl;
procedure sfAudio_unloadAllMusic(); cdecl;
procedure sfAudio_playMusic(const AMusic: Integer); cdecl; overload;
procedure sfAudio_playMusic(const AMusic: Integer; const AVolume: Single; const ALoop: Boolean); cdecl; overload;
procedure sfAudio_stopMusic(const AMusic: Integer); cdecl;
procedure sfAudio_pauseMusic(const AMusic: Integer); cdecl;
procedure sfAudio_pauseAllMusic(const APause: Boolean); cdecl;
procedure sfAudio_setMusicLoop(const AMusic: Integer; const ALoop: Boolean); cdecl;
function  sfAudio_getMusicLoop(const AMusic: Integer): Boolean; cdecl;
procedure sfAudio_setMusicVolume(const AMusic: Integer; const AVolume: Single); cdecl;
function  sfAudio_getMusicVolume(const AMusic: Integer): Single; cdecl;
function  sfAudio_getMusicStatus(const AMusic: Integer): sfSoundStatus; cdecl;
procedure sfAudio_setMusicOffset(const AMusic: Integer; const ASeconds: Single); cdecl;

{ Sound }
function  sfAudio_loadSound(var AInputStream: PsfInputStream; const AFilename: string): Integer; cdecl; overload;
function  sfAudio_loadSound(const AZipFilename, AFilename: string; const APassword: string=sfZipFileDefaultPassword): Integer; cdecl; overload;
procedure sfAudio_unloadSound(const ASound: Integer); cdecl;
function  sfAudio_playSound(const AChannel, ASound: Integer): Integer; cdecl; overload;
function  sfAudio_playSound(const AChannel, ASound: Integer; const AVolume: Single; const ALoop: Boolean): Integer; cdecl; overload;

{ Channel }
procedure sfAudio_setChannelReserved(const AChannel: Integer; const AReserve: Boolean); cdecl;
function  sfAudio_getChannelReserved(const AChannel: Integer): Boolean; cdecl;
procedure sfAudio_pauseChannel(const AChannel: Integer; const APause: Boolean); cdecl;
function  sfAudio_getChannelStatus(const AChannel: Integer): sfSoundStatus; cdecl;
procedure sfAudio_setChannelVolume(const AChannel: Integer; const AVolume: Single); cdecl;
function  sfAudio_getChannelVolume(const AChannel: Integer): Single; cdecl;
procedure sfAudio_setChannelLoop(const AChannel: Integer; const ALoop: Boolean); cdecl;
function  sfAudio_getChannelLoop(const AChannel: Integer): Boolean; cdecl;
procedure sfAudio_setChannelPitch(const AChannel: Integer; const APitch: Single); cdecl;
function  sfAudio_getChannelPitch(const AChannel: Integer): Single; cdecl;
procedure sfAudio_setChannelPosition(const AChannel: Integer; const X, Y: Single); cdecl;
procedure sfAudio_getChannelPosition(const AChannel: Integer; var X: Single; var Y: Single); cdecl;
procedure sfAudio_setChannelMinDistance(const AChannel: Integer; const ADistance: Single); cdecl;
function  sfAudio_getChannelMinDistance(const AChannel: Integer): Single; cdecl;
procedure sfAudio_setChannelRelativeToListener(const AChannel: Integer; const ARelative: Boolean); cdecl;
function  sfAudio_getChannelRelativeToListener(const AChannel: Integer): Boolean; cdecl;
procedure sfAudio_setChannelAttenuation(const AChannel: Integer; const AAttenuation: Single); cdecl;
function  sfAudio_getChannelAttenuation(const AChannel: Integer): Single; cdecl;
procedure sfAudio_stopChannel(const AChannel: Integer); cdecl;
procedure sfAudio_stopAllChannels(); cdecl;

{ Listener }
procedure sfAudio_setListenerGlobalVolume(const AVolume: Single); cdecl;
function  sfAudio_getListenerGlobalVolume(): Single; cdecl;
procedure sfAudio_setListenerPosition(const X, Y: Single); cdecl;
procedure sfAudio_getListenerPosition(var X: Single; var Y: Single); cdecl;

implementation

type
  { TsfAudio }
  TsfAudio = record
  type
    { TMusicItem }
    TMusicItem = record
      Handle: PsfMusic;
      Stream: PsfInputStream;
      Size: Int64;
      Filename: string;
    end;

    { TAudioChannel }
    TAudioChannel = record
      Sound: PsfSound;
      Reserved: Boolean;
      Priority: Byte;
    end;

    { TAudioBuffer }
    TAudioBuffer = record
      Buffer: PsfSoundBuffer;
      Filename: string;
    end;
  var
    FMusicList: TList<TMusicItem>;
    FBuffer: array [0 .. sfAudioBufferCount - 1] of TAudioBuffer;
    FChannel: array [0 .. sfAudioChannelCount - 1] of TAudioChannel;
    FOpened: Boolean;
  end;

var
  sfAudio: TsfAudio;

function TimeAsSeconds(aValue: Single): sfTime;
begin
  Result.MicroSeconds := Round(aValue * 1000000);
end;

function GetMusicItem(var aMusicItem: TsfAudio.TMusicItem; aMusic: Integer): Boolean;
begin
  // assume false
  Result := False;

  // check for valid music id
  if (aMusic < 0) or (aMusic > sfAudio.FMusicList.Count-1) then Exit;

  // get item
  aMusicItem := sfAudio.FMusicList.Items[aMusic];

  // check if valid
  if aMusicItem.Handle = nil then
    Result := False
  else
    // return true
    Result := True;
end;

function AddMusicItem(var aMusicItem: TsfAudio.TMusicItem): Integer;
var
  LIndex: Integer;
  LItem: TsfAudio.TMusicItem;
begin
  Result := sfAudioInvalidIndex;
  for LIndex := 0 to sfAudio.FMusicList.Count-1 do
  begin
    LItem := sfAudio.FMusicList.Items[LIndex];
    if LItem.Handle = nil then
    begin
      sfAudio.FMusicList.Items[LIndex] := aMusicItem;
      Result := LIndex;
      Exit;
    end;
  end;

  if Result = sfAudioInvalidIndex then
  begin
    Result := sfAudio.FMusicList.Add(aMusicItem);
  end;
end;

function FindFreeBuffer(aFilename: string): Integer;
var
  LI: Integer;
begin
  Result := sfAudioInvalidIndex;
  for LI := 0 to sfAudioBufferCount - 1 do
  begin
    if sfAudio.FBuffer[LI].Filename = aFilename then
    begin
      Exit;
    end;

    if sfAudio.FBuffer[LI].Buffer = nil then
    begin
      Result := LI;
      Break;
    end;
  end;
end;

function FindFreeChannel: Integer;
var
  I: Integer;
begin
  Result := sfAudioInvalidIndex;
  for I := 0 to sfAudioChannelCount - 1 do
  begin
    if not Assigned(sfAudio.FChannel[I].Sound) then
      begin
        if not sfAudio.FChannel[I].Reserved then
        begin
          Result := I;
          Exit;
        end;
      end
    else
      if sfSound_getStatus(sfAudio.FChannel[I].Sound) = sfStopped then
      begin
        if not sfAudio.FChannel[I].Reserved then
        begin
          Result := I;
          Exit;
        end;
      end;
  end;
end;

procedure sfAudio_open();
var
  I: Integer;
  LVec: sfVector3f;
begin
  if sfAudio.FOpened then Exit;

  FillChar(sfAudio.FBuffer, SizeOf(sfAudio.FBuffer), 0);
  FillChar(sfAudio.FChannel, SizeOf(sfAudio.FChannel), 0);
  sfAudio.FOpened := False;

  // init music list
  sfAudio.FMusicList := TList<TsfAudio.TMusicItem>.Create;

  // init channels
  for I := 0 to sfAudioChannelCount - 1 do
  begin
    sfAudio.FChannel[I].Sound := nil;
    sfAudio.FChannel[I].Reserved := False;
    sfAudio.FChannel[I].Priority := 0;
  end;

  // init buffers
  for I := 0 to sfAudioBufferCount - 1 do
  begin
    sfAudio.FBuffer[I].Buffer := nil;
  end;

  sfListener_setGlobalVolume(100);

  LVec.X := 0; LVec.Y := 0; LVec.Z := 0;
  sfListener_setPosition(LVec);

  LVec.X := 0; LVec.Y := 0; LVec.Z := -1;
  sfListener_setDirection(LVec);

  LVec.X := 0; LVec.Y := 1; LVec.Z := 0;
  sfListener_setUpVector(LVec);

  sfAudio.FOpened := True;

end;

procedure sfAudio_close();
var
  I: Integer;
begin
  if not sfAudio.FOpened then Exit;

  // shutdown music
  sfAudio_unloadAllMusic();
  FreeAndNil(sfAudio.FMusicList);

  // shutdown channels
  for I := 0 to sfAudioChannelCount - 1 do
  begin
    if sfAudio.FChannel[I].Sound <> nil then
    begin
      sfSound_destroy(sfAudio.FChannel[I].Sound);
      sfAudio.FChannel[I].Reserved := False;
      sfAudio.FChannel[I].Priority := 0;
      sfAudio.FChannel[I].Sound := nil;
    end;
  end;

  // shutdown buffers
  for I := 0 to sfAudioBufferCount - 1 do
  begin
    if sfAudio.FBuffer[I].Buffer <> nil then
    begin
      sfSoundBuffer_destroy(sfAudio.FBuffer[I].Buffer);
      sfAudio.FBuffer[I].Buffer := nil;
    end;
  end;

  FillChar(sfAudio.FBuffer, SizeOf(sfAudio.FBuffer), 0);
  FillChar(sfAudio.FChannel, SizeOf(sfAudio.FChannel), 0);
  sfAudio.FOpened := False;

end;

procedure sfAudio_pause(aPause: Boolean);
var
  I: Integer;
begin
  if not sfAudio.FOpened then Exit;

  sfAudio_pauseAllMusic(aPause);

  // pause channel
  for I := 0 to sfAudioChannelCount - 1 do
  begin
    sfAudio_PauseChannel(I, aPause);
  end;
end;

procedure sfAudio_reset();
begin
end;

//TODO: check of music is already loaded
function sfAudio_loadMusic(var AInputStream: PsfInputStream; const AFilename: string): Integer;
var
  LItem: TsfAudio.TMusicItem;
begin
  Result := sfAudioInvalidIndex;

  if not sfAudio.FOpened then
  begin
    sfInputStream_close(AInputStream);
    Exit;
  end;

  if AFilename.IsEmpty then
  begin
    sfInputStream_close(AInputStream);
    Exit;
  end;

  if not Assigned(AInputStream) then
  begin
    sfInputStream_close(AInputStream);
    Exit;
  end;

  LItem.Stream := AInputStream;
  LItem.Handle := sfMusic_createFromStream(LItem.Stream);
  if not Assigned(LItem.Handle) then
  begin
    sfInputStream_close(AInputStream);
    Exit;
  end;
  LItem.Size := sfInputStream_getSize(LItem.Stream);
  LItem.Filename := AFilename;

  // add to list
  Result := AddMusicItem(LItem);

  AInputStream := nil;
end;

function  sfAudio_loadMusic(const AZipFilename, AFilename: string; const APassword: string): Integer;
var
  LInputStream: PsfInputStream;
begin
  Result := sfAudioInvalidIndex;
  LInputStream := sfInputStream_createFromZipFile(AZipFilename, AFilename, APassword);
  if not Assigned(LInputStream) then Exit;
  Result := sfAudio_loadMusic(LInputStream, AFilename);
end;

procedure sfAudio_unloadMusic(var AMusic: Integer);
var
  LItem: TsfAudio.TMusicItem;
begin
  if not sfAudio.FOpened then Exit;

  // check for valid music id
  if not GetMusicItem(LItem, AMusic) then Exit;

  // stop music
  sfAudio_stopMusic(AMusic);

  // free music handle
  sfMusic_destroy(LItem.Handle);

  // free music buffer
  if Assigned(LItem.Stream) then
    sfInputStream_close(LItem.Stream);

  // clear item data
  LItem.Handle := nil;
  LItem.Size := 0;
  LItem.Stream := nil;
  LItem.Filename := '';
  sfAudio.FMusicList.Items[AMusic] := LItem;

  // return handle as invalid
  AMusic := sfAudioInvalidIndex;
end;

procedure sfAudio_unloadAllMusic();
var
  LIndex: Integer;
  LMusic: Integer;
begin
  if not sfAudio.FOpened then Exit;

  for LIndex := 0 to sfAudio.FMusicList.Count-1 do
  begin
    LMusic := LIndex;
    sfAudio_stopMusic(LMusic);
    sfAudio_unloadMusic(LMusic);
  end;
end;

procedure sfAudio_playMusic(const AMusic: Integer);
var
  LItem: TsfAudio.TMusicItem;
begin
  if not sfAudio.FOpened then Exit;

  // check for valid music id
  if not GetMusicItem(LItem, AMusic) then Exit;

  // play music
  sfMusic_play(LItem.Handle);
end;

procedure sfAudio_playMusic(const AMusic: Integer; const AVolume: Single; const ALoop: Boolean);
begin
  if not sfAudio.FOpened then Exit;
  sfAudio_playMusic(AMusic);
  sfAudio_setMusicVolume(AMusic, AVolume);
  sfAudio_setMusicLoop(AMusic, ALoop);
end;

procedure sfAudio_stopMusic(const AMusic: Integer);
var
  LItem: TsfAudio.TMusicItem;
begin
  if not sfAudio.FOpened then Exit;

  // check for valid music id
  if not GetMusicItem(LItem, AMusic) then Exit;

  // stop music playing
  sfMusic_stop(LItem.Handle);
end;

procedure sfAudio_pauseMusic(const AMusic: Integer);
var
  LItem: TsfAudio.TMusicItem;
begin
  if not sfAudio.FOpened then Exit;

  // check for valid music id
  if not GetMusicItem(LItem, AMusic) then Exit;

  // pause audio
  sfMusic_pause(LItem.Handle);
end;

procedure sfAudio_pauseAllMusic(const APause: Boolean);
var
  LItem: TsfAudio.TMusicItem;
  LIndex: Integer;
begin
  if not sfAudio.FOpened then Exit;

  for LIndex := 0 to sfAudio.FMusicList.Count-1 do
  begin
    if GetMusicItem(LItem, LIndex) then
    begin
      if APause then
        sfAudio_pauseMusic(LIndex)
      else
        sfAudio_playMusic(LIndex);
    end;
  end;
end;

procedure sfAudio_setMusicLoop(const AMusic: Integer; const ALoop: Boolean);
var
  LItem: TsfAudio.TMusicItem;
begin
  if not sfAudio.FOpened then Exit;

  // check for valid music id
  if not GetMusicItem(LItem, AMusic) then Exit;

  // set music loop status
  sfMusic_setLooping(LItem.Handle, ALoop);
end;

function sfAudio_getMusicLoop(const AMusic: Integer): Boolean;
var
  LItem: TsfAudio.TMusicItem;
begin
  Result := False;

  if not sfAudio.FOpened then Exit;

  // check for valid music id
  if not GetMusicItem(LItem, AMusic) then Exit;

  // get music loop status
  Result := sfMusic_isLooping(LItem.Handle);
end;

procedure sfAudio_setMusicVolume(const AMusic: Integer; const AVolume: Single);
var
  LVol: Single;
  LItem: TsfAudio.TMusicItem;
begin
  if not sfAudio.FOpened then Exit;

  // check for valid music id
  if not GetMusicItem(LItem, AMusic) then Exit;

  LVol := sfUnit_toScalarValue(AVolume, 100);

  // set music volume
  sfMusic_setVolume(LItem.Handle, LVol);
end;

function sfAudio_getMusicVolume(const AMusic: Integer): Single;
var
  LItem: TsfAudio.TMusicItem;
begin
  Result := 0;
  if not sfAudio.FOpened then Exit;
  if not GetMusicItem(LItem, AMusic) then Exit;
  Result := sfMusic_getVolume(LItem.Handle);
  Result := Result / 100;
end;

function sfAudio_getMusicStatus(const AMusic: Integer): sfSoundStatus;
var
  LItem: TsfAudio.TMusicItem;
begin
  Result := sfStopped;
  if not sfAudio.FOpened then Exit;
  if not GetMusicItem(LItem, AMusic) then Exit;
  Result := sfMusic_getStatus(LItem.Handle);
end;

procedure sfAudio_setMusicOffset(const AMusic: Integer; const ASeconds: Single);
var
  LItem: TsfAudio.TMusicItem;
begin
  if not sfAudio.FOpened then Exit;
  if not GetMusicItem(LItem, AMusic) then Exit;
  sfMusic_setPlayingOffset(LItem.Handle, TimeAsSeconds(ASeconds));
end;

procedure sfAudio_setChannelReserved(const AChannel: Integer; const AReserve: Boolean);
begin
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  sfAudio.FChannel[AChannel].Reserved := AReserve;
end;

function sfAudio_getChannelReserved(const AChannel: Integer): Boolean;
begin
  Result := False;
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then  Exit;
  Result := sfAudio.FChannel[AChannel].Reserved;
end;

function sfAudio_loadSound(var AInputStream: PsfInputStream; const AFilename: string): Integer;
var
  I: Integer;
begin
  Result := sfAudioInvalidIndex;
   if not sfAudio.FOpened then
   begin
     sfInputStream_close(AInputStream);
     Exit;
   end;

  if AFilename.IsEmpty then
  begin
     sfInputStream_close(AInputStream);
    Exit;
  end;

  if not Assigned(AInputStream) then
  begin
     sfInputStream_close(AInputStream);
    Exit;
  end;

  I := FindFreeBuffer(AFilename);
  if I = sfAudioInvalidIndex then
  begin
    sfInputStream_close(AInputStream);
    Exit;
  end;
  sfAudio.FBuffer[I].Buffer := sfSoundBuffer_createFromStream(AInputStream);

  if sfAudio.FBuffer[I].Buffer = nil then
  begin
    sfInputStream_close(AInputStream);
    Exit;
  end;

  sfAudio.FBuffer[I].Filename := AFilename;

  sfInputStream_close(AInputStream);

  Result := I;
end;

function  sfAudio_loadSound(const AZipFilename, AFilename: string; const APassword: string): Integer;
var
  LInputStream: PsfInputStream;
begin
  Result := sfAudioInvalidIndex;
  LInputStream := sfInputStream_createFromZipFile(AZipFilename, AFilename, APassword);
  if not Assigned(LInputStream) then Exit;
  Result := sfAudio_loadSound(LInputStream, AFilename);
end;

procedure sfAudio_unloadSound(const ASound: Integer);
var
  LBuff: PsfSoundBuffer;
  LSnd: PsfSound;
  I: Integer;
begin
  if not sfAudio.FOpened then Exit;

  if (ASound < 0) or (ASound > sfAudioBufferCount - 1) then  Exit;
  LBuff := sfAudio.FBuffer[ASound].Buffer;
  if LBuff = nil then Exit;

  // stop all channels playing this buffer
  for I := 0 to sfAudioChannelCount - 1 do
  begin
    LSnd := sfAudio.FChannel[I].Sound;
    if LSnd <> nil then
    begin
      if sfSound_getBuffer(LSnd) = LBuff then
      begin
        sfSound_stop(LSnd);
        sfSound_destroy(LSnd);
        sfAudio.FChannel[I].Sound := nil;
        sfAudio.FChannel[I].Reserved := False;
        sfAudio.FChannel[I].Priority := 0;
      end;
    end;
  end;

  // destroy this buffer
  sfSoundBuffer_destroy(LBuff);
  sfAudio.FBuffer[ASound].Buffer := nil;
  sfAudio.FBuffer[ASound].Filename := '';
end;

function sfAudio_playSound(const AChannel, ASound: Integer): Integer;
var
  I: Integer;
  LVec: sfVector3f;
begin
  Result := sfAudioInvalidIndex;
  if not sfAudio.FOpened then Exit;

  // check if sound is in range
  if (ASound < 0) or (ASound > sfAudioBufferCount - 1) then Exit;

  // check if channel is in range
  I := AChannel;
  if I = sfAudioDynamicChannel then I := FindFreeChannel
  else if (I < 0) or (I > sfAudioChannelCount - 1) then Exit;

  // play sound

  if not Assigned(sfAudio.FChannel[I].Sound) then
    sfAudio.FChannel[I].Sound := sfSound_create(sfAudio.FBuffer[ASound].Buffer)
  else
    sfSound_setBuffer(sfAudio.FChannel[I].Sound, sfAudio.FBuffer[ASound].Buffer);

  sfSound_play(sfAudio.FChannel[I].Sound);

  sfSound_setLooping(sfAudio.FChannel[I].Sound, False);
  sfSound_setPitch(sfAudio.FChannel[I].Sound, 1);
  sfSound_setVolume(sfAudio.FChannel[I].Sound, 100);

  LVec.X := 0; LVec.Y := 0; LVec.Z := 0;
  sfSound_setPosition(sfAudio.FChannel[I].Sound, LVec);

  sfSound_setRelativeToListener(sfAudio.FChannel[I].Sound, False);
  sfSound_setMinDistance(sfAudio.FChannel[I].Sound, 1);
  sfSound_setAttenuation(sfAudio.FChannel[I].Sound, 0);

  Result := I;
end;

function sfAudio_playSound(const AChannel, ASound: Integer; const AVolume: Single; const ALoop: Boolean): Integer;
begin
  Result := sfAudioInvalidIndex;
  if not sfAudio.FOpened then Exit;

  Result := sfAudio_PlaySound(AChannel, ASound);
  sfAudio_setChannelVolume(Result, AVolume);
  sfAudio_setChannelLoop(Result, ALoop);
end;

procedure sfAudio_pauseChannel(const AChannel: Integer; const APause: Boolean);
var
  LStatus: sfSoundStatus;
begin
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;

  LStatus := sfSound_getStatus(sfAudio.FChannel[AChannel].Sound);

  case APause of
    False:
      begin
        if LStatus = sfPaused then
          sfSound_play(sfAudio.FChannel[AChannel].Sound);
      end;
    True:
      begin
        if LStatus = sfPlaying then
          sfSound_pause(sfAudio.FChannel[AChannel].Sound);
      end;
  end;
end;

function sfAudio_getChannelStatus(const AChannel: Integer): sfSoundStatus;
begin
  Result := sfStopped;
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;
  Result := sfSound_getStatus(sfAudio.FChannel[AChannel].Sound);
end;

procedure sfAudio_setChannelVolume(const AChannel: Integer; const AVolume: Single);
var
  LVolume: Single;
begin
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;

  LVolume := sfUnit_toScalarValue(AVolume, 100);

  sfSound_setVolume(sfAudio.FChannel[AChannel].Sound, LVolume);
end;

function sfAudio_getChannelVolume(const AChannel: Integer): Single;
begin
  Result := 0;
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;

  Result := sfSound_getVolume(sfAudio.FChannel[AChannel].Sound);
  Result := Result / 100;
end;

procedure sfAudio_setChannelLoop(const AChannel: Integer; const ALoop: Boolean);
begin
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;

  sfSound_setLooping(sfAudio.FChannel[AChannel].Sound, ALoop);
end;

function sfAudio_getChannelLoop(const AChannel: Integer): Boolean;
begin
  Result := False;
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;

  Result := sfSound_isLooping(sfAudio.FChannel[AChannel].Sound);
end;

procedure sfAudio_setChannelPitch(const AChannel: Integer; const APitch: Single);
begin
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;

  sfSound_setPitch(sfAudio.FChannel[AChannel].Sound, APitch);
end;

function sfAudio_getChannelPitch(const AChannel: Integer): Single;
begin
  Result := 0;
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then  Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;

  Result := sfSound_getPitch(sfAudio.FChannel[AChannel].Sound);
end;

procedure sfAudio_setChannelPosition(const AChannel: Integer; const X, Y: Single);
var
  LVec: sfVector3f;
begin
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;

  LVec.X := X;
  LVec.Y := 0;
  LVec.Z := Y;
  sfSound_setPosition(sfAudio.FChannel[AChannel].Sound, LVec);
end;

procedure sfAudio_getChannelPosition(const AChannel: Integer; var X: Single; var Y: Single);
var
  LVec: sfVector3f;
begin
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;

  LVec := sfSound_getPosition(sfAudio.FChannel[AChannel].Sound);
  X := LVec.X;
  Y := LVec.Z;
end;

procedure sfAudio_setChannelMinDistance(const AChannel: Integer; const ADistance: Single);
var
  LDistance: Single;
begin
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  LDistance := ADistance;
  if LDistance < 1 then  LDistance := 1;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;
  sfSound_setMinDistance(sfAudio.FChannel[AChannel].Sound, LDistance);
end;

function sfAudio_getChannelMinDistance(const AChannel: Integer): Single;
begin
  Result := 0;
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;
  Result := sfSound_getMinDistance(sfAudio.FChannel[AChannel].Sound);
end;

procedure sfAudio_setChannelRelativeToListener(const AChannel: Integer; const ARelative: Boolean);
begin
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;
  sfSound_setRelativeToListener(sfAudio.FChannel[AChannel].Sound, ARelative);
end;

function sfAudio_getChannelRelativeToListener(const AChannel: Integer): Boolean;
begin
  Result := False;
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;
  Result := Boolean(sfSound_isRelativeToListener(sfAudio.FChannel[AChannel].Sound));
end;

procedure sfAudio_setChannelAttenuation(const AChannel: Integer; const AAttenuation: Single);
begin
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then  Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;
  sfSound_setAttenuation(sfAudio.FChannel[AChannel].Sound, AAttenuation);
end;

function sfAudio_getChannelAttenuation(const AChannel: Integer): Single;
begin
  Result := 0;
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;
  Result := sfSound_getAttenuation(sfAudio.FChannel[AChannel].Sound);
end;

procedure sfAudio_stopChannel(const AChannel: Integer);
begin
  if not sfAudio.FOpened then Exit;
  if (AChannel < 0) or (AChannel > sfAudioChannelCount - 1) then Exit;
  if not Assigned(sfAudio.FChannel[AChannel].Sound) then Exit;
  sfSound_stop(sfAudio.FChannel[AChannel].Sound);
end;

procedure sfAudio_stopAllChannels;
var
  I: Integer;
begin
  if not sfAudio.FOpened then Exit;
  for I := 0 to sfAudioChannelCount-1 do
  begin
    if Assigned(sfAudio.FChannel[I].Sound) then
      sfSound_stop(sfAudio.FChannel[I].Sound);
  end;
end;

procedure sfAudio_setListenerGlobalVolume(const AVolume: Single);
var
  LVolume: Single;
begin
  if not sfAudio.FOpened then Exit;

  LVolume := sfUnit_toScalarValue(AVolume, 100);

  sfListener_setGlobalVolume(LVolume);
end;

function sfAudio_getListenerGlobalVolume: Single;
begin
  Result := 0;
  if not sfAudio.FOpened then Exit;
  Result := sfListener_getGlobalVolume();
  Result := Result / 100;
end;

procedure sfAudio_setListenerPosition(const X, Y: Single);
var
  LVec: sfVector3f;
begin
  if not sfAudio.FOpened then Exit;
  LVec.X := X;
  LVec.Y := 0;
  LVec.Z := Y;
  sfListener_setPosition(LVec);
end;

procedure sfAudio_getListenerPosition(var X: Single; var Y: Single);
var
  LVec: sfVector3f;
begin
  if not sfAudio.FOpened then Exit;
  LVec := sfListener_getPosition;
  X := LVec.X;
  Y := LVec.Z;
end;

{$REGION ' UNIT INIT '}
initialization
begin
  sfAudio := Default(TsfAudio);
end;

finalization
begin
  sfAudio_close();
end;
{$ENDREGION}

end.
