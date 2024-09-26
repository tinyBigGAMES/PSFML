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

unit UVideo;

interface

procedure Test01();
procedure Test02();

implementation

uses
  System.SysUtils,
  PSFML,
  PSFML.Ext,
  UCommon;

procedure Test01();
var
  LWindow: PsfRenderWindow;
  LEvent: sfEvent;
  LFont: array[0..0] of PsfFont;
  LText: array[0..0] of PsfText;
  LHudPos: sfVector2f;
begin
  LWindow := sfRenderWindow_create('PSFML: Video #01');

  LFont[0] := sfFont_CreateDefaultFont();
  sfFont_SetSmooth(LFont[0], True);

  LText[0] := sfText_Create(LFont[0]);
  sfText_SetCharacterSize(LWindow, LText[0], 12);

  sfRenderWindow_clear(LWindow, BLACK);
  sfRenderWindow_clearFrame(LWindow, DARKSLATEBROWN);

  sfVideo_PlayFromZipFile(CZipFilename, 'res\videos\psfml.mpg', 1.0, True);

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

    sfVideo_Update(LWindow);

    sfRenderWindow_startFrame(LWindow);

      sfVideo_Render(LWindow, 0, 0, 0.5);

      sfRenderWindow_drawFilledRect(LWindow, LWindow.Size.x-50, 0, 50, 50, RED);

      LHudPos := sfVector2f_Create(3, 3);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, WHITE, '%d fps', [sfRenderWindow_GetFrameRate(LWindow)]);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, 'ESC   - Quit', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, 'F12   - Toggle fullscreen', []);


    sfRenderWindow_endFrame(LWindow);

    sfRenderWindow_display(LWindow);
  end;

  sfVideo_Destroy();

  sfText_Destroy(LText[0]);
  sfFont_Destroy(LFont[0]);

  sfRenderWindow_destroy(LWindow);
end;

procedure Test02_VideoStatusCallback(const ASender: Pointer; const AStatus: sfVideoStatus; const AFilename: string); cdecl;
begin
  if AStatus = vsStopped then
  begin
    if AFilename = 'res/videos/psfml.mpg' then
      sfVideo_PlayFromZipFile(CZipFilename, 'res/videos/tbg.mpg', 1.0, False, nil, Test02_VideoStatusCallback)
    else
    if AFilename = 'res/videos/tbg.mpg' then
      sfVideo_PlayFromZipFile(CZipFilename, 'res/videos/sample01.mpg', 1.0, False, nil, Test02_VideoStatusCallback)
    else
    if AFilename = 'res/videos/sample01.mpg' then
      sfVideo_PlayFromZipFile(CZipFilename, 'res/videos/psfml.mpg', 1.0, False, nil, Test02_VideoStatusCallback)
  end;
end;

procedure Test02();
var
  LWindow: PsfRenderWindow;
  LEvent: sfEvent;
  LFont: array[0..0] of PsfFont;
  LText: array[0..0] of PsfText;
  LHudPos: sfVector2f;
begin
  LWindow := sfRenderWindow_create('PSFML: Video #02');

  LFont[0] := sfFont_CreateDefaultFont();
  sfFont_SetSmooth(LFont[0], True);

  LText[0] := sfText_Create(LFont[0]);
  sfText_SetCharacterSize(LWindow, LText[0], 12);

  sfRenderWindow_clear(LWindow, BLACK);
  sfRenderWindow_clearFrame(LWindow, DARKSLATEBROWN);

  sfVideo_PlayFromZipFile(CZipFilename, 'res/videos/psfml.mpg', 1.0, False, nil, Test02_VideoStatusCallback);

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

    sfVideo_Update(LWindow);

    sfRenderWindow_startFrame(LWindow);

      sfVideo_Render(LWindow, 0, 0, 0.5);

      sfRenderWindow_drawFilledRect(LWindow, LWindow.Size.x-50, 0, 50, 50, RED);

      LHudPos := sfVector2f_Create(3, 3);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, WHITE, '%d fps', [sfRenderWindow_GetFrameRate(LWindow)]);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, 'ESC   - Quit', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, 'F12   - Toggle fullscreen', []);


    sfRenderWindow_endFrame(LWindow);

    sfRenderWindow_display(LWindow);
  end;

  sfVideo_Destroy();

  sfText_Destroy(LText[0]);
  sfFont_Destroy(LFont[0]);

  sfRenderWindow_destroy(LWindow);
end;


end.
