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

unit URenderWindow;

interface

procedure Test01();

implementation

uses
  System.SysUtils,
  PSFML,
  PSFML.Ext;

procedure Test01();
var
  LWindow: PsfRenderWindow;
  LEvent: sfEvent;
  LFont: array[0..0] of PsfFont;
  LText: array[0..0] of PsfText;
  LHudPos: sfVector2f;
  LMousePos: sfVector2u;
begin
  LWindow := sfRenderWindow_create('PSFML: RenderWindow #01');

  LFont[0] := sfFont_CreateDefaultFont();
  sfFont_SetSmooth(LFont[0], True);

  LText[0] := sfText_Create(LFont[0]);
  sfText_SetCharacterSize(LWindow, LText[0], 12);

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

    sfRenderWindow_startFrame(LWindow);
      LMousePos := sfRenderWindow_getFrameMousePos(LWindow);

      sfRenderWindow_drawFilledRect(LWindow, LWindow.Size.x-50, 0, 50, 50, RED);

      LHudPos := sfVector2f_Create(3, 3);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, WHITE, '%d fps', [sfRenderWindow_GetFrameRate(LWindow)]);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, 'ESC   - Quit', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKGREEN, 'F12   - Toggle fullscreen', []);
      sfRenderWindow_DrawTextVarY(LWindow, LText[0], LHudPos.x, LHudPos.y, DARKORANGE, 'Mouse - X: %d, Y: %d', [LMousePos.x, LMousePos.y]);

    sfRenderWindow_endFrame(LWindow);

    sfRenderWindow_display(LWindow);
  end;

  sfText_Destroy(LText[0]);
  sfFont_Destroy(LFont[0]);

  sfRenderWindow_destroy(LWindow);
end;

end.
