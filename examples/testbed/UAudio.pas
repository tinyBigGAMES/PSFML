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

unit UAudio;

interface

procedure Test01();
procedure Test02();
procedure Test03();

implementation

uses
  System.SysUtils,
  System.IOUtils,
  PSFML,
  PSFML.Ext,
  PSFML.Math,
  PSFML.Audio,
  UCommon;

procedure Test01();
var
  LWindow: PsfRenderWindow;
  LEvent: sfEvent;
  LFont: array[0..0] of PsfFont;
  LText: array[0..0] of PsfText;
  LHudPos: sfVector2f;
  LFilename: string;
  LSongNum: Integer;
  LMusic: Integer;

  procedure Play(aNum: Integer; aVol: Single);
  begin
    LFilename := Format('res/music/song%.*d.ogg', [2,aNum]);
    sfAudio_unloadMusic(LMusic);
    LMusic := sfAudio_loadMusic(CZipFilename, LFilename);
    sfAudio_playMusic(LMusic, aVol, True);
  end;

begin
  LWindow := sfRenderWindow_create('PSFML: Audio #01');

  LFont[0] := sfFont_CreateDefaultFont();
  sfFont_SetSmooth(LFont[0], True);

  LText[0] := sfText_Create(LFont[0]);
  sfText_SetCharacterSize(LWindow, LText[0], 12);

  sfAudio_open();
  LSongNum := 1;
  LFilename := '';
  LMusic := -1;
  Play(1, 1.0);

  sfRenderWindow_clear(LWindow, BLACK);
  sfRenderWindow_clearFrame(LWindow, DARKSLATEBROWN);

  while sfRenderWindow_isOpen(LWindow) do
  begin

    while sfRenderWindow_pollEvent(LWindow, @LEvent) do
    begin
      case LEvent.&type of
        sfEvtClosed:
        begin
          sfRenderWindow_close(LWindow);
        end;

        sfEvtResized:
        begin
          sfRenderWindow_resizeFrame(LWindow, LEvent.size.size.x, LEvent.size.size.y);
        end;

        sfEvtKeyReleased:
        begin
          case LEvent.key.code of
            sfKeyEscape:
            begin
              sfRenderWindow_close(LWindow);
            end;

            sfKeyF12:
            begin
              sfRenderWindow_toggleFullscreen(LWindow);
            end;

            sfKeyPageUp:
            begin
              Inc(LSongNum);
              if LSongNum > 13 then
                LSongNum := 1;
              Play(LSongNum, 1.0);
            end;

            sfKeyPageDown:
            begin
              Dec(LSongNum);
              if LSongNum < 1 then
                LSongNum := 13;
              Play(LSongNum, 1.0);
            end;
          end;
        end;
      end;
    end;

    sfRenderWindow_startFrame(LWindow);
      sfRenderWindow_drawFilledRect(LWindow, LWindow.Size.x-50, 0, 50, 50, RED);

      LHudPos := sfVector2f_Create(3, 3);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, WHITE, '%d fps', [sfRenderWindow_GetFrameRate(LWindow)]);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN,  'ESC       - Quit', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN,  'F12       - Toggle fullscreen', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN,  'PgUp/PgDn - Select song', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKORANGE, 'Song      - %s', [TPath.GetFileName(LFilename)]);

    sfRenderWindow_endFrame(LWindow);

    sfRenderWindow_display(LWindow);
  end;

  sfAudio_unloadMusic(LMusic);
  sfAudio_close();

  sfText_Destroy(LText[0]);
  sfFont_Destroy(LFont[0]);

  sfRenderWindow_destroy(LWindow);
end;

procedure Test02();
var
  LWindow: PsfRenderWindow;
  LEvent: sfEvent;
  LFont: array[0..0] of PsfFont;
  LText: array[0..0] of PsfText;
  LHudPos: sfVector2f;
  FSamples: array[ 0..8 ] of Integer;
  I: Integer;
begin
  LWindow := sfRenderWindow_create('PSFML: Audio #02');

  LFont[0] := sfFont_CreateDefaultFont();
  sfFont_SetSmooth(LFont[0], True);

  LText[0] := sfText_Create(LFont[0]);
  sfText_SetCharacterSize(LWindow, LText[0], 12);

  sfAudio_open();
  sfAudio_setChannelReserved(0, True);

  for I := 0 to 5 do
    FSamples[I] := sfAudio_loadSound(CZipFilename, Format('res/sfx/samp%d.ogg', [I]));

  FSamples[6] := sfAudio_loadSound(CZipFilename, 'res/sfx/weapon_player.ogg');
  FSamples[7] := sfAudio_loadSound(CZipFilename, 'res/sfx/thunder.ogg');
  FSamples[8] := sfAudio_loadSound(CZipFilename, 'res/sfx/digthis.ogg');

  sfRenderWindow_clear(LWindow, BLACK);
  sfRenderWindow_clearFrame(LWindow, DARKSLATEBROWN);

  while sfRenderWindow_isOpen(LWindow) do
  begin

    while sfRenderWindow_pollEvent(LWindow, @LEvent) do
    begin
      case LEvent.&type of
        sfEvtClosed:
        begin
          sfRenderWindow_close(LWindow);
        end;

        sfEvtResized:
        begin
          sfRenderWindow_resizeFrame(LWindow, LEvent.size.size.x, LEvent.size.size.y);
        end;

        sfEvtKeyReleased:
        begin
          case LEvent.key.code of
            sfKeyEscape:
            begin
              sfRenderWindow_close(LWindow);
            end;

            sfKeyF12:
            begin
              sfRenderWindow_toggleFullscreen(LWindow);
            end;

            sfKeyNum1:  sfAudio_playSound(sfAudioDynamicChannel, FSamples[1], 1, False);
            sfKeyNum2:  sfAudio_playSound(sfAudioDynamicChannel, FSamples[2], 1, False);
            sfKeyNum3:  sfAudio_playSound(sfAudioDynamicChannel, FSamples[3], 1, False);
            sfKeyNum4:  sfAudio_playSound(0, FSamples[0], 1, True);
            sfKeyNum5:  sfAudio_playSound(sfAudioDynamicChannel, FSamples[4], 1, False);
            sfKeyNum6:  sfAudio_playSound(sfAudioDynamicChannel, FSamples[5], 1, False);
            sfKeyNum7:  sfAudio_playSound(sfAudioDynamicChannel, FSamples[6], 1, False);
            sfKeyNum8:  sfAudio_playSound(sfAudioDynamicChannel, FSamples[7], 1, False);
            sfKeyNum9:  sfAudio_playSound(sfAudioDynamicChannel, FSamples[8], 1, False);
            sfKeyNum0:  sfAudio_stopChannel(0);

          end;
        end;
      end;
    end;

    sfRenderWindow_startFrame(LWindow);
      sfRenderWindow_drawFilledRect(LWindow, LWindow.Size.x-50, 0, 50, 50, RED);

      LHudPos := sfVector2f_Create(3, 3);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, WHITE, '%d fps', [sfRenderWindow_GetFrameRate(LWindow)]);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, 'ESC   - Quit', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, 'F12   - Toggle fullscreen', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, '1-9   - Play sound', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, '0     - Stop looping sound', []);

    sfRenderWindow_endFrame(LWindow);

    sfRenderWindow_display(LWindow);
  end;

  sfAudio_stopAllChannels();

  for I := 0 to 8 do
    sfAudio_unloadSound(FSamples[I]);
  sfAudio_close();

  sfText_Destroy(LText[0]);
  sfFont_Destroy(LFont[0]);

  sfRenderWindow_destroy(LWindow);
end;

procedure Test03();
var
  LWindow: PsfRenderWindow;
  LEvent: sfEvent;
  LFont: array[0..0] of PsfFont;
  LText: array[0..0] of PsfText;
  LHudPos: sfVector2f;
  LMousePos: sfVector2u;
  LCenterPos: sfVector;
  LRadius: Single;
  LSfx: Integer;
  LChan: Integer;
begin
  LWindow := sfRenderWindow_create('PSFML: Audio #03');
  LCenterPos.x := LWindow.Size.x / 2;
  LCenterPos.y := LWindow.Size.y / 2;

  LFont[0] := sfFont_CreateDefaultFont();
  sfFont_SetSmooth(LFont[0], True);

  LText[0] := sfText_Create(LFont[0]);
  sfText_SetCharacterSize(LWindow, LText[0], 12);

  sfAudio_open();

  sfAudio_setListenerPosition(LWindow.Size.x/2, LWindow.Size.y/2);
  Lsfx := sfAudio_loadSound(CZipFilename, 'res/sfx/samp5.ogg');

  LChan := sfAudio_playSound(0, LSfx, 1.0, True);
  sfAudio_setChannelMinDistance(LChan, 10);
  sfAudio_setChannelAttenuation(LChan, 0.5);

  sfRenderWindow_clear(LWindow, BLACK);
  sfRenderWindow_clearFrame(LWindow, DARKSLATEBROWN);

  while sfRenderWindow_isOpen(LWindow) do
  begin

    while sfRenderWindow_pollEvent(LWindow, @LEvent) do
    begin
      case LEvent.&type of
        sfEvtClosed:
        begin
          sfRenderWindow_close(LWindow);
        end;

        sfEvtResized:
        begin
          sfRenderWindow_resizeFrame(LWindow, LEvent.size.size.x, LEvent.size.size.y);
        end;

        sfEvtKeyReleased:
        begin
          case LEvent.key.code of
            sfKeyEscape:
            begin
              sfRenderWindow_close(LWindow);
            end;

            sfKeyF12:
            begin
              sfRenderWindow_toggleFullscreen(LWindow);
            end;
          end;
        end;
      end;
    end;

    sfAudio_setChannelPosition(LChan, LMousePos.X, LMousePos.Y);

    sfRenderWindow_startFrame(LWindow);
      LMousePos := sfRenderWindow_getFrameMousePos(LWindow);

      sfRenderWindow_drawFilledRect(LWindow, LWindow.Size.x-50, 0, 50, 50, RED);

      sfRenderWindow_drawLine(LWindow, LCenterPos.x, LCenterPos.y, LMousePos.x, LMousePos.y, GREEN, 1);
      sfRenderWindow_drawFilledCircle(LWindow, LCenterPos.x, LCenterPos.y, 10, ORANGE);

      LRadius := sfVector_distance(LCenterPos, sfVector_fromVector2u(LMousePos));
      sfRenderWindow_drawCircle(LWindow, LCenterPos.x, LCenterPos.y, LRadius, 1, WHITE);

      sfRenderWindow_drawLine(LWindow, 0, LMousePos.y, LWindow.Size.x-1, LMousePos.Y, YELLOW, 1);
      sfRenderWindow_drawLine(LWindow, LMousePos.x, 0, LMousePos.x, LWindow.Size.y-1, YELLOW, 1);

      LHudPos := sfVector2f_Create(3, 3);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, WHITE, '%d fps', [sfRenderWindow_GetFrameRate(LWindow)]);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, 'ESC   - Quit', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, 'F12   - Toggle fullscreen', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKORANGE, 'Mouse - X: %d, Y: %d', [LMousePos.x, LMousePos.y]);

    sfRenderWindow_endFrame(LWindow);

    sfRenderWindow_display(LWindow);
  end;

  sfAudio_unloadSound(LSfx);
  sfAudio_close();

  sfText_Destroy(LText[0]);
  sfFont_Destroy(LFont[0]);

  sfRenderWindow_destroy(LWindow);
end;

end.
