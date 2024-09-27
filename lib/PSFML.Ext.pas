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

unit PSFML.Ext;

{$I PSFML.inc}

interface

uses
  System.Types,
  System.Generics.Collections,
  System.SysUtils,
  System.IOUtils,
  System.Classes,
  System.Math,
  WinApi.Windows,
  WinApi.Messages,
  PSFML,
  PSFML.Common;

{ sfError }
type
  sfErrorCallback = procedure(const AText: string; const AUserData: Pointer); cdecl;

procedure sfError_setCallback(const AHandler: sfErrorCallback;  const AUserData: Pointer); cdecl;
function  sfError_getCallback(): sfErrorCallback; cdecl;
procedure sfError_set(const AMsg: string; const AArgs: array of const); cdecl;
function  sfError_getLast(): string; cdecl;

{ sfConsole }
const
  sfCR   = #13;
  sfLF   = #10;
  sfCRLF = #13#10;
  sfEsc  = #27;

  // Cursor Movement
  sfCSICursorPos = sfEsc + '[%d;%dH';         // Set cursor position
  sfCSICursorUp = sfEsc + '[%dA';             // Move cursor up
  sfCSICursorDown = sfEsc + '[%dB';           // Move cursor down
  sfCSICursorForward = sfEsc + '[%dC';        // Move cursor forward
  sfCSICursorBack = sfEsc + '[%dD';           // Move cursor backward
  sfCSISaveCursorPos = sfEsc + '[s';          // Save cursor position
  sfCSIRestoreCursorPos = sfEsc + '[u';       // Restore cursor position

  // Cursor Visibility
  sfCSIShowCursor = sfEsc + '[?25h';          // Show cursor
  sfCSIHideCursor = sfEsc + '[?25l';          // Hide cursor
  sfCSIBlinkCursor = sfEsc + '[?12h';         // Enable cursor blinking
  sfCSISteadyCursor = sfEsc + '[?12l';        // Disable cursor blinking

  // Screen Manipulation
  sfCSIClearScreen = sfEsc + '[2J';           // Clear screen
  sfCSIClearLine = sfEsc + '[2K';             // Clear line
  sfCSIScrollUp = sfEsc + '[%dS';             // Scroll up by n lines
  sfCSIScrollDown = sfEsc + '[%dT';           // Scroll down by n lines

  // Text Formatting
  sfCSIBold = sfEsc + '[1m';                  // Bold text
  sfCSIUnderline = sfEsc + '[4m';             // Underline text
  sfCSIResetFormat = sfEsc + '[0m';           // Reset text formatting
  sfCSIResetBackground = #27'[49m';         // Reset background text formatting
  sfCSIResetForeground = #27'[39m';         // Reset forground text formatting
  sfCSIInvertColors = sfEsc + '[7m';          // Invert foreground/background
  sfCSINormalColors = sfEsc + '[27m';         // Normal colors

  sfCSIDim = sfEsc + '[2m';
  sfCSIItalic = sfEsc + '[3m';
  sfCSIBlink = sfEsc + '[5m';
  sfCSIFramed = sfEsc + '[51m';
  sfCSIEncircled = sfEsc + '[52m';

  // Text Modification
  sfCSIInsertChar = sfEsc + '[%d@';           // Insert n spaces at cursor position
  sfCSIDeleteChar = sfEsc + '[%dP';           // Delete n characters at cursor position
  sfCSIEraseChar = sfEsc + '[%dX';            // Erase n characters at cursor position

  // Colors (Foreground and Background)
  sfCSIFGBlack = sfEsc + '[30m';
  sfCSIFGRed = sfEsc + '[31m';
  sfCSIFGGreen = sfEsc + '[32m';
  sfCSIFGYellow = sfEsc + '[33m';
  sfCSIFGBlue = sfEsc + '[34m';
  sfCSIFGMagenta = sfEsc + '[35m';
  sfCSIFGCyan = sfEsc + '[36m';
  sfCSIFGWhite = sfEsc + '[37m';

  sfCSIBGBlack = sfEsc + '[40m';
  sfCSIBGRed = sfEsc + '[41m';
  sfCSIBGGreen = sfEsc + '[42m';
  sfCSIBGYellow = sfEsc + '[43m';
  sfCSIBGBlue = sfEsc + '[44m';
  sfCSIBGMagenta = sfEsc + '[45m';
  sfCSIBGCyan = sfEsc + '[46m';
  sfCSIBGWhite = sfEsc + '[47m';

  sfCSIFGBrightBlack = sfEsc + '[90m';
  sfCSIFGBrightRed = sfEsc + '[91m';
  sfCSIFGBrightGreen = sfEsc + '[92m';
  sfCSIFGBrightYellow = sfEsc + '[93m';
  sfCSIFGBrightBlue = sfEsc + '[94m';
  sfCSIFGBrightMagenta = sfEsc + '[95m';
  sfCSIFGBrightCyan = sfEsc + '[96m';
  sfCSIFGBrightWhite = sfEsc + '[97m';

  sfCSIBGBrightBlack = sfEsc + '[100m';
  sfCSIBGBrightRed = sfEsc + '[101m';
  sfCSIBGBrightGreen = sfEsc + '[102m';
  sfCSIBGBrightYellow = sfEsc + '[103m';
  sfCSIBGBrightBlue = sfEsc + '[104m';
  sfCSIBGBrightMagenta = sfEsc + '[105m';
  sfCSIBGBrightCyan = sfEsc + '[106m';
  sfCSIBGBrightWhite = sfEsc + '[107m';

  sfCSIFGRGB = sfEsc + '[38;2;%d;%d;%dm';        // Foreground RGB
  sfCSIBGRGB = sfEsc + '[48;2;%d;%d;%dm';        // Background RGB

procedure sfConsole_print(); cdecl; overload;
procedure sfConsole_Print(const AMsg: string; const AArgs: array of const); cdecl; overload;
procedure sfConsole_printLn() cdecl; overload;
procedure sfConsole_printLn(const AMsg: string; const AArgs: array of const); cdecl; overload;

procedure sfConsole_setCursorPos(const X, Y: Integer); cdecl
procedure sfConsole_moveCursorUp(const ALines: Integer); cdecl
procedure sfConsole_moveCursorDown(const ALines: Integer); cdecl
procedure sfConsole_moveCursorForward(const ACols: Integer); cdecl
procedure sfConsole_moveCursorBack(const ACols: Integer); cdecl
procedure sfConsole_clearScreen(); cdecl
procedure sfConsole_clearLine(); cdecl
procedure sfConsole_hideCursor(); cdecl
procedure sfConsole_showCursor(); cdecl
procedure sfConsole_saveCursorPos(); cdecl
procedure sfConsole_restoreCursorPos(); cdecl
procedure sfConsole_setBoldText(); cdecl
procedure sfConsole_resetTextFormat(); cdecl
procedure sfConsole_setForegroundColor(const AColor: string); cdecl
procedure sfConsole_setBackgroundColor(const AColor: string); cdecl
procedure sfConsole_setForegroundRGB(const ARed, AGreen, ABlue: Byte); cdecl
procedure sfConsole_setBackgroundRGB(const ARed, AGreen, ABlue: Byte); cdecl

procedure sfConsole_waitForAnyKey(); cdecl
function  sfConsole_anyKeyPressed(): Boolean; cdecl

procedure sfConsole_pause(const AForcePause: Boolean=False; AColor: string=sfCSIFGWhite; const AMsg: string=''); cdecl
procedure sfConsole_setTitle(const ATitle: string); cdecl

{ sfTransform_Identity }
const
  sfTransform_Identity: sfTransform = (
    matrix: (
      1, 0, 0, // First row
      0, 1, 0, // Second row
      0, 0, 1  // Third row
    )
  );

{$REGION ' Common Blend Modes '}
const
  sfBlendAlpha: sfBlendMode = (
    colorSrcFactor: sfBlendFactorSrcAlpha;
    colorDstFactor: sfBlendFactorOneMinusSrcAlpha;
    colorEquation: sfBlendEquationAdd;
    alphaSrcFactor: sfBlendFactorOne;
    alphaDstFactor: sfBlendFactorOneMinusSrcAlpha;
    alphaEquation: sfBlendEquationAdd
  );

  sfBlendAdd: sfBlendMode = (
    colorSrcFactor: sfBlendFactorSrcAlpha;
    colorDstFactor: sfBlendFactorOne;
    colorEquation: sfBlendEquationAdd;
    alphaSrcFactor: sfBlendFactorOne;
    alphaDstFactor: sfBlendFactorOne;
    alphaEquation: sfBlendEquationAdd
  );

  sfBlendMultiply: sfBlendMode = (
    colorSrcFactor: sfBlendFactorDstColor;
    colorDstFactor: sfBlendFactorZero;
    colorEquation: sfBlendEquationAdd;
    alphaSrcFactor: sfBlendFactorDstColor;
    alphaDstFactor: sfBlendFactorZero;
    alphaEquation: sfBlendEquationAdd
  );

  sfBlendMin: sfBlendMode = (
    colorSrcFactor: sfBlendFactorOne;
    colorDstFactor: sfBlendFactorOne;
    colorEquation: sfBlendEquationMin;
    alphaSrcFactor: sfBlendFactorOne;
    alphaDstFactor: sfBlendFactorOne;
    alphaEquation: sfBlendEquationMin
  );

  sfBlendMax: sfBlendMode = (
    colorSrcFactor: sfBlendFactorOne;
    colorDstFactor: sfBlendFactorOne;
    colorEquation: sfBlendEquationMax;
    alphaSrcFactor: sfBlendFactorOne;
    alphaDstFactor: sfBlendFactorOne;
    alphaEquation: sfBlendEquationMax
  );

  sfBlendNone: sfBlendMode = (
    colorSrcFactor: sfBlendFactorOne;
    colorDstFactor: sfBlendFactorZero;
    colorEquation: sfBlendEquationAdd;
    alphaSrcFactor: sfBlendFactorOne;
    alphaDstFactor: sfBlendFactorZero;
    alphaEquation: sfBlendEquationAdd
  );
{$ENDREGION}

{$REGION ' Common Colors '}
const
  ALICEBLUE           : sfColor = (r:$F0; g:$F8; b:$FF; a:$FF);
  ANTIQUEWHITE        : sfColor = (r:$FA; g:$EB; b:$D7; a:$FF);
  AQUA                : sfColor = (r:$00; g:$FF; b:$FF; a:$FF);
  AQUAMARINE          : sfColor = (r:$7F; g:$FF; b:$D4; a:$FF);
  AZURE               : sfColor = (r:$F0; g:$FF; b:$FF; a:$FF);
  BEIGE               : sfColor = (r:$F5; g:$F5; b:$DC; a:$FF);
  BISQUE              : sfColor = (r:$FF; g:$E4; b:$C4; a:$FF);
  BLACK               : sfColor = (r:$00; g:$00; b:$00; a:$FF);
  BLANCHEDALMOND      : sfColor = (r:$FF; g:$EB; b:$CD; a:$FF);
  BLUE                : sfColor = (r:$00; g:$00; b:$FF; a:$FF);
  BLUEVIOLET          : sfColor = (r:$8A; g:$2B; b:$E2; a:$FF);
  BROWN               : sfColor = (r:$A5; g:$2A; b:$2A; a:$FF);
  BURLYWOOD           : sfColor = (r:$DE; g:$B8; b:$87; a:$FF);
  CADETBLUE           : sfColor = (r:$5F; g:$9E; b:$A0; a:$FF);
  CHARTREUSE          : sfColor = (r:$7F; g:$FF; b:$00; a:$FF);
  CHOCOLATE           : sfColor = (r:$D2; g:$69; b:$1E; a:$FF);
  CORAL               : sfColor = (r:$FF; g:$7F; b:$50; a:$FF);
  CORNFLOWERBLUE      : sfColor = (r:$64; g:$95; b:$ED; a:$FF);
  CORNSILK            : sfColor = (r:$FF; g:$F8; b:$DC; a:$FF);
  CRIMSON             : sfColor = (r:$DC; g:$14; b:$3C; a:$FF);
  CYAN                : sfColor = (r:$00; g:$FF; b:$FF; a:$FF);
  DARKBLUE            : sfColor = (r:$00; g:$00; b:$8B; a:$FF);
  DARKCYAN            : sfColor = (r:$00; g:$8B; b:$8B; a:$FF);
  DARKGOLDENROD       : sfColor = (r:$B8; g:$86; b:$0B; a:$FF);
  DARKGRAY            : sfColor = (r:$A9; g:$A9; b:$A9; a:$FF);
  DARKGREEN           : sfColor = (r:$00; g:$64; b:$00; a:$FF);
  DARKGREY            : sfColor = (r:$A9; g:$A9; b:$A9; a:$FF);
  DARKKHAKI           : sfColor = (r:$BD; g:$B7; b:$6B; a:$FF);
  DARKMAGENTA         : sfColor = (r:$8B; g:$00; b:$8B; a:$FF);
  DARKOLIVEGREEN      : sfColor = (r:$55; g:$6B; b:$2F; a:$FF);
  DARKORANGE          : sfColor = (r:$FF; g:$8C; b:$00; a:$FF);
  DARKORCHID          : sfColor = (r:$99; g:$32; b:$CC; a:$FF);
  DARKRED             : sfColor = (r:$8B; g:$00; b:$00; a:$FF);
  DARKSALMON          : sfColor = (r:$E9; g:$96; b:$7A; a:$FF);
  DARKSEAGREEN        : sfColor = (r:$8F; g:$BC; b:$8F; a:$FF);
  DARKSLATEBLUE       : sfColor = (r:$48; g:$3D; b:$8B; a:$FF);
  DARKSLATEGRAY       : sfColor = (r:$2F; g:$4F; b:$4F; a:$FF);
  DARKSLATEGREY       : sfColor = (r:$2F; g:$4F; b:$4F; a:$FF);
  DARKTURQUOISE       : sfColor = (r:$00; g:$CE; b:$D1; a:$FF);
  DARKVIOLET          : sfColor = (r:$94; g:$00; b:$D3; a:$FF);
  DEEPPINK            : sfColor = (r:$FF; g:$14; b:$93; a:$FF);
  DEEPSKYBLUE         : sfColor = (r:$00; g:$BF; b:$FF; a:$FF);
  DIMGRAY             : sfColor = (r:$69; g:$69; b:$69; a:$FF);
  DIMGREY             : sfColor = (r:$69; g:$69; b:$69; a:$FF);
  DODGERBLUE          : sfColor = (r:$1E; g:$90; b:$FF; a:$FF);
  FIREBRICK           : sfColor = (r:$B2; g:$22; b:$22; a:$FF);
  FLORALWHITE         : sfColor = (r:$FF; g:$FA; b:$F0; a:$FF);
  FORESTGREEN         : sfColor = (r:$22; g:$8B; b:$22; a:$FF);
  FUCHSIA             : sfColor = (r:$FF; g:$00; b:$FF; a:$FF);
  GAINSBORO           : sfColor = (r:$DC; g:$DC; b:$DC; a:$FF);
  GHOSTWHITE          : sfColor = (r:$F8; g:$F8; b:$FF; a:$FF);
  GOLD                : sfColor = (r:$FF; g:$D7; b:$00; a:$FF);
  GOLDENROD           : sfColor = (r:$DA; g:$A5; b:$20; a:$FF);
  GRAY                : sfColor = (r:$80; g:$80; b:$80; a:$FF);
  GREEN               : sfColor = (r:$00; g:$80; b:$00; a:$FF);
  GREENYELLOW         : sfColor = (r:$AD; g:$FF; b:$2F; a:$FF);
  GREY                : sfColor = (r:$80; g:$80; b:$80; a:$FF);
  HONEYDEW            : sfColor = (r:$F0; g:$FF; b:$F0; a:$FF);
  HOTPINK             : sfColor = (r:$FF; g:$69; b:$B4; a:$FF);
  INDIANRED           : sfColor = (r:$CD; g:$5C; b:$5C; a:$FF);
  INDIGO              : sfColor = (r:$4B; g:$00; b:$82; a:$FF);
  IVORY               : sfColor = (r:$FF; g:$FF; b:$F0; a:$FF);
  KHAKI               : sfColor = (r:$F0; g:$E6; b:$8C; a:$FF);
  LAVENDER            : sfColor = (r:$E6; g:$E6; b:$FA; a:$FF);
  LAVENDERBLUSH       : sfColor = (r:$FF; g:$F0; b:$F5; a:$FF);
  LAWNGREEN           : sfColor = (r:$7C; g:$FC; b:$00; a:$FF);
  LEMONCHIFFON        : sfColor = (r:$FF; g:$FA; b:$CD; a:$FF);
  LIGHTBLUE           : sfColor = (r:$AD; g:$D8; b:$E6; a:$FF);
  LIGHTCORAL          : sfColor = (r:$F0; g:$80; b:$80; a:$FF);
  LIGHTCYAN           : sfColor = (r:$E0; g:$FF; b:$FF; a:$FF);
  LIGHTGOLDENRODYELLOW: sfColor = (r:$FA; g:$FA; b:$D2; a:$FF);
  LIGHTGRAY           : sfColor = (r:$D3; g:$D3; b:$D3; a:$FF);
  LIGHTGREEN          : sfColor = (r:$90; g:$EE; b:$90; a:$FF);
  LIGHTGREY           : sfColor = (r:$D3; g:$D3; b:$D3; a:$FF);
  LIGHTPINK           : sfColor = (r:$FF; g:$B6; b:$C1; a:$FF);
  LIGHTSALMON         : sfColor = (r:$FF; g:$A0; b:$7A; a:$FF);
  LIGHTSEAGREEN       : sfColor = (r:$20; g:$B2; b:$AA; a:$FF);
  LIGHTSKYBLUE        : sfColor = (r:$87; g:$CE; b:$FA; a:$FF);
  LIGHTSLATEGRAY      : sfColor = (r:$77; g:$88; b:$99; a:$FF);
  LIGHTSLATEGREY      : sfColor = (r:$77; g:$88; b:$99; a:$FF);
  LIGHTSTEELBLUE      : sfColor = (r:$B0; g:$C4; b:$DE; a:$FF);
  LIGHTYELLOW         : sfColor = (r:$FF; g:$FF; b:$E0; a:$FF);
  LIME                : sfColor = (r:$00; g:$FF; b:$00; a:$FF);
  LIMEGREEN           : sfColor = (r:$32; g:$CD; b:$32; a:$FF);
  LINEN               : sfColor = (r:$FA; g:$F0; b:$E6; a:$FF);
  MAGENTA             : sfColor = (r:$FF; g:$00; b:$FF; a:$FF);
  MAROON              : sfColor = (r:$80; g:$00; b:$00; a:$FF);
  MEDIUMAQUAMARINE    : sfColor = (r:$66; g:$CD; b:$AA; a:$FF);
  MEDIUMBLUE          : sfColor = (r:$00; g:$00; b:$CD; a:$FF);
  MEDIUMORCHID        : sfColor = (r:$BA; g:$55; b:$D3; a:$FF);
  MEDIUMPURPLE        : sfColor = (r:$93; g:$70; b:$DB; a:$FF);
  MEDIUMSEAGREEN      : sfColor = (r:$3C; g:$B3; b:$71; a:$FF);
  MEDIUMSLATEBLUE     : sfColor = (r:$7B; g:$68; b:$EE; a:$FF);
  MEDIUMSPRINGGREEN   : sfColor = (r:$00; g:$FA; b:$9A; a:$FF);
  MEDIUMTURQUOISE     : sfColor = (r:$48; g:$D1; b:$CC; a:$FF);
  MEDIUMVIOLETRED     : sfColor = (r:$C7; g:$15; b:$85; a:$FF);
  MIDNIGHTBLUE        : sfColor = (r:$19; g:$19; b:$70; a:$FF);
  MINTCREAM           : sfColor = (r:$F5; g:$FF; b:$FA; a:$FF);
  MISTYROSE           : sfColor = (r:$FF; g:$E4; b:$E1; a:$FF);
  MOCCASIN            : sfColor = (r:$FF; g:$E4; b:$B5; a:$FF);
  NAVAJOWHITE         : sfColor = (r:$FF; g:$DE; b:$AD; a:$FF);
  NAVY                : sfColor = (r:$00; g:$00; b:$80; a:$FF);
  OLDLACE             : sfColor = (r:$FD; g:$F5; b:$E6; a:$FF);
  OLIVE               : sfColor = (r:$80; g:$80; b:$00; a:$FF);
  OLIVEDRAB           : sfColor = (r:$6B; g:$8E; b:$23; a:$FF);
  ORANGE              : sfColor = (r:$FF; g:$A5; b:$00; a:$FF);
  ORANGERED           : sfColor = (r:$FF; g:$45; b:$00; a:$FF);
  ORCHID              : sfColor = (r:$DA; g:$70; b:$D6; a:$FF);
  PALEGOLDENROD       : sfColor = (r:$EE; g:$E8; b:$AA; a:$FF);
  PALEGREEN           : sfColor = (r:$98; g:$FB; b:$98; a:$FF);
  PALETURQUOISE       : sfColor = (r:$AF; g:$EE; b:$EE; a:$FF);
  PALEVIOLETRED       : sfColor = (r:$DB; g:$70; b:$93; a:$FF);
  PAPAYAWHIP          : sfColor = (r:$FF; g:$EF; b:$D5; a:$FF);
  PEACHPUFF           : sfColor = (r:$FF; g:$DA; b:$B9; a:$FF);
  PERU                : sfColor = (r:$CD; g:$85; b:$3F; a:$FF);
  PINK                : sfColor = (r:$FF; g:$C0; b:$CB; a:$FF);
  PLUM                : sfColor = (r:$DD; g:$A0; b:$DD; a:$FF);
  POWDERBLUE          : sfColor = (r:$B0; g:$E0; b:$E6; a:$FF);
  PURPLE              : sfColor = (r:$80; g:$00; b:$80; a:$FF);
  REBECCAPURPLE       : sfColor = (r:$66; g:$33; b:$99; a:$FF);
  RED                 : sfColor = (r:$FF; g:$00; b:$00; a:$FF);
  ROSYBROWN           : sfColor = (r:$BC; g:$8F; b:$8F; a:$FF);
  ROYALBLUE           : sfColor = (r:$41; g:$69; b:$E1; a:$FF);
  SADDLEBROWN         : sfColor = (r:$8B; g:$45; b:$13; a:$FF);
  SALMON              : sfColor = (r:$FA; g:$80; b:$72; a:$FF);
  SANDYBROWN          : sfColor = (r:$F4; g:$A4; b:$60; a:$FF);
  SEAGREEN            : sfColor = (r:$2E; g:$8B; b:$57; a:$FF);
  SEASHELL            : sfColor = (r:$FF; g:$F5; b:$EE; a:$FF);
  SIENNA              : sfColor = (r:$A0; g:$52; b:$2D; a:$FF);
  SILVER              : sfColor = (r:$C0; g:$C0; b:$C0; a:$FF);
  SKYBLUE             : sfColor = (r:$87; g:$CE; b:$EB; a:$FF);
  SLATEBLUE           : sfColor = (r:$6A; g:$5A; b:$CD; a:$FF);
  SLATEGRAY           : sfColor = (r:$70; g:$80; b:$90; a:$FF);
  SLATEGREY           : sfColor = (r:$70; g:$80; b:$90; a:$FF);
  SNOW                : sfColor = (r:$FF; g:$FA; b:$FA; a:$FF);
  SPRINGGREEN         : sfColor = (r:$00; g:$FF; b:$7F; a:$FF);
  STEELBLUE           : sfColor = (r:$46; g:$82; b:$B4; a:$FF);
  TAN                 : sfColor = (r:$D2; g:$B4; b:$8C; a:$FF);
  TEAL                : sfColor = (r:$00; g:$80; b:$80; a:$FF);
  THISTLE             : sfColor = (r:$D8; g:$BF; b:$D8; a:$FF);
  TOMATO              : sfColor = (r:$FF; g:$63; b:$47; a:$FF);
  TURQUOISE           : sfColor = (r:$40; g:$E0; b:$D0; a:$FF);
  VIOLET              : sfColor = (r:$EE; g:$82; b:$EE; a:$FF);
  WHEAT               : sfColor = (r:$F5; g:$DE; b:$B3; a:$FF);
  WHITE               : sfColor = (r:$FF; g:$FF; b:$FF; a:$FF);
  WHITESMOKE          : sfColor = (r:$F5; g:$F5; b:$F5; a:$FF);
  YELLOW              : sfColor = (r:$FF; g:$FF; b:$00; a:$FF);
  YELLOWGREEN         : sfColor = (r:$9A; g:$CD; b:$32; a:$FF);
  BLANK               : sfColor = (r:$00; g:$00; b:$00; a:$00);
  WHITE2              : sfColor = (r:$F5; g:$F5; b:$F5; a:$FF);
  RED22               : sfColor = (r:$7E; g:$32; b:$3F; a:255);
  COLORKEY            : sfColor = (r:$FF; g:$00; b:$FF; a:$FF);
  OVERLAY1            : sfColor = (r:$00; g:$20; b:$29; a:$B4);
  OVERLAY2            : sfColor = (r:$01; g:$1B; b:$01; a:255);
  DIMWHITE            : sfColor = (r:$10; g:$10; b:$10; a:$10);
  DARKSLATEBROWN      : sfColor = (r:30;  g:31;  b:30;  a:255);
  RAYWHITE            : sfColor = (r:245; g:245; b:245; a:255);
  TRANSPARENT         : sfColor = (r:255; g:255; b:255; a:0);
{$ENDREGION}

{ sfVector}
function  sfVector2i_create(const X, Y: Integer): sfVector2i; cdecl;
function  sfVector2u_create(const X, Y: Cardinal): sfVector2u; cdecl;
function  sfVector2f_create(const X, Y: Single): sfVector2f; cdecl;
function  sfVector3f_create(const X, Y, Z: Single): sfVector3f; cdecl;

{ sfRect }
function  sfFloatRect_create(const ALeft, ATop, AWidth, AHeight: Single): sfFloatRect; cdecl;
function  sfIntRect_create(const ALeft, ATop, AWidth, AHeight: Integer): sfIntRect; cdecl;


{ sfZipFile }
const
  sfZipFileDefaultPassword = 'Q.<g%zw[k6T,7:4N2DWC>Y]+n;(r3yj@JcF?Ru=s5LbM`paPf!';

type
  { sfZipFile_buildProgressCallback }
  sfZipFile_buildProgressCallback = procedure(const ASender: Pointer; const AFilename: string; const AProgress: Integer; const ANewFile: Boolean); cdecl;

function sfZipFile_build(const AArchive, ADirectory: string; const APassword: string=sfZipFileDefaultPassword; const ASender: Pointer=nil; const AHandler: sfZipFile_buildProgressCallback=nil): Boolean; cdecl;


{ sfInputStream }
type
  { sfInputStreamCloseFunc }
  sfInputStreamCloseFunc = function(userData: Pointer): Boolean; cdecl;

  { sfInputStream }
  PsfInputStream = ^sfInputStream;
  sfInputStream = record
    Base: PSFML.sfInputStream;
    close: sfInputStreamCloseFunc;
  end;

function sfInputStream_create(): PsfInputStream; cdecl;
function sfInputStream_read(const AInputStream: PsfInputStream; const AData: Pointer; const ASize: Int64): Int64; cdecl;
function sfInputStream_seek(const AInputStream: PsfInputStream; const APosition: Int64): Int64; cdecl;
function sfInputStream_tell(const AInputStream: PsfInputStream): Int64; cdecl;
function sfInputStream_getSize(const AInputStream: PsfInputStream): Int64; cdecl;
function sfInputStream_eof(const AInputStream: PsfInputStream): Boolean; cdecl;
function sfInputStream_close(var AInputStream: PsfInputStream): Boolean; cdecl;
function sfInputStream_createFromFile(const AFilename: string): PsfInputStream; cdecl;
function sfInputStream_createFromMemory(const ABuffer: Pointer; const ASize: Int64): PsfInputStream; cdecl;
function sfInputStream_createFromZipFile(const AZipFilename, AFilename: string; const APassword: string=sfZipFileDefaultPassword): PsfInputStream; cdecl;

{ sfRenderWindow}
const
  sfDefaultWindow_width = 1920 div 2;
  sfDefaultWindow_height = 1080 div 2;
  sfDefaultWindow_style = sfClose or sfResize;

type
  TsfTiming = record
    Clock: PsfClock;
    ElapsedTime: sfTime;
    FrameRate: Single;
    FrameCount: Integer;
    Limit: Cardinal;
  end;

  PsfRenderWindow = ^TsfRenderWindow;
  TsfRenderWindow = record
    Handle: PSFML.PsfRenderWindow;
    Mode: sfVideoMode;
    Settings: sfContextSettings;
    Scale: Single;
    Dpi: Cardinal;
    Timing: TsfTiming;
    View: PsfView;
    Size: sfVector2f;
    ScaleSize: sfVector2f;
    Fullscreen: Boolean;
    ClearRectangle: PsfRectangleShape;
    MousePos: sfVector2u;
  end;

function  sfRenderWindow_create(ATitle: string; const AWidth: Cardinal=sfDefaultWindow_width; const AHeight: Cardinal=sfDefaultWindow_height; const AStyle: Uint32=Ord(sfDefaultWindow_style)): PsfRenderWindow; cdecl;
procedure sfRenderWindow_destroy(var AWindow: PsfRenderWindow); cdecl;
procedure sfRenderWindow_toggleFullscreen(const AWindow: PsfRenderWindow); cdecl;
procedure sfRenderWindow_toggleBorders(const AWindow: PsfRenderWindow; const AShow: Boolean); cdecl;
function  sfRenderWindow_areBordersVisible(const AWindow: PsfRenderWindow): Boolean; cdecl;
procedure sfRenderWindow_minimize(const AWindow: PsfRenderWindow); cdecl;
function  sfRenderWindow_isMinimized(const AWindow: PsfRenderWindow): Boolean; cdecl;
procedure sfRenderWindow_maximize(const AWindow: PsfRenderWindow); cdecl;
function  sfRenderWindow_isMaximized(const AWindow: PsfRenderWindow): Boolean; cdecl;
procedure sfRenderWindow_restore(const AWindow: PsfRenderWindow); cdecl;
function  sfRenderWindow_isRestored(const AWindow: PsfRenderWindow): Boolean; cdecl;
procedure sfRenderWindow_setFramerateLimit(const AWindow: PsfRenderWindow; limit: Cardinal); cdecl;
procedure sfRenderWindow_startFrame(const AWindow: PsfRenderWindow); cdecl;
function  sfRenderWindow_getFrameMousePos(const AWindow: PsfRenderWindow): sfVector2u; cdecl;
procedure sfRenderWindow_clearFrame(const AWindow: PsfRenderWindow; const AColor: sfColor); cdecl;
procedure sfRenderWindow_resizeFrame(const AWindow: PsfRenderWindow; const AWidth, AHeight: Cardinal); cdecl;
procedure sfRenderWindow_endFrame(const AWindow: PsfRenderWindow); cdecl;
procedure sfRenderWindow_display(const AWindow: PsfRenderWindow); cdecl;
function  sfRenderWindow_getFrameRate(const AWindow: PsfRenderWindow): Cardinal; cdecl;
procedure sfRenderWindow_resetTiming(const AWindow: PsfRenderWindow); cdecl;
procedure sfRenderWindow_setTitle(const AWindow: PsfRenderWindow; const title: string); cdecl;
function  sfRenderWindow_createUnicode(mode: sfVideoMode; const title: PUint32; style: Uint32; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
function  sfRenderWindow_createFromHandle(handle: sfWindowHandle; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
procedure sfRenderWindow_close(renderWindow: PsfRenderWindow); cdecl;
function  sfRenderWindow_isOpen(const renderWindow: PsfRenderWindow): Boolean; cdecl;
function  sfRenderWindow_getSettings(const renderWindow: PsfRenderWindow): sfContextSettings; cdecl;
function  sfRenderWindow_pollEvent(renderWindow: PsfRenderWindow; event: PsfEvent): Boolean; cdecl;
function  sfRenderWindow_waitEvent(renderWindow: PsfRenderWindow; timeout: sfTime; event: PsfEvent): Boolean; cdecl;
function  sfRenderWindow_getPosition(const renderWindow: PsfRenderWindow): sfVector2i; cdecl;
procedure sfRenderWindow_setPosition(renderWindow: PsfRenderWindow; position: sfVector2i); cdecl;
function  sfRenderWindow_getSize(const renderWindow: PsfRenderWindow): sfVector2u; cdecl;
function  sfRenderWindow_isSrgb(const renderWindow: PsfRenderWindow): Boolean; cdecl;
procedure sfRenderWindow_setSize(renderWindow: PsfRenderWindow; size: sfVector2u); cdecl;
procedure sfRenderWindow_setUnicodeTitle(renderWindow: PsfRenderWindow; const title: string); cdecl;
procedure sfRenderWindow_setIcon(renderWindow: PsfRenderWindow; width: Cardinal; height: Cardinal; const pixels: PUint8); cdecl;
procedure sfRenderWindow_setVisible(renderWindow: PsfRenderWindow; visible: Boolean); cdecl;
procedure sfRenderWindow_setVerticalSyncEnabled(renderWindow: PsfRenderWindow; enabled: Boolean); cdecl;
procedure sfRenderWindow_setMouseCursorVisible(renderWindow: PsfRenderWindow; show: Boolean); cdecl;
procedure sfRenderWindow_setMouseCursorGrabbed(renderWindow: PsfRenderWindow; grabbed: Boolean); cdecl;
procedure sfRenderWindow_setMouseCursor(window: PsfRenderWindow; const cursor: PsfCursor); cdecl;
procedure sfRenderWindow_setKeyRepeatEnabled(renderWindow: PsfRenderWindow; enabled: Boolean); cdecl;
procedure sfRenderWindow_setJoystickThreshold(renderWindow: PsfRenderWindow; threshold: Single); cdecl;
function  sfRenderWindow_setActive(renderWindow: PsfRenderWindow; active: Boolean): Boolean; cdecl;
procedure sfRenderWindow_requestFocus(renderWindow: PsfRenderWindow); cdecl;
function  sfRenderWindow_hasFocus(const renderWindow: PsfRenderWindow): Boolean; cdecl;
function  sfRenderWindow_getSystemHandle(const renderWindow: PsfRenderWindow): sfWindowHandle; cdecl;
procedure sfRenderWindow_clear(renderWindow: PsfRenderWindow; color: sfColor); cdecl;
procedure sfRenderWindow_setView(renderWindow: PsfRenderWindow; const view: PsfView); cdecl;
function  sfRenderWindow_getView(const renderWindow: PsfRenderWindow): PsfView; cdecl;
function  sfRenderWindow_getDefaultView(const renderWindow: PsfRenderWindow): PsfView; cdecl;
function  sfRenderWindow_getViewport(const renderWindow: PsfRenderWindow; const view: PsfView): sfIntRect; cdecl;
function  sfRenderWindow_mapPixelToCoords(const renderWindow: PsfRenderWindow; point: sfVector2i; const view: PsfView): sfVector2f; cdecl;
function  sfRenderWindow_mapCoordsToPixel(const renderWindow: PsfRenderWindow; point: sfVector2f; const view: PsfView): sfVector2i; cdecl;
procedure sfRenderWindow_drawSprite(renderWindow: PsfRenderWindow; const &object: PsfSprite; const states: PsfRenderStates); cdecl;
procedure sfRenderWindow_drawShape(renderWindow: PsfRenderWindow; const &object: PsfShape; const states: PsfRenderStates); cdecl;
procedure sfRenderWindow_drawCircleShape(renderWindow: PsfRenderWindow; const &object: PsfCircleShape; const states: PsfRenderStates); cdecl;
procedure sfRenderWindow_drawConvexShape(renderWindow: PsfRenderWindow; const &object: PsfConvexShape; const states: PsfRenderStates); cdecl;
procedure sfRenderWindow_drawRectangleShape(renderWindow: PsfRenderWindow; const &object: PsfRectangleShape; const states: PsfRenderStates); cdecl;
procedure sfRenderWindow_drawVertexArray(renderWindow: PsfRenderWindow; const &object: PsfVertexArray; const states: PsfRenderStates); cdecl;
procedure sfRenderWindow_drawVertexBuffer(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; const states: PsfRenderStates); cdecl;
procedure sfRenderWindow_drawVertexBufferRange(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates); cdecl;
procedure sfRenderWindow_drawPrimitives(renderWindow: PsfRenderWindow; const vertices: PsfVertex; vertexCount: NativeUInt; &type: sfPrimitiveType; const states: PsfRenderStates); cdecl;
procedure sfRenderWindow_pushGLStates(renderWindow: PsfRenderWindow); cdecl;
procedure sfRenderWindow_popGLStates(renderWindow: PsfRenderWindow); cdecl;
procedure sfRenderWindow_resetGLStates(renderWindow: PsfRenderWindow); cdecl;
function  sfRenderWindow_capture(const renderWindow: PsfRenderWindow): PsfImage; cdecl;
function  sfRenderWindow_getDPI(const AWindow: PsfRenderWindow): Cardinal; cdecl;
function  sfRenderWindow_scaleToDPI(const AWindow: PsfRenderWindow; const ABaseWidth, ABaseHeight: Cardinal; const ACenter: Boolean; const ADefaultDPI: Integer=96): Boolean; cdecl;
procedure sfRenderWindow_scaleOnDPIChange(const AWindow: PsfRenderWindow); cdecl;
procedure sfRenderWindow_setDefaultIcon(const AWindow: PsfRenderWindow); cdecl;
procedure sfRenderWindow_drawLine(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2: Single; const AColor: sfColor; const AThickness: Single); cdecl;
procedure sfRenderWindow_drawRect(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight, AThickness: Single; const AColor: sfColor); cdecl;
procedure sfRenderWindow_drawFilledRect(const ARenderWindow: PsfRenderWindow; const X, Y, AWidth, AHeight: Single; const AColor: sfColor); cdecl;
procedure sfRenderWindow_drawText(const AWindow: PsfRenderWindow; const AText: PsfText; const X, Y: Single; const AColor: sfColor; const AMsg: string; const AArgs: array of const); cdecl;
procedure sfRenderWindow_drawTextVarY(const AWindow: PsfRenderWindow; const AText: PsfText; const X: Single; var Y: Single; const AColor: sfColor; const AMsg: WideString; const AArgs: array of const); cdecl;
procedure sfRenderWindow_drawCircle(const AWindow: PsfRenderWindow; const X, Y, ARadius, AThickness: Single; const AColor: sfColor); cdecl;
procedure sfRenderWindow_drawFilledCircle(const AWindow: PsfRenderWindow; const X, Y, ARadius: Single; const AColor: sfColor); cdecl;
procedure sfRenderWindow_drawTriangle(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2, X3, Y3, AThickness: Single; const AColor, AOutlineColor: sfColor); cdecl;
procedure sfRenderWindow_drawFilledTriangle(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2, X3, Y3: Single; const AColor: sfColor); cdecl;
procedure sfRenderWindow_drawPolygon(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AThickness: Single; const AColor, AOutlineColor: sfColor); cdecl;
procedure sfRenderWindow_drawFilledPolygon(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AColor: sfColor); cdecl;
procedure sfRenderWindow_drawPolyline(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AThickness: Single; const AColor: sfColor); cdecl;
procedure sfRenderWindow_drawEllipse(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight, AThickness: Single; const AColor: sfColor); cdecl;
procedure sfRenderWindow_drawFilledEllipse(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight: Single; const AColor: sfColor); cdecl;

{ sfView }
procedure sfView_setLetterBox(const AView: PsfView; const AWindowWidth, AWindowHeight: Integer); cdecl;
function  sfView_createLetterBox(const AWindowWidth, AWindowHeight: Integer): PsfView; cdecl;

{ sfFont }
function sfFont_createFromRes(const AInstance: HINST; const AResName: string): PsfFont; cdecl;
function sfFont_createDefaultFont(): PsfFont; cdecl;
function sfFont_createFromStream(stream: PsfInputStream): PsfFont; cdecl;

{ sfText }
procedure sfText_setCharacterSize(const AWindow: PsfRenderWindow; const AText: PsfText; const ASize: Cardinal); cdecl;
procedure sfText_setUnicodeString(const AText: PsfText; const AString: string); cdecl;

{ sfTexture }
function sfTexture_createFromRes(const AInstance: HINST; const AResName: string; const AArea: PsfIntRect): PsfTexture; cdecl;
function sfTexture_createFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;
function sfTexture_createSrgbFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;

{ sfImage }
function sfImage_createFromStream(stream: PsfInputStream): PsfImage; cdecl;

{ sfMusic }
function sfMusic_createFromStream(stream: PsfInputStream): PsfMusic; cdecl;

{ sfSoundBuffer }
function sfSoundBuffer_createFromStream(stream: PsfInputStream): PsfSoundBuffer; cdecl;

{ sfTime }
procedure sfTime_sleep(const AMilliseconds: Integer); cdecl;

{ sfSoundStream }
procedure sfSoundStream_destroy(const soundStream: PsfSoundStream); cdecl;
procedure sfSoundStream_pause(soundStream: PsfSoundStream); cdecl;
procedure sfSoundStream_stop(soundStream: PsfSoundStream); cdecl;


{ sfShader }
function sfShader_createFromStream(vertexShaderStream: PsfInputStream; geometryShaderStream: PsfInputStream; fragmentShaderStream: PsfInputStream): PsfShader; cdecl;

{ sfVideo }
type
  sfVideoStatus = (vsPlaying, vsStopped, vsPaused);
  sfVideoStatusCallback = procedure(const ASender: Pointer; const AStatus: sfVideoStatus; const AFilename: string); cdecl;

function  sfVideo_playFromStream(const AStream: PsfInputStream; const AVolume: Single; const ALoop: Boolean; const AName: string; const ASender: Pointer; const AHandler: sfVideoStatusCallback): Boolean; cdecl;
function  sfVideo_playFromFile(const AFilename: string; const AVolume: Single; const ALoop: Boolean; const ASender: Pointer=nil; const AHandler: sfVideoStatusCallback=nil): Boolean; cdecl;
function  sfVideo_playFromZipFile(const AZipFilename, AFilename: string; const AVolume: Single; const ALoop: Boolean; const ASender: Pointer=nil; const AHandler: sfVideoStatusCallback=nil; const APassword: string=sfZipFileDefaultPassword): Boolean; cdecl;
procedure sfVideo_destroy(); cdecl;
function  sfVideo_update(const AWindow: PsfRenderWindow): sfVideoStatus; cdecl;
procedure sfVideo_render(const AWindow: PsfRenderWindow; const X, Y, AScale: Single); cdecl;
function  sfVideo_getStatus(): sfVideoStatus; cdecl;
function  sfVideo_isLooping(): Boolean; cdecl;
procedure sfVideo_setLooping(const ALoop: Boolean); cdecl;
function  sfVideo_getVolume(): Single; cdecl;
procedure sfVideo_setVolume(const AVolume: Single); cdecl;

{ sfAudio }

implementation

{$R PSFML.Ext.res}

uses
  WinApi.MMSystem;

{ sfError }
type
  TsfError = record
    Callback: sfErrorCallback;
    UserData: Pointer;
    Msg: string;
  end;

var
  sfError: TsfError;

procedure cerr_callback(const text: PUTF8Char; user_data: Pointer); cdecl;
begin
  sfError_set(UTF8ToUnicodeString(text), []);
end;

procedure sfError_setCallback(const AHandler: sfErrorCallback;  const AUserData: Pointer);
begin
  sfError.Callback := AHandler;
  sfError.UserData := AUserData;
end;

function  sfError_getCallback(): sfErrorCallback;
begin
  Result := sfError.Callback;
end;

procedure sfError_set(const AMsg: string; const AArgs: array of const);
begin
  sfError.Msg := Format(AMsg, AArgs);
  if Assigned(sfError.Callback) then
  begin
    sfError.Callback(sfError.Msg, sfError.UserData);
  end;
end;

function  sfError_getLast(): string;
begin
  Result := sfError.Msg;
end;

{ sfConsole }
procedure sfConsole_Print(const AMsg: string; const AArgs: array of const);
begin
  if not HasConsoleOutput() then Exit;
  Write(Format(AMsg, AArgs)+sfCSIResetFormat);
end;

procedure sfConsole_print();
begin
  if not HasConsoleOutput() then Exit;
  Write;
  Write(sfCSIResetFormat);
end;


procedure sfConsole_printLn(const AMsg: string; const AArgs: array of const);
begin
  if not HasConsoleOutput() then Exit;
  WriteLn(Format(AMsg, AArgs)+sfCSIResetFormat);
end;

procedure sfConsole_printLn();
begin
  if not HasConsoleOutput() then Exit;
  WriteLn;
  Write(sfCSIResetFormat);
end;

procedure sfConsole_setCursorPos(const X, Y: Integer);
begin
  if not HasConsoleOutput() then Exit;
  Write(Format(sfCSICursorPos, [Y, X]));
end;

procedure sfConsole_moveCursorUp(const ALines: Integer);
begin
  if not HasConsoleOutput() then Exit;
  Write(Format(sfCSICursorUp, [ALines]));
end;

procedure sfConsole_moveCursorDown(const ALines: Integer);
begin
  if not HasConsoleOutput() then Exit;
  Write(Format(sfCSICursorDown, [ALines]));
end;

procedure sfConsole_moveCursorForward(const ACols: Integer);
begin
  if not HasConsoleOutput() then Exit;
  Write(Format(sfCSICursorForward, [ACols]));
end;

procedure sfConsole_moveCursorBack(const ACols: Integer);
begin
  if not HasConsoleOutput() then Exit;
  Write(Format(sfCSICursorBack, [ACols]));
end;

procedure sfConsole_clearScreen();
begin
  if not HasConsoleOutput() then Exit;
  Write(sfCSIClearScreen);
  sfConsole_setCursorPos(0, 0);
end;

procedure sfConsole_clearLine();
begin
  if not HasConsoleOutput() then Exit;
  Write(sfCSIClearLine);
end;

procedure sfConsole_hideCursor();
begin
  if not HasConsoleOutput() then Exit;
  Write(sfCSIHideCursor);
end;

procedure sfConsole_showCursor();
begin
  if not HasConsoleOutput() then Exit;
  Write(sfCSIShowCursor);
end;

procedure sfConsole_saveCursorPos();
begin
  if not HasConsoleOutput() then Exit;
  Write(sfCSISaveCursorPos);
end;

procedure sfConsole_restoreCursorPos();
begin
  if not HasConsoleOutput() then Exit;
  Write(sfCSIRestoreCursorPos);
end;

procedure sfConsole_setBoldText;
begin
  if not HasConsoleOutput() then Exit;
  Write(sfCSIBold);
end;

procedure sfConsole_resetTextFormat();
begin
  if not HasConsoleOutput() then Exit;
  Write(sfCSIResetFormat);
end;

procedure sfConsole_setForegroundColor(const AColor: string);
begin
  if not HasConsoleOutput() then Exit;
  Write(AColor);
end;

procedure sfConsole_setBackgroundColor(const AColor: string);
begin
  if not HasConsoleOutput() then Exit;
  Write(AColor);
end;

procedure sfConsole_setForegroundRGB(const ARed, AGreen, ABlue: Byte);
begin
  if not HasConsoleOutput() then Exit;
  Write(Format(sfCSIFGRGB, [ARed, AGreen, ABlue]));
end;

procedure sfConsole_setBackgroundRGB(const ARed, AGreen, ABlue: Byte);
begin
  if not HasConsoleOutput() then Exit;
  Write(Format(sfCSIBGRGB, [ARed, AGreen, ABlue]));
end;

procedure sfConsole_waitForAnyKey();
var
  LInputRec: TInputRecord;
  LNumRead: Cardinal;
  LOldMode: DWORD;
  LStdIn: THandle;
begin
  LStdIn := GetStdHandle(STD_INPUT_HANDLE);
  GetConsoleMode(LStdIn, LOldMode);
  SetConsoleMode(LStdIn, 0);
  repeat
    ReadConsoleInput(LStdIn, LInputRec, 1, LNumRead);
  until (LInputRec.EventType and KEY_EVENT <> 0) and
    LInputRec.Event.KeyEvent.bKeyDown;
  SetConsoleMode(LStdIn, LOldMode);
end;

function sfConsole_anyKeyPressed(): Boolean;
var
  lpNumberOfEvents     : DWORD;
  lpBuffer             : TInputRecord;
  lpNumberOfEventsRead : DWORD;
  nStdHandle           : THandle;
begin
  Result:=false;
  //get the console handle
  nStdHandle := GetStdHandle(STD_INPUT_HANDLE);
  lpNumberOfEvents:=0;
  //get the number of events
  GetNumberOfConsoleInputEvents(nStdHandle,lpNumberOfEvents);
  if lpNumberOfEvents<> 0 then
  begin
    //retrieve the event
    PeekConsoleInput(nStdHandle,lpBuffer,1,lpNumberOfEventsRead);
    if lpNumberOfEventsRead <> 0 then
    begin
      if lpBuffer.EventType = KEY_EVENT then //is a Keyboard event?
      begin
        if lpBuffer.Event.KeyEvent.bKeyDown then //the key was pressed?
          Result:=true
        else
          FlushConsoleInputBuffer(nStdHandle); //flush the buffer
      end
      else
      FlushConsoleInputBuffer(nStdHandle);//flush the buffer
    end;
  end;
end;

procedure sfConsole_pause(const AForcePause: Boolean; AColor: string; const AMsg: string);
var
  LDoPause: Boolean;
begin
  if not HasConsoleOutput then Exit;

  ClearKeyboardBuffer;

  if not AForcePause then
  begin
    LDoPause := True;
    if WasRunFromConsole then LDoPause := False;
    if IsStartedFromDelphiIDE then LDoPause := True;
    if not LDoPause then Exit;
  end;

  WriteLn;
  if aMsg.IsEmpty then
    sfConsole_print('%sPress any key to continue... ', [aColor])
  else
    //Write(aMsg);
    sfConsole_print('%s%s', [aColor, AMsg]);

  sfConsole_waitForAnyKey;
  WriteLn;
end;

procedure sfConsole_setTitle(const ATitle: string);
begin
  WinApi.Windows.SetConsoleTitle(PChar(ATitle));
end;

{ sfVector }
function  sfVector2i_create(const X, Y: Integer): sfVector2i;
begin
  Result.x := X;
  Result.y := Y;
end;

function  sfVector2u_create(const X, Y: Cardinal): sfVector2u;
begin
  Result.x := X;
  Result.y := Y;
end;

function  sfVector2f_create(const X, Y: Single): sfVector2f;
begin
  Result.x := X;
  Result.y := Y;
end;

function  sfVector3f_create(const X, Y, Z: Single): sfVector3f;
begin
  Result.x := X;
  Result.y := Y;
  Result.z := Z;
end;

{ sfRect }
function  sfFloatRect_create(const ALeft, ATop, AWidth, AHeight: Single): sfFloatRect;
begin
  Result.position.x := ALeft;
  Result.position.y := ATop;
  Result.size.x := AWidth;
  Result.size.y := AHeight;
end;

function  sfIntRect_create(const ALeft, ATop, AWidth, AHeight: Integer): sfIntRect;
begin
  Result.position.x := ALeft;
  Result.position.y := ATop;
  Result.size.x := AWidth;
  Result.size.y := AHeight;
end;

{ sfZipFile }
procedure sfZipFile_buildProgress(const ASender: Pointer; const AFilename: string; const AProgress: Integer; const ANewFile: Boolean); cdecl;
begin
  if aNewFile then sfConsole_PrintLn('', []);
  sfConsole_print(#13+'Adding %s(%d%s)...', [ExtractFileName(aFilename), aProgress, '%']);
end;

function sfZipFile_build(const AArchive, ADirectory: string; const APassword: string; const ASender: Pointer; const AHandler: sfZipFile_buildProgressCallback): Boolean;
var
  LFileList: TStringDynArray;
  LArchive: PAnsiChar;
  LFilename: string;
  LFilename2: PAnsiChar;
  LPassword: PAnsiChar;
  LZipFile: zipFile;
  LZipFileInfo: zip_fileinfo;
  LFile: TStream;
  LCrc: Cardinal;
  LBytesRead: Integer;
  LFileSize: Int64;
  LProgress: Single;
  LNewFile: Boolean;
  LHandler: sfZipFile_buildProgressCallback;
  LSender: Pointer;

  function GetCRC32(aStream: TStream): Cardinal;
  var
    LBytesRead: Integer;
    LBuffer: array of Byte;
  begin
    Result := crc32(0, nil, 0);
    repeat
      LBytesRead := AStream.Read(PSFML.Common.GetTempStaticBuffer()^, PSFML.Common.GetTempStaticBufferSize());
      Result := crc32(Result, PBytef(PSFML.Common.GetTempStaticBuffer()), LBytesRead);
    until LBytesRead = 0;

    LBuffer := nil;
  end;

begin
  Result := False;

  // check if directory exists
  if not TDirectory.Exists(ADirectory) then Exit;

  // init variabls
  FillChar(LZipFileInfo, SizeOf(LZipFileInfo), 0);

  // scan folder and build file list
  LFileList := TDirectory.GetFiles(ADirectory, '*',
    TSearchOption.soAllDirectories);

  LArchive := PAnsiChar(AnsiString(AArchive));
  LPassword := PAnsiChar(AnsiString(APassword));

  // create a zip file
  LZipFile := zipOpen64(LArchive, APPEND_STATUS_CREATE);

  // init handler
  LHandler := AHandler;
  LSender := ASender;

  if not Assigned(LHandler) then
    LHandler := sfZipFile_buildProgress;

  // process zip file
  if LZipFile <> nil then
  begin
    // loop through all files in list
    for LFilename in LFileList do
    begin
      // open file
      LFile := TFile.OpenRead(LFilename);

      // get file size
      LFileSize := LFile.Size;

      // get file crc
      LCrc := GetCRC32(LFile);

      // open new file in zip
      LFilename2 := PAnsiChar(AnsiString(LFilename));
      if ZipOpenNewFileInZip3_64(LZipFile, LFilename2, @LZipFileInfo, nil, 0,
        nil, 0, '',  Z_DEFLATED, 9, 0, 15, 9, Z_DEFAULT_STRATEGY,
        LPassword, LCrc, 1) = Z_OK then
      begin
        // make sure we start at star of stream
        LFile.Position := 0;

        LNewFile := True;

        // read through file
        repeat
          // read in a buffer length of file
          LBytesRead := LFile.Read(PSFML.Common.GetTempStaticBuffer()^, PSFML.Common.GetTempStaticBufferSize());

          // write buffer out to zip file
          zipWriteInFileInZip(LZipFile, PSFML.Common.GetTempStaticBuffer(), LBytesRead);

          // calc file progress percentage
          LProgress := 100.0 * (LFile.Position / LFileSize);

          // show progress
          if Assigned(LHandler) then
          begin
            LHandler(LSender, LFilename, Round(LProgress), LNewFile);
          end;

          LNewFile := False;

        until LBytesRead = 0;

        // close file in zip
        zipCloseFileInZip(LZipFile);

        // free file stream
        //FreeNilObject(LFile);
        LFile.Free();
      end;
    end;

    // close zip file
    zipClose(LZipFile, '');
  end;

  // return true if new zip file exits
  Result := TFile.Exists(LFilename);
end;

{ sfInputStream }
function sfInputStream_create(): PsfInputStream;
begin
  New(Result);
end;

function sfInputStream_read(const AInputStream: PsfInputStream; const AData: Pointer; const ASize: Int64): Int64;
begin
  Result := -1;
  if not Assigned(AInputStream) then Exit;
  if not Assigned(AInputStream.Base.read) then Exit;
  Result := AInputStream.Base.read(AData, ASize, AInputStream.Base.userData);
end;

function sfInputStream_seek(const AInputStream: PsfInputStream; const APosition: Int64): Int64;
begin
  Result := -1;
  if not Assigned(AInputStream) then Exit;
  if not Assigned(AInputStream.Base.seek) then Exit;
  Result := AInputStream.Base.seek(APosition, AInputStream.Base.userData);
end;

function sfInputStream_tell(const AInputStream: PsfInputStream): Int64;
begin
  Result := -1;
  if not Assigned(AInputStream) then Exit;
  if not Assigned(AInputStream.Base.tell) then Exit;
  Result := AInputStream.Base.tell(AInputStream.Base.userData);
end;

function sfInputStream_getSize(const AInputStream: PsfInputStream): Int64;
begin
  Result := -1;
  if not Assigned(AInputStream) then Exit;
  if not Assigned(AInputStream.Base.getSize) then Exit;
  Result := AInputStream.Base.getSize(AInputStream.Base.userData);
end;

function sfInputStream_eof(const AInputStream: PsfInputStream): Boolean;
begin
  Result := False;
  if not Assigned(AInputStream) then Exit;
  if not Assigned(AInputStream.Base.tell) then Exit;
  Result := Boolean(AInputStream.Base.tell(AInputStream.Base.userData) >= AInputStream.Base.getSize(AInputStream.Base.userData));
end;

function sfInputStream_close(var AInputStream: PsfInputStream): Boolean;
begin
  Result := False;
  if not Assigned(AInputStream) then Exit;
  if not Assigned(AInputStream.close) then Exit;
  AInputStream.close(AInputStream.Base.userData);
  Dispose(AInputStream);
  AInputStream := nil;
end;

{ sfInputStream_createFromFile }
function File_ReadInputStream(data: Pointer; size: UInt64; userData: Pointer): Int64; cdecl;
var
  LFile: TFileStream;
begin
  LFile := userData;
  Result := LFile.Read(data^, size);
end;

function File_SeekInputStream(position: UInt64; userData: Pointer): Int64; cdecl;
var
  LFile: TFileStream;
begin
  LFile := userData;
  Result := LFile.Seek(position, soBeginning);
end;

function File_TellInputStream(userData: Pointer): Int64; cdecl;
var
  LFile: TFileStream;
begin
  LFile := userData;
  Result := LFile.Position;
end;

function File_GetSizeInputStream(userData: Pointer): Int64; cdecl;
var
  LFile: TFileStream;
begin
  LFile := userData;
  Result := LFile.Size;
end;

function File_CloseInputStream(userData: Pointer): Boolean; cdecl;
var
  LFile: TFileStream;
begin
  Result := False;
  LFile := userData;
  if not Assigned(LFile) then Exit;
  LFile.Free();
  Result := True;
end;

function sfInputStream_createFromFile(const AFilename: string): PsfInputStream;
var
  LFile: TFileStream;
begin
  Result := nil;
  if not TFile.Exists(AFilename) then Exit;

  LFile := TFile.OpenRead(AFilename);

  Result := sfInputStream_create;
  Result.Base.read := File_ReadInputStream;
  Result.Base.seek := File_SeekInputStream;
  Result.Base.tell := File_TellInputStream;
  Result.Base.getSize := File_GetSizeInputStream;
  Result.Base.userData := LFile;
  Result.close := File_CloseInputStream;
end;

{ sfInputStream_createFromMemory }
type
  TStaticMemoryStream = class(TCustomMemoryStream)
  public
    constructor Create(const ABuffer: Pointer; const ASize: NativeInt);
  end;

constructor TStaticMemoryStream.Create(const ABuffer: Pointer; const ASize: NativeInt);
begin
  inherited Create;
  SetPointer(ABuffer, ASize);
end;

function Memory_ReadInputStream(data: Pointer; size: UInt64; userData: Pointer): Int64; cdecl;
var
  LMem: TStaticMemoryStream;
begin
  LMem := userData;
  Result := LMem.Read(data^, size);
end;

function Memory_SeekInputStream(position: UInt64; userData: Pointer): Int64; cdecl;
var
  LMem: TStaticMemoryStream;
begin
  LMem := userData;
  Result := LMem.Seek(position, soBeginning);
end;

function Memory_TellInputStream(userData: Pointer): Int64; cdecl;
var
  LMem: TStaticMemoryStream;
begin
  LMem := userData;
  Result := LMem.Position;
end;

function Memory_GetSizeInputStream(userData: Pointer): Int64; cdecl;
var
  LMem: TStaticMemoryStream;
begin
  LMem := userData;
  Result := LMem.Size;
end;

function Memory_CloseInputStream(userData: Pointer): Boolean; cdecl;
var
  LMem: TStaticMemoryStream;
begin
  Result := False;
  LMem := userData;
  if not Assigned(LMem) then Exit;
  LMem.Free();
  Result := True;
end;

function sfInputStream_createFromMemory(const ABuffer: Pointer; const ASize: Int64): PsfInputStream;
var
  LMem: TStaticMemoryStream;
begin
  Result := nil;
  if not Assigned(ABuffer) then Exit;

  LMem := TStaticMemoryStream.Create(ABuffer, ASize);

  Result := sfInputStream_create;
  Result.Base.read := Memory_ReadInputStream;
  Result.Base.seek := Memory_SeekInputStream;
  Result.Base.tell := Memory_TellInputStream;
  Result.Base.getSize := Memory_GetSizeInputStream;
  Result.Base.userData := LMem;
  Result.close := Memory_CloseInputStream;
end;

{ sfInputStream_createFromZipFile }
type
  { TsfZipFile }
  PsfZipFile = ^TsfZipFile;
  TsfZipFile = record
    ZipFile: unzFile;
    Password: AnsiString;
    Filename: AnsiString;
  end;

function ZipFile_ReadInputStream(data: Pointer; size: UInt64; userData: Pointer): Int64; cdecl;
var
  LZipFile: PsfZipFile;
begin
  LZipFile := userData;
  Result := unzReadCurrentFile(LZipFile.ZipFile, data, size);
end;

function ZipFile_SeekInputStream(position: UInt64; userData: Pointer): Int64; cdecl;
var
  LZipFile: PsfZipFile;
  LBytesToRead: Int64;
begin
  LZipFile := userData;
  unzCloseCurrentFile(LZipFile.ZipFile);
  unzLocateFile(LZipFile.ZipFile, PAnsiChar(LZipFile.Filename), 0);
  unzOpenCurrentFilePassword(LZipFile.ZipFile, PAnsiChar(LZipFile.Password));

  LBytesToRead := UInt64(position) - unztell64(LZipFile.ZipFile);
  while LBytesToRead > 0 do
  begin
    if LBytesToRead > PSFML.Common.GetTempStaticBufferSize() then
      unzReadCurrentFile(LZipFile.ZipFile, PSFML.Common.GetTempStaticBuffer(), PSFML.Common.GetTempStaticBufferSize())
    else
      unzReadCurrentFile(LZipFile.ZipFile, PSFML.Common.GetTempStaticBuffer(), LBytesToRead);

    LBytesToRead := UInt64(position) - unztell64(LZipFile.ZipFile);
  end;

  Result := unztell64(LZipFile.ZipFile);
end;

function ZipFile_TellInputStream(userData: Pointer): Int64; cdecl;
var
  LZipFile: PsfZipFile;
begin
  LZipFile := userData;
  Result := unztell64(LZipFile.ZipFile);
end;

function ZipFile_GetSizeInputStream(userData: Pointer): Int64; cdecl;
var
  LZipFile: PsfZipFile;
  LInfo: unz_file_info64;
begin
  LZipFile := userData;
  unzGetCurrentFileInfo64(LZipFile.ZipFile, @LInfo, nil, 0, nil, 0, nil, 0);
  Result := LInfo.uncompressed_size;
end;

function ZipFile_CloseInputStream(userData: Pointer): Boolean; cdecl;
var
  LZipFile: PsfZipFile;
begin
  Result := False;
  if not Assigned(userData) then Exit;

  LZipFile := userData;

  Assert(unzCloseCurrentFile(LZipFile.ZipFile) = UNZ_OK);
  Assert(unzClose(LZipFile.ZipFile) = UNZ_OK);

  Dispose(LZipFile);

  Result := True;
end;

function sfInputStream_createFromZipFile(const AZipFilename, AFilename: string; const APassword: string): PsfInputStream;
var
  LPassword: PAnsiChar;
  LZipFilename: PAnsiChar;
  LFilename: PAnsiChar;
  LFile: unzFile;
  LZipFile: PsfZipFile;
begin
  Result := nil;

  LPassword := PAnsiChar(AnsiString(APassword));
  LZipFilename := PAnsiChar(AnsiString(StringReplace(AZipFilename, '/', '\', [rfReplaceAll])));
  LFilename := PAnsiChar(AnsiString(StringReplace(AFilename, '/', '\', [rfReplaceAll])));

  LFile := unzOpen64(LZipFilename);
  if not Assigned(LFile) then Exit;

  if unzLocateFile(LFile, LFilename, 0) <> UNZ_OK then
  begin
    unzClose(LFile);
    Exit;
  end;

  if unzOpenCurrentFilePassword(LFile, LPassword) <> UNZ_OK then
  begin
    unzClose(LFile);
    Exit;
  end;

  New(LZipFile);
  LZipFile.ZipFile := LFile;
  LZipFile.Password := AnsiString(APassword);
  LZipFile.Filename := AnsiString(AFilename);

  Result := sfInputStream_create;
  Result.Base.read := ZipFile_ReadInputStream;
  Result.Base.seek := ZipFile_SeekInputStream;
  Result.Base.tell := ZipFile_TellInputStream;
  Result.Base.getSize := ZipFile_GetSizeInputStream;
  Result.Base.userData := LZipFile;
  Result.close := ZipFile_CloseInputStream;

end;

function  sfRenderWindow_create(ATitle: string; const AWidth: Cardinal; const AHeight: Cardinal; const AStyle: Uint32): PsfRenderWindow;
begin
  New(Result);

  Result.Mode.size.x := AWidth;
  Result.Mode.size.y := AHeight;
  Result.Mode.BitsPerPixel := 32;

  Result.Settings := Default(sfContextSettings);

  FillChar(Result.settings, SizeOf(Result.settings), 0);
  Result.settings.depthBits := 24;
  Result.settings.stencilBits := 8;
  Result.settings.antialiasingLevel := 8; // Set anti-aliasing level
  Result.Settings.majorVersion := 2;
  Result.Settings.minorVersion := 1;

  Result.Handle := PSFML.sfRenderWindow_create(Result.Mode, PSFML.Common.AsUTF8(ATitle), AStyle, sfWindowed, @Result.Settings);
  if not Assigned(Result.Handle) then
  begin
    Dispose(Result);
    Exit;
  end;

  sfRenderWindow_setDefaultIcon(Result);

  if not sfRenderWindow_scaleToDPI(Result, AWidth, AHeight, True, 96) then
  begin
    sfRenderWindow_destroy(Result);
    Exit;
  end;
  sfRenderWindow_setFramerateLimit(Result, 60);
  sfRenderWindow_setVerticalSyncEnabled(Result, False);

  Result.View := sfView_createLetterBox(AWidth, AHeight);

  sfRenderWindow_setView(Result, Result.View);

  Result.Size.x := AWidth;
  Result.Size.y := AHeight;

  Result.Timing.FrameCount := 0;
  Result.Timing.FrameRate := 0;
  Result.Timing.Clock := sfClock_create;


  Result.ClearRectangle := sfRectangleShape_create();
  sfRectangleShape_setPosition(Result.ClearRectangle, sfVector2f_create(0, 0));
  sfRectangleShape_setSize(Result.ClearRectangle, sfVector2f_create(AWidth, AHeight));
  sfRectangleShape_setFillColor(Result.ClearRectangle, WHITE);
end;

procedure sfRenderWindow_destroy(var AWindow: PsfRenderWindow);
begin
  //sfVideo_destroy;
  sfRectangleShape_destroy(AWindow.ClearRectangle);
  sfClock_destroy(AWindow.Timing.Clock);
  sfView_destroy(AWindow.View);
  PSFML.sfRenderWindow_destroy(AWindow.Handle);
  Dispose(AWindow);
  AWindow := nil;
end;

procedure sfRenderWindow_toggleFullscreen(const AWindow: PsfRenderWindow);
var
  LWnd: HWND;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  LWnd := HWND(sfRenderWindow_getSystemHandle(AWindow));

  AWindow.Fullscreen := not AWindow.Fullscreen;

  if AWindow.Fullscreen then
    begin
      BringWindowToTop(LWnd);
      SetForegroundWindow(LWnd);
      SetActiveWindow(LWnd);
      SetWindowPos(LWnd, HWND_TOP, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
      sfRenderWindow_toggleBorders(AWindow, False);
      sfRenderWindow_maximize(AWindow);
    end
  else
    begin
      sfRenderWindow_toggleBorders(AWindow, True);
      sfRenderWindow_restore(AWindow);
      SetWindowPos(LWnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
    end;
end;

procedure sfRenderWindow_toggleBorders(const AWindow: PsfRenderWindow; const AShow: Boolean);
var
  LStyle: LongInt;
  LWnd: HWND;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  LWnd := HWND(sfRenderWindow_getSystemHandle(AWindow));

  LStyle := GetWindowLong(LWnd, GWL_STYLE);
  if AShow then
    LStyle := LStyle or (WS_CAPTION or WS_THICKFRAME or WS_BORDER)  // Show title bar and borders
  else
    LStyle := LStyle and not (WS_CAPTION or WS_THICKFRAME or WS_BORDER);  // Hide title bar and borders

  SetWindowLong(LWnd, GWL_STYLE, LStyle);

  // Update window to apply the changes
  SetWindowPos(LWnd, 0, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER or SWP_FRAMECHANGED);
end;

function sfRenderWindow_areBordersVisible(const AWindow: PsfRenderWindow): Boolean;
var
  LStyle: LongInt;
  LWnd: HWND;
begin
  Result := False;
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  LWnd := HWND(sfRenderWindow_getSystemHandle(AWindow));
  LStyle := GetWindowLong(LWnd, GWL_STYLE);
  Result := (LStyle and (WS_BORDER or WS_THICKFRAME)) <> 0;
end;

procedure sfRenderWindow_minimize(const AWindow: PsfRenderWindow);
var
  LWnd: HWND;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  LWnd := HWND(sfRenderWindow_getSystemHandle(AWindow));
  ShowWindow(LWnd, SW_MINIMIZE);
end;

function sfRenderWindow_isMinimized(const AWindow: PsfRenderWindow): Boolean;
var
  LWnd: HWND;
begin
  Result := False;
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  LWnd := HWND(sfRenderWindow_getSystemHandle(AWindow));
  Result := IsIconic(LWnd);
end;

procedure sfRenderWindow_maximize(const AWindow: PsfRenderWindow);
var
  LWnd: HWND;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  LWnd := HWND(sfRenderWindow_getSystemHandle(AWindow));
  ShowWindow(LWnd, SW_MAXIMIZE);
end;

function sfRenderWindow_isMaximized(const AWindow: PsfRenderWindow): Boolean;
var
  LWnd: HWND;
begin
  Result := False;
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  LWnd := HWND(sfRenderWindow_getSystemHandle(AWindow));
  Result := IsZoomed(LWnd);
end;

procedure sfRenderWindow_restore(const AWindow: PsfRenderWindow);
var
  LWnd: HWND;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  LWnd := HWND(sfRenderWindow_getSystemHandle(AWindow));
  ShowWindow(LWnd, SW_RESTORE);
end;

function sfRenderWindow_isRestored(const AWindow: PsfRenderWindow): Boolean;
var
  LWnd: HWND;
begin
  Result := False;
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  LWnd := HWND(sfRenderWindow_getSystemHandle(AWindow));
  Result := not IsIconic(LWnd) and not IsZoomed(LWnd);
end;

procedure sfRenderWindow_setFramerateLimit(const AWindow: PsfRenderWindow; limit: Cardinal);
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  PSFML.sfRenderWindow_setFramerateLimit(AWindow.Handle, limit);
  AWindow.Timing.Limit := limit;
end;

procedure sfRenderWindow_startFrame(const AWindow: PsfRenderWindow);
var
  LMousePos: sfVector2i;
  LWorldMousePos: sfVector2f;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;
  if not Assigned(AWindow.View) then Exit;

  sfRenderWindow_setView(AWindow, AWindow.View);
  sfRenderWindow_drawRectangleShape(AWindow, AWindow.ClearRectangle, nil);

  LMousePos := sfMouse_getPositionRenderWindow(AWindow.Handle);

  LWorldMousePos := sfRenderWindow_mapPixelToCoords(AWindow, LMousePos, AWindow.View);

  LWorldMousePos.x := EnsureRange(LWorldMousePos.x, 0, AWindow.Size.x-1);
  LWorldMousePos.y := EnsureRange(LWorldMousePos.y, 0, AWindow.Size.y-1);

  AWindow.MousePos.x := Round(LWorldMousePos.x);
  AWindow.MousePos.y := Round(LWorldMousePos.y);
end;

function  sfRenderWindow_getFrameMousePos(const AWindow: PsfRenderWindow): sfVector2u;
begin
  Result := sfVector2u_create(0,0);
  if not Assigned(AWindow) then Exit;
  Result := AWindow.MousePos;
end;

procedure sfRenderWindow_clearFrame(const AWindow: PsfRenderWindow; const AColor: sfColor);
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;
  if not Assigned(AWindow.ClearRectangle) then Exit;

  sfRectangleShape_setFillColor(AWindow.ClearRectangle, AColor);
end;

procedure sfRenderWindow_resizeFrame(const AWindow: PsfRenderWindow; const AWidth, AHeight: Cardinal);
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;
  if not Assigned(AWindow.View) then Exit;

  sfView_setLetterBox(AWindow.View, AWidth, AHeight);
end;

procedure sfRenderWindow_endFrame(const AWindow: PsfRenderWindow);
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;
  if not Assigned(AWindow.ClearRectangle) then Exit;
  sfRenderWindow_setView(AWindow, sfRenderWindow_getDefaultView(AWindow));
end;

procedure sfRenderWindow_display(const AWindow: PsfRenderWindow);
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  sfRenderWindow_scaleOnDPIChange(AWindow);

  PSFML.sfRenderWindow_display(AWindow.Handle);

  if Assigned(AWindow.Timing.Clock) then
  begin
    Inc(AWindow.Timing.FrameCount);
    AWindow.Timing.ElapsedTime := sfClock_getElapsedTime(AWindow.Timing.Clock);

    if sfTime_asMilliseconds(AWindow.Timing.ElapsedTime) >= 1000 then
    begin
      AWindow.Timing.FrameRate := AWindow.Timing.FrameCount / (sfTime_asMilliseconds(AWindow.Timing.ElapsedTime) / 1000);
      AWindow.Timing.FrameCount := 0;
      sfClock_restart(AWindow.Timing.Clock);
    end;
  end;
end;

function   sfRenderWindow_getFrameRate(const AWindow: PsfRenderWindow): Cardinal;
begin
  Result := Round(AWindow.Timing.FrameRate);
end;

procedure sfRenderWindow_resetTiming(const AWindow: PsfRenderWindow);
begin
  AWindow.Timing.FrameRate := 0;
  AWindow.Timing.FrameCount := 0;
  sfClock_restart(AWindow.Timing.Clock);
end;

procedure sfRenderWindow_setTitle(const AWindow: PsfRenderWindow; const title: string);
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;
  PSFML.sfRenderWindow_setTitle(AWindow.Handle, PSFML.Common.AsUTF8(title));
end;

function  sfRenderWindow_createUnicode(mode: sfVideoMode; const title: PUint32; style: Uint32; const settings: PsfContextSettings): PsfRenderWindow;
begin
  Result := PSFML.sfRenderWindow_createUnicode(mode, PsfChar32(title), style, sfWindowed, settings);
end;

function  sfRenderWindow_createFromHandle(handle: sfWindowHandle; const settings: PsfContextSettings): PsfRenderWindow;
begin
  Result := PSFML.sfRenderWindow_createFromHandle(handle, settings);
end;

procedure sfRenderWindow_close(renderWindow: PsfRenderWindow);
begin
  PSFML.sfRenderWindow_close(renderWindow.Handle);
end;

function  sfRenderWindow_isOpen(const renderWindow: PsfRenderWindow): Boolean;
begin
  Result := PSFML.sfRenderWindow_isOpen(renderWindow.Handle);
end;

function  sfRenderWindow_getSettings(const renderWindow: PsfRenderWindow): sfContextSettings;
begin
  Result := PSFML.sfRenderWindow_getSettings(renderWindow.Handle);
end;

function  sfRenderWindow_pollEvent(renderWindow: PsfRenderWindow; event: PsfEvent): Boolean;
begin
  Result := PSFML.sfRenderWindow_pollEvent(renderWindow.Handle, event);
end;

function  sfRenderWindow_waitEvent(renderWindow: PsfRenderWindow; timeout: sfTime; event: PsfEvent): Boolean;
begin
  Result := PSFML.sfRenderWindow_waitEvent(renderWindow.Handle, timeout, event);
end;

function  sfRenderWindow_getPosition(const renderWindow: PsfRenderWindow): sfVector2i;
begin
  Result := PSFML.sfRenderWindow_getPosition(renderWindow.Handle);
end;

procedure sfRenderWindow_setPosition(renderWindow: PsfRenderWindow; position: sfVector2i);
begin
  PSFML.sfRenderWindow_setPosition(renderWindow.Handle, position);
end;

function  sfRenderWindow_getSize(const renderWindow: PsfRenderWindow): sfVector2u;
begin
  Result := PSFML.sfRenderWindow_getSize(renderWindow.Handle);
end;

function  sfRenderWindow_isSrgb(const renderWindow: PsfRenderWindow): Boolean;
begin
  Result := PSFML.sfRenderWindow_isSrgb(renderWindow.Handle);
end;

procedure sfRenderWindow_setSize(renderWindow: PsfRenderWindow; size: sfVector2u);
begin
  PSFML.sfRenderWindow_setSize(renderWindow.Handle, size);
end;

procedure sfRenderWindow_setUnicodeTitle(renderWindow: PsfRenderWindow; const title: string);
begin
  PSFML.sfRenderWindow_setUnicodeTitle(renderWindow.Handle, PsfChar32(title));
end;

procedure sfRenderWindow_setIcon(renderWindow: PsfRenderWindow; width: Cardinal; height: Cardinal; const pixels: PUint8);
var
  LSize: sfVector2u;
begin
  LSize.x := width;
  LSize.y := height;
  PSFML.sfRenderWindow_setIcon(renderWindow.Handle, LSize, pixels);
end;

procedure sfRenderWindow_setVisible(renderWindow: PsfRenderWindow; visible: Boolean);
begin
  PSFML.sfRenderWindow_setVisible(renderWindow.Handle, visible);
end;

procedure sfRenderWindow_setVerticalSyncEnabled(renderWindow: PsfRenderWindow; enabled: Boolean);
begin
  PSFML.sfRenderWindow_setVerticalSyncEnabled(renderWindow.Handle, enabled);
end;

procedure sfRenderWindow_setMouseCursorVisible(renderWindow: PsfRenderWindow; show: Boolean);
begin
  PSFML.sfRenderWindow_setMouseCursorVisible(renderWindow.Handle, show);
end;

procedure sfRenderWindow_setMouseCursorGrabbed(renderWindow: PsfRenderWindow; grabbed: Boolean);
begin
  PSFML.sfRenderWindow_setMouseCursorGrabbed(renderWindow.Handle, grabbed);
end;

procedure sfRenderWindow_setMouseCursor(window: PsfRenderWindow; const cursor: PsfCursor);
begin
  PSFML.sfRenderWindow_setMouseCursor(window.Handle, cursor);
end;

procedure sfRenderWindow_setKeyRepeatEnabled(renderWindow: PsfRenderWindow; enabled: Boolean);
begin
 PSFML.sfRenderWindow_setKeyRepeatEnabled(renderWindow.Handle, enabled);
end;

procedure sfRenderWindow_setJoystickThreshold(renderWindow: PsfRenderWindow; threshold: Single);
begin
  PSFML.sfRenderWindow_setJoystickThreshold(renderWindow.Handle, threshold);
end;

function  sfRenderWindow_setActive(renderWindow: PsfRenderWindow; active: Boolean): Boolean;
begin
  Result := PSFML.sfRenderWindow_setActive(renderWindow.Handle, active);
end;

procedure sfRenderWindow_requestFocus(renderWindow: PsfRenderWindow);
begin
  PSFML.sfRenderWindow_requestFocus(renderWindow.Handle);
end;

function  sfRenderWindow_hasFocus(const renderWindow: PsfRenderWindow): Boolean;
begin
  Result := PSFML.sfRenderWindow_hasFocus(renderWindow.Handle);
end;

function  sfRenderWindow_getSystemHandle(const renderWindow: PsfRenderWindow): sfWindowHandle;
begin
  Result := PSFML.sfRenderWindow_getNativeHandle(renderWindow.Handle);
end;

procedure sfRenderWindow_clear(renderWindow: PsfRenderWindow; color: sfColor);
begin
  PSFML.sfRenderWindow_clear(renderWindow.Handle, color);
end;

procedure sfRenderWindow_setView(renderWindow: PsfRenderWindow; const view: PsfView);
begin
  PSFML.sfRenderWindow_setView(renderWindow.Handle, view);
end;

function  sfRenderWindow_getView(const renderWindow: PsfRenderWindow): PsfView;
begin
  Result := PSFML.sfRenderWindow_getView(renderWindow.Handle);
end;

function  sfRenderWindow_getDefaultView(const renderWindow: PsfRenderWindow): PsfView;
begin
  Result := PSFML.sfRenderWindow_getDefaultView(renderWindow.Handle);
end;

function  sfRenderWindow_getViewport(const renderWindow: PsfRenderWindow; const view: PsfView): sfIntRect;
begin
  Result := PSFML.sfRenderWindow_getViewport(renderWindow.Handle, view);
end;

function  sfRenderWindow_mapPixelToCoords(const renderWindow: PsfRenderWindow; point: sfVector2i; const view: PsfView): sfVector2f;
begin
  Result := PSFML.sfRenderWindow_mapPixelToCoords(renderWindow.Handle, point, view);
end;

function  sfRenderWindow_mapCoordsToPixel(const renderWindow: PsfRenderWindow; point: sfVector2f; const view: PsfView): sfVector2i;
begin
  Result := PSFML.sfRenderWindow_mapCoordsToPixel(renderWindow.Handle, point, view);
end;

procedure sfRenderWindow_drawSprite(renderWindow: PsfRenderWindow; const &object: PsfSprite; const states: PsfRenderStates);
begin
  PSFML.sfRenderWindow_drawSprite(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawShape(renderWindow: PsfRenderWindow; const &object: PsfShape; const states: PsfRenderStates);
begin
  PSFML.sfRenderWindow_drawShape(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawCircleShape(renderWindow: PsfRenderWindow; const &object: PsfCircleShape; const states: PsfRenderStates);
begin
  PSFML.sfRenderWindow_drawCircleShape(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawConvexShape(renderWindow: PsfRenderWindow; const &object: PsfConvexShape; const states: PsfRenderStates);
begin
  PSFML.sfRenderWindow_drawConvexShape(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawRectangleShape(renderWindow: PsfRenderWindow; const &object: PsfRectangleShape; const states: PsfRenderStates);
begin
  PSFML.sfRenderWindow_drawRectangleShape(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawVertexArray(renderWindow: PsfRenderWindow; const &object: PsfVertexArray; const states: PsfRenderStates);
begin
  PSFML.sfRenderWindow_drawVertexArray(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawVertexBuffer(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; const states: PsfRenderStates);
begin
  PSFML.sfRenderWindow_drawVertexBuffer(renderWindow.Handle, &object, states);
end;

procedure sfRenderWindow_drawVertexBufferRange(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates);
begin
  PSFML.sfRenderWindow_drawVertexBufferRange(renderWindow.Handle, &object, firstVertex, vertexCount, states);
end;

procedure sfRenderWindow_drawPrimitives(renderWindow: PsfRenderWindow; const vertices: PsfVertex; vertexCount: NativeUInt; &type: sfPrimitiveType; const states: PsfRenderStates);
begin
  PSFML.sfRenderWindow_drawPrimitives(renderWindow.Handle, vertices, vertexCount, &type, states);
end;

procedure sfRenderWindow_pushGLStates(renderWindow: PsfRenderWindow);
begin
  PSFML.sfRenderWindow_pushGLStates(renderWindow.Handle);
end;

procedure sfRenderWindow_popGLStates(renderWindow: PsfRenderWindow);
begin
  PSFML.sfRenderWindow_popGLStates(renderWindow.Handle);
end;

procedure sfRenderWindow_resetGLStates(renderWindow: PsfRenderWindow);
begin
  PSFML.sfRenderWindow_resetGLStates(renderWindow.Handle);
end;

function  sfRenderWindow_capture(const renderWindow: PsfRenderWindow): PsfImage;
var
  LSize: sfVector2u;
  LTexture: PsfTexture;
  LOffset: sfVector2u;
begin
  //TODO: fix
  //Result := Mamba.Deps.sfRenderWindow_capture(renderWindow.Handle);
  // Use a sfTexture and its sfTexture_updateFromRenderWindow(sfTexture*, const sfRenderWindow*, unsigned int, unsigned int) function and copy its contents into an sfImage instead.
  {
  sf::Vector2u windowSize = window.getSize();
  sf::Texture texture;
  texture.create(windowSize.x, windowSize.y);
  texture.update(window);
  sf::Image screenshot = texture.copyToImage()
  }
  Result := nil;
  if not Assigned(renderWindow) then Exit;

  LSize := sfRenderWindow_getSize(renderWindow);
  LTexture := sfTexture_create(LSize);
  if not Assigned(LTexture)  then Exit;

  LOffset.x := 0;
  LOffset.y := 0;
  sfTexture_updateFromWindow(LTexture, renderWindow, LOffset);
  Result := sfTexture_copyToImage(LTexture);
  sfTexture_destroy(LTexture);
end;

function sfRenderWindow_getDPI(const AWindow: PsfRenderWindow): Cardinal;
begin
  Result := 0;
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;
  Result := GetDpiForWindow(HWND(sfRenderWindow_getSystemHandle(AWindow)));
end;


function sfRenderWindow_scaleToDPI(const AWindow: PsfRenderWindow; const ABaseWidth, ABaseHeight: Cardinal; const ACenter: Boolean; const ADefaultDPI: Integer=96): Boolean;
var
  LDpi: UINT;
  LSize: sfVector2u;
  LScaleSize: sfVector2u;
  LPos: sfVector2i;
  LScreenSize: sfVector2i;
begin
  Result := False;
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  // get window DPI
  LDpi := GetDpiForWindow(HWND(sfRenderWindow_getSystemHandle(AWindow)));

  // get window size
  //LSize := sfRenderWindow_getSize(AWindow);
  LSize.x := ABaseWidth;
  LSize.y := ABaseHeight;

  // get scaled widow size
  LScaleSize.x := MulDiv(LSize.x, LDPI, ADefaultDPI);
  LScaleSize.y := MulDiv(LSize.y, LDpi, ADefaultDPI);

  if ACenter then
  begin
    // get center window position
    LScreenSize := GetScreenWorkAreaSize;

    LPos.x := (Cardinal(LScreenSize.X) - LScaleSize.x) div 2;
    LPos.y := (Cardinal(LScreenSize.Y) - LScaleSize.y) div 2;

    // set new postion
    sfRenderWindow_setPosition(AWindow, LPos);

    AWindow.Size.x := ABaseWidth;
    AWindow.Size.y := ABaseHeight;

    AWindow.ScaleSize.x := LScaleSize.x;
    AWindow.ScaleSize.y := LScaleSize.y;
  end;

  // set new scale
  sfRenderWindow_setSize(AWindow, LScaleSize);

  // update scale & DPI
  AWindow.Scale := LDpi / ADefaultDPI;
  AWindow.Dpi := LDpi;

  Result := True;
end;

procedure sfRenderWindow_scaleOnDPIChange(const AWindow: PsfRenderWindow);
begin
  if sfRenderWindow_getDPI(AWindow) <> AWindow.Dpi then
  begin
    //sfRenderWindow_scaleToDPI(AWindow, AWindow.Mode.width, AWindow.Mode.height, False, 96);
    sfRenderWindow_scaleToDPI(AWindow, Round(AWindow.Size.x), Round(AWindow.Size.y), False, 96);
  end;
end;

procedure sfRenderWindow_setDefaultIcon(const AWindow: PsfRenderWindow);
var
  IconHandle: HICON;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  IconHandle := LoadIcon(HInstance, 'MAINICON');
  if IconHandle <> 0 then
  begin
    SendMessage(HWND(sfRenderWindow_getSystemHandle(AWindow)), WM_SETICON, ICON_BIG, IconHandle);
  end;
end;

procedure sfRenderWindow_drawLine(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2: Single; const AColor: sfColor; const AThickness: Single);
var
  length, angle: Single;
  rectangle: PsfRectangleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  length := Sqrt(Sqr(X2 - X1) + Sqr(Y2 - Y1));
  angle := ArcTan2(Y2 - Y1, X2 - X1) * (180 / Pi);

  rectangle := sfRectangleShape_create();
  try
    sfRectangleShape_setPosition(rectangle, sfVector2f_create(X1, Y1));
    sfRectangleShape_setSize(rectangle, sfVector2f_create(length, AThickness));
    sfRectangleShape_setFillColor(rectangle, AColor);
    sfRectangleShape_setRotation(rectangle, angle);

    sfRenderWindow_drawRectangleShape(AWindow, rectangle, nil);
  finally
    sfRectangleShape_destroy(rectangle);
  end;
end;

procedure sfRenderWindow_drawRect(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight, AThickness: Single; const AColor: sfColor);
var
  top, bottom, left, right: PsfRectangleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  // Top
  top := sfRectangleShape_create();
  sfRectangleShape_setPosition(top, sfVector2f_create(X, Y));
  sfRectangleShape_setSize(top, sfVector2f_create(AWidth, AThickness));
  sfRectangleShape_setFillColor(top, AColor);
  sfRenderWindow_drawRectangleShape(AWindow, top, nil);
  sfRectangleShape_destroy(top);

  // Bottom
  bottom := sfRectangleShape_create();
  sfRectangleShape_setPosition(bottom, sfVector2f_create(X, Y + AHeight - AThickness));
  sfRectangleShape_setSize(bottom, sfVector2f_create(AWidth, AThickness));
  sfRectangleShape_setFillColor(bottom, AColor);
  sfRenderWindow_drawRectangleShape(AWindow, bottom, nil);
  sfRectangleShape_destroy(bottom);

  // Left
  left := sfRectangleShape_create();
  sfRectangleShape_setPosition(left, sfVector2f_create(X, Y + AThickness));
  sfRectangleShape_setSize(left, sfVector2f_create(AThickness, AHeight - 2 * AThickness));
  sfRectangleShape_setFillColor(left, AColor);
  sfRenderWindow_drawRectangleShape(AWindow, left, nil);
  sfRectangleShape_destroy(left);

  // Right
  right := sfRectangleShape_create();
  sfRectangleShape_setPosition(right, sfVector2f_create(X + AWidth - AThickness, Y + AThickness));
  sfRectangleShape_setSize(right, sfVector2f_create(AThickness, AHeight - 2 * AThickness));
  sfRectangleShape_setFillColor(right, AColor);
  sfRenderWindow_drawRectangleShape(AWindow, right, nil);
  sfRectangleShape_destroy(right);
end;

procedure sfRenderWindow_drawFilledRect(const ARenderWindow: PsfRenderWindow; const X, Y, AWidth, AHeight: Single; const AColor: sfColor);
var
  rectangle: PsfRectangleShape;
begin
  if not Assigned(ARenderWindow) then Exit;
  if not Assigned(ARenderWindow.Handle) then Exit;

  rectangle := sfRectangleShape_create();
  sfRectangleShape_setPosition(rectangle, sfVector2f_create(X, Y));
  sfRectangleShape_setSize(rectangle, sfVector2f_create(AWidth, AHeight));
  sfRectangleShape_setFillColor(rectangle, AColor);
  sfRenderWindow_drawRectangleShape(ARenderWindow, rectangle, nil);
  sfRectangleShape_destroy(rectangle);
end;

procedure sfRenderWindow_drawText(const AWindow: PsfRenderWindow; const AText: PsfText; const X, Y: Single; const AColor: sfColor; const AMsg: string; const AArgs: array of const);
var
  LText: string;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;
  if not Assigned(AText) then Exit;

  LText := Format(AMsg, AArgs);
  sfText_setUnicodeString(AText, LText);
  sfText_setFillColor(AText, AColor);
  sfText_setPosition(AText, sfVector2f_create(X, Y));
  PSFML.sfRenderWindow_drawText(AWindow.Handle, AText, nil);
end;

procedure sfRenderWindow_drawTextVarY(const AWindow: PsfRenderWindow; const AText: PsfText; const X: Single; var Y: Single; const AColor: sfColor; const AMsg: WideString; const AArgs: array of const);
var
  LFont: PsfFont;
  LSize: Cardinal;
begin
  sfRenderWindow_drawText(AWindow, AText, X, Y, AColor, AMsg, AArgs);

  LFont := sfText_GetFont(AText);
  LSize := sfText_GetCharacterSize(AText);

  Y := Y + sfFont_GetLineSpacing(LFont, LSize);
end;


procedure sfRenderWindow_drawCircle(const AWindow: PsfRenderWindow; const X, Y, ARadius, AThickness: Single; const AColor: sfColor);
var
  circle: PsfCircleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  circle := sfCircleShape_create();
  sfCircleShape_setPosition(circle, sfVector2f_create(X - ARadius, Y - ARadius));
  sfCircleShape_setRadius(circle, ARadius);
  sfCircleShape_setFillColor(circle, TRANSPARENT);
  sfCircleShape_setOutlineThickness(circle, AThickness);
  sfCircleShape_setOutlineColor(circle, AColor);
  sfRenderWindow_drawCircleShape(AWindow, circle, nil);
  sfCircleShape_destroy(circle);
end;

procedure sfRenderWindow_drawFilledCircle(const AWindow: PsfRenderWindow; const X, Y, ARadius: Single; const AColor: sfColor);
var
  circle: PsfCircleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  circle := sfCircleShape_create();
  sfCircleShape_setPosition(circle, sfVector2f_create(X - ARadius, Y - ARadius));
  sfCircleShape_setRadius(circle, ARadius);
  sfCircleShape_setFillColor(circle, AColor);
  sfRenderWindow_drawCircleShape(AWindow, circle, nil);
  sfCircleShape_destroy(circle);
end;

procedure sfRenderWindow_drawTriangle(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2, X3, Y3, AThickness: Single; const AColor, AOutlineColor: sfColor);
var
  triangle: PsfConvexShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  triangle := sfConvexShape_create();
  sfConvexShape_setPointCount(triangle, 3);
  sfConvexShape_setPoint(triangle, 0, sfVector2f_create(X1, Y1));
  sfConvexShape_setPoint(triangle, 1, sfVector2f_create(X2, Y2));
  sfConvexShape_setPoint(triangle, 2, sfVector2f_create(X3, Y3));
  sfConvexShape_setFillColor(triangle, TRANSPARENT);
  sfConvexShape_setOutlineThickness(triangle, AThickness);
  sfConvexShape_setOutlineColor(triangle, AOutlineColor);
  sfRenderWindow_drawConvexShape(AWindow, triangle, nil);
  sfConvexShape_destroy(triangle);
end;

procedure sfRenderWindow_drawFilledTriangle(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2, X3, Y3: Single; const AColor: sfColor);
var
  triangle: PsfConvexShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  triangle := sfConvexShape_create();
  sfConvexShape_setPointCount(triangle, 3);
  sfConvexShape_setPoint(triangle, 0, sfVector2f_create(X1, Y1));
  sfConvexShape_setPoint(triangle, 1, sfVector2f_create(X2, Y2));
  sfConvexShape_setPoint(triangle, 2, sfVector2f_create(X3, Y3));
  sfConvexShape_setFillColor(triangle, AColor);
  sfRenderWindow_drawConvexShape(AWindow, triangle, nil);
  sfConvexShape_destroy(triangle);
end;

procedure sfRenderWindow_drawPolygon(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AThickness: Single; const AColor, AOutlineColor: sfColor);
var
  polygon: PsfConvexShape;
  i: Integer;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  polygon := sfConvexShape_create();
  sfConvexShape_setPointCount(polygon, Length(APoints));
  for i := 0 to Length(APoints) - 1 do
    sfConvexShape_setPoint(polygon, i, APoints[i]);
  sfConvexShape_setFillColor(polygon, Transparent);
  sfConvexShape_setOutlineThickness(polygon, AThickness);
  sfConvexShape_setOutlineColor(polygon, AOutlineColor);
  sfRenderWindow_drawConvexShape(AWindow, polygon, nil);
  sfConvexShape_destroy(polygon);
end;

procedure sfRenderWindow_drawFilledPolygon(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AColor: sfColor);
var
  polygon: PsfConvexShape;
  i: Integer;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  polygon := sfConvexShape_create();
  sfConvexShape_setPointCount(polygon, Length(APoints));
  for i := 0 to Length(APoints) - 1 do
    sfConvexShape_setPoint(polygon, i, APoints[i]);
  sfConvexShape_setFillColor(polygon, AColor);
  sfRenderWindow_drawConvexShape(AWindow, polygon, nil);
  sfConvexShape_destroy(polygon);
end;

procedure sfRenderWindow_drawPolyline(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AThickness: Single; const AColor: sfColor);
var
  line: PsfVertexArray;
  i: Integer;
  vertex: sfVertex;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  line := sfVertexArray_create();
  sfVertexArray_setPrimitiveType(line, sfLineStrip);
  for i := 0 to Length(APoints) - 1 do
  begin
    vertex.position := APoints[i];
    vertex.color := AColor;
    vertex.texCoords.x := 0;
    vertex.texCoords.y := 0;
    sfVertexArray_append(line, vertex);
  end;
  sfRenderWindow_drawVertexArray(AWindow, line, nil);
  sfVertexArray_destroy(line);
end;

procedure sfRenderWindow_drawEllipse(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight, AThickness: Single; const AColor: sfColor);
var
  ellipse: PsfCircleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  ellipse := sfCircleShape_create();
  sfCircleShape_setRadius(ellipse, 0.5);
  sfCircleShape_setOutlineThickness(ellipse, AThickness / AWidth);
  sfCircleShape_setFillColor(ellipse, Transparent);
  sfCircleShape_setOutlineColor(ellipse, AColor);
  sfCircleShape_setScale(ellipse, sfVector2f_create(AWidth, AHeight));
  sfCircleShape_setPosition(ellipse, sfVector2f_create(X, Y));
  sfRenderWindow_drawCircleShape(AWindow, ellipse, nil);
  sfCircleShape_destroy(ellipse);
end;

procedure sfRenderWindow_drawFilledEllipse(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight: Single; const AColor: sfColor);
var
  ellipse: PsfCircleShape;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  ellipse := sfCircleShape_create();
  sfCircleShape_setRadius(ellipse, 0.5);
  sfCircleShape_setFillColor(ellipse, AColor);
  sfCircleShape_setScale(ellipse, sfVector2f_create(AWidth, AHeight));
  sfCircleShape_setPosition(ellipse, sfVector2f_create(X, Y));
  sfRenderWindow_drawCircleShape(AWindow, ellipse, nil);
  sfCircleShape_destroy(ellipse);
end;

{ sfView }
procedure sfView_setLetterBox(const AView: PsfView; const AWindowWidth, AWindowHeight: Integer);
var
  LWindowRatio: Single;
  LViewRatio: Single;
  LViewPort: sfFloatRect;
  LHorizontalSpacing: Boolean;
begin
  LWindowRatio:= AWindowWidth / AWindowHeight;
  LViewRatio := sfView_getSize(AView).x / sfView_getSize(AView).y;
  LHorizontalSpacing := True;

  LViewPort.position.x := 0;
  LViewPort.position.y := 0;
  LViewPort.size.x := 1;
  LViewPort.size.y := 1;

  if LWindowRatio < LViewRatio then
    LHorizontalSpacing := false;

  if LHorizontalSpacing then
    begin
      //LViewPort.width := LViewRatio / LWindowRatio;
      //LViewPort.left := (1 - LViewPort.width) / 2.0;

      LViewPort.size.x := LViewRatio / LWindowRatio;
      LViewPort.position.x := (1 - LViewPort.size.x) / 2.0;
    end
  else
    begin
      //LViewPort.height := LWindowRatio / LViewRatio;
      //LViewPort.top := (1 - LViewPort.height) / 2.0;
      LViewPort.size.y := LWindowRatio / LViewRatio;
      LViewPort.position.y := (1 - LViewPort.size.y) / 2.0;
    end;

  sfView_setViewport(AView, LViewPort);
end;

function  sfView_createLetterBox(const AWindowWidth, AWindowHeight: Integer): PsfView;
begin
  Result := sfView_create;
  sfView_setSize(Result, sfVector2f_create(AWindowWidth, AWindowHeight));
  sfView_setCenter(Result, sfVector2f_create(sfView_getSize(Result).x/2, sfView_getSize(Result).y/2));
  sfView_setLetterBox(Result, AWindowWidth, AWindowHeight);
end;

{ sfFont }
function sfFont_createFromRes(const AInstance: HINST; const AResName: string): PsfFont;
var
  LResStream: TResourceStream;
begin
  Result := nil;
  if not PSFML.Common.ResourceExist(AInstance, AResName) then Exit;
  LResStream := TResourceStream.Create(AInstance, AResName, RT_RCDATA);
  try
    Result := sfFont_createFromMemory(LResStream.Memory, LResStream.Size);
  finally
    LResStream.Free;
  end;
end;

function sfFont_createDefaultFont: PsfFont;
begin
  Result := sfFont_createFromRes(HInstance, 'a22a034b88d844578c672a8073d49229');
end;

function sfFont_createFromStream(stream: PsfInputStream): PsfFont;
begin
  Result := PSFML.sfFont_createFromStream(@stream.Base);
end;

{ sfText }
procedure sfText_setCharacterSize(const AWindow: PsfRenderWindow; const AText: PsfText; const ASize: Cardinal);
var
  LSize: Cardinal;
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  if not Assigned(AText) then Exit;

  LSize := Round(ASize * AWindow.Scale);
  PSFML.sfText_setCharacterSize(AText, LSize);
end;

procedure sfText_setUnicodeString(const AText: PsfText; const AString: string);
begin
  if not Assigned(AText) then Exit;
  PSFML.sfText_setUnicodeString(AText, PsfChar32(WideStringToUCS4String(AString)));
end;



{ sfTexture }
function sfTexture_createFromRes(const AInstance: HINST; const AResName: string; const AArea: PsfIntRect): PsfTexture;
var
  LResStream: TResourceStream;
begin
  Result := nil;
  if not PSFML.Common.ResourceExist(AInstance, AResName) then Exit;
  LResStream := TResourceStream.Create(AInstance, AResName, RT_RCDATA);
  try
    Result := sfTexture_createFromMemory(LResStream.Memory, LResStream.Size, AArea);
  finally
    LResStream.Free;
  end;
end;

function sfTexture_createFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture;
begin
  Result := PSFML.sfTexture_createFromStream(@stream.Base, area);
end;

function sfTexture_createSrgbFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture;
begin
  Result := PSFML.sfTexture_createSrgbFromStream(@stream.Base, area);
end;

{ sfImage }
function sfImage_createFromStream(stream: PsfInputStream): PsfImage;
begin
  Result := PSFML.sfImage_createFromStream(@stream.Base);
end;

{ sfMusic }
function sfMusic_createFromStream(stream: PsfInputStream): PsfMusic;
begin
  Result := PSFML.sfMusic_createFromStream(@stream.Base);
end;

{ sfSoundBuffer }
function sfSoundBuffer_createFromStream(stream: PsfInputStream): PsfSoundBuffer;
begin
  Result := PSFML.sfSoundBuffer_createFromStream(@stream.Base);
end;


{ sfTime }
var
  sfTimeFrequency: Int64 = 0; // Global variable to store the frequency

procedure sfTime_sleep(const AMilliseconds: Integer);
var
  LStartTime, LCurrentTime: Int64;
  LDelayTicks: Int64;
begin
  if AMilliseconds = 0 then Exit;

  // Initialize the frequency only once
  if sfTimeFrequency = 0 then
    QueryPerformanceFrequency(sfTimeFrequency);

  QueryPerformanceCounter(LStartTime);
  LDelayTicks := (AMilliseconds * sfTimeFrequency) div 1000;

  repeat
    SleepEx(1, True); // SleepEx in alertable mode to allow background tasks
    QueryPerformanceCounter(LCurrentTime);
  until (LCurrentTime - LStartTime) >= LDelayTicks;
end;

{ sfSoundStream }
procedure sfSoundStream_destroy(const soundStream: PsfSoundStream);
begin
  PSFML.sfSoundStream_destroy(soundStream);
end;

procedure sfSoundStream_pause(soundStream: PsfSoundStream);
begin
  PSFML.sfSoundStream_pause(soundStream);
end;

procedure sfSoundStream_stop(soundStream: PsfSoundStream);
begin
  PSFML.sfSoundStream_stop(soundStream);
end;

{ sfShader }
function sfShader_createFromStream(vertexShaderStream: PsfInputStream; geometryShaderStream: PsfInputStream; fragmentShaderStream: PsfInputStream): PsfShader;
begin
  Result := PSFML.sfShader_createFromStream(@vertexShaderStream.Base, @geometryShaderStream.Base, @fragmentShaderStream.Base);
end;

{ sfVideo }
type
  PsfVideo = ^TsfVideo;
  TsfVideo = record
  public const
    CPlmBufferSize = 1024*1;
    CSampleBuffSize  = 2304;
    Channels = 2;
    //BufferSize = 44100 * Channels * sizeof(SmallInt);
    BufferSize = 44100;
  public
    Image: PsfImage;
    Texture: PsfTexture;
    Sprite: PsfSprite;
    AudioStream:  PsfSoundStream;
    InputStream: PsfInputStream;
    Handle: Pplm_t;
    RingBuffer: TRingBuffer<Byte>;
    TextureWidth,TextureHeight: integer;
    Loop: Boolean;
    SampleRate: Integer;
    FrameRate: Integer;
    Volume: Single;
    Status: sfVideoStatus;
    StopFlag: Boolean;
    Sender: Pointer;
    Handler: sfVideoStatusCallback;
    Name: string;
    DataBuffer: array[0..CPlmBufferSize-1] of Byte;
    SampleBuffer: array[0..CSampleBuffSize-1] of Byte;
    AudioDecodeBuffer1: array[0..CSampleBuffSize-1] of smallint;
    AudioDecodeBuffer2: array[0..(CSampleBuffSize*sizeof(smallint))-1] of Byte;
  end;

var
  sfVideo: TsfVideo;

procedure Video_OnGetVideoData(buffer: Pplm_buffer_t; user: Pointer); cdecl;
var
  LVideo: PsfVideo;

  LBytesRead: Int64;
begin
  LVideo := user;

  LBytesRead := sfInputStream_read(LVideo.InputStream, @LVideo.DataBuffer[0], LVideo.CPlmBufferSize);
  if LBytesRead > 0 then
    begin
      plm_buffer_write(Buffer, @LVideo.DataBuffer[0], LBytesRead);
    end
  else
    begin
      LVideo.StopFlag := True;
    end;
end;

function Video_OnGetSampleData(Data: PsfSoundStreamChunk; UserData: Pointer): Boolean; cdecl;
var
  LVideo: PsfVideo;
  LReadCount: Int64;
begin
  Result := False;
  LVideo := UserData;
  if LVideo.Status = vsStopped then Exit;
  if LVideo.RingBuffer = nil then Exit;
  Data.samples := @LVideo.SampleBuffer;
  LReadCount := LVideo.RingBuffer.Read(LVideo.SampleBuffer, LVideo.CSampleBuffSize);
  Data.sampleCount := LReadcount div LVideo.Channels;
  Result := True;
end;

function FloatToSmallInt(Value: Single): SmallInt; inline;
begin
  Result := Round(EnsureRange(Value, -1.0, 1.0) * 32767);
end;

procedure Video_OnDecodeAudio(plm: Pplm_t; samples: Pplm_samples_t; user: Pointer); cdecl;
var
  LVideo: PsfVideo;
  i: Integer;
begin
  LVideo := user;

  for i := 0 to LVideo.CSampleBuffSize-1 do
  begin
    LVideo.AudioDecodeBuffer1[i] := FloatToSmallInt(samples.interleaved[i]);
  end;

  Move(LVideo.AudioDecodeBuffer1, LVideo.AudioDecodeBuffer2, Sizeof(LVideo.AudioDecodeBuffer1));
  LVideo.ringBuffer.Write(LVideo.AudioDecodeBuffer2, LVideo.CSampleBuffSize*sizeof(smallint));
end;

procedure Video_OnDecodeVideo(plm: pplm_t; frame: pplm_frame_t; user: pointer); cdecl;
var
  LVideo: PsfVideo;
  LOffset: sfVector2u;
begin
  LVideo := user;

  plm_frame_to_rgba(Frame, PUInt8(sfImage_getPixelsPtr(LVideo.Image)), 4*LVideo.Texturewidth);
  LOffset := sfVector2u_create(0, 0);
  sfTexture_updateFromImage(LVideo.Texture, LVideo.Image, LOffset);
end;

function  sfVideo_playFromStream(const AStream: PsfInputStream; const AVolume: Single; const ALoop: Boolean; const AName: string; const ASender: Pointer; const AHandler: sfVideoStatusCallback): Boolean;
var
  LDataBuffer: Pplm_buffer_t;
  LSize: sfVector2u;
begin
  Result := False;

  sfVideo_destroy();

  sfVideo.Volume := AVolume;
  sfVideo.Loop := ALoop;
  sfVideo.Status := vsStopped;
  sfVideo.InputStream := AStream;

  LDataBuffer := plm_buffer_create_with_capacity(sfVideo.CPlmBufferSize);
  if not Assigned(LDataBuffer) then Exit;

  plm_buffer_set_load_callback(LDataBuffer, Video_OnGetVideoData, @sfVideo);

  sfVideo.Handle := plm_create_with_buffer(LDataBuffer, 1);
  if not Assigned(sfVideo.Handle) then
  begin
    plm_buffer_destroy(LDataBuffer);
    Exit;
  end;

  plm_set_loop(sfVideo.Handle, 0);

  sfVideo.TextureWidth := plm_get_width(sfVideo.Handle);
  sfVideo.TextureHeight := plm_get_height(sfVideo.Handle);
  sfVideo.SampleRate := plm_get_samplerate(sfVideo.Handle);

  LSize := sfVector2u_create(sfVideo.TextureWidth, sfVideo.TextureHeight);
  sfVideo.Image := sfImage_createFromColor(LSize, WHITE);
  if not Assigned(sfVideo.Image) then
  begin
    sfVideo_destroy();
    Exit;
  end;

  LSize := sfVector2u_create(sfVideo.TextureWidth, sfVideo.TextureHeight);
  sfVideo.Texture := sfTexture_create(LSize);
  if not Assigned(sfVideo.Texture) then
  begin
    sfVideo_destroy();
    Exit;
  end;

  sfVideo.Sprite := sfSprite_create(sfVideo.Texture);
  if not Assigned(sfVideo.Sprite) then
  begin
    sfVideo_destroy();
    Exit;
  end;
  sfSprite_setTexture(sfVideo.Sprite, sfVideo.Texture, True);

  sfVideo.RingBuffer := TRingBuffer<byte>.Create(sfVideo.BufferSize);
  if not Assigned(sfVideo.RingBuffer) then
  begin
    sfVideo_destroy();
    Exit;
  end;

  sfVideo.AudioStream := sfSoundStream_create(Video_OnGetSampleData, nil, 2, 44100, nil, 0, @sfVideo);
  if not Assigned(sfVideo.AudioStream) then
  begin
    sfVideo_destroy();
    Exit;
  end;

  sfVideo.Sender := ASender;
  sfVideo.Handler := AHandler;
  sfVideo.Name := AName;
  sfVideo.Status := vsPlaying;

  if Assigned(sfVideo.Handler) then
  begin
    sfVideo.Handler(sfVideo.Sender, sfVideo.Status, sfVideo.Name);
  end;

  plm_set_audio_decode_callback(sfVideo.Handle, @Video_OnDecodeAudio, @sfVideo);
  plm_set_video_decode_callback(sfVideo.Handle, @Video_OnDecodeVideo, @sfVideo);
  plm_set_audio_lead_time(sfVideo.Handle, sfVideo.CSampleBuffSize/sfVideo.SampleRate);

  sfSoundStream_play(sfVideo.AudioStream);
  sfVideo_setVolume(AVolume);

  Result := True;
end;

function  sfVideo_playFromFile(const AFilename: string; const AVolume: Single; const ALoop: Boolean; const ASender: Pointer; const AHandler: sfVideoStatusCallback): Boolean;
var
  LStream: PsfInputStream;
begin
  Result := False;
  LStream := sfInputStream_createFromFile(AFilename);
  if not Assigned(LStream) then Exit;

  Result := sfVideo_playFromStream(LStream, AVolume, ALoop, AFilename, ASender, aHandler);
end;

function  sfVideo_playFromZipFile(const AZipFilename, AFilename: string; const AVolume: Single; const ALoop: Boolean; const ASender: Pointer; const AHandler: sfVideoStatusCallback; const APassword: string): Boolean;
var
  LStream: PsfInputStream;
begin
  Result := False;
  LStream := sfInputStream_createFromZipFile(AZipFilename, AFilename, APassword);
  if not Assigned(LStream) then Exit;

  Result := sfVideo_playFromStream(LStream, AVolume, ALoop, AFilename, ASender, aHandler);
end;

procedure sfVideo_destroy();
begin

  sfVideo.Status := vsStopped;

  if Assigned(sfVideo.AudioStream) then
  begin
    sfSoundStream_stop(sfVideo.AudioStream);
    sfSoundStream_destroy(sfVideo.AudioStream);
    sfVideo.RingBuffer.Clear();
  end;

  if Assigned(sfVideo.InputStream) then
  begin
    sfInputStream_close(sfVideo.InputStream);
    sfVideo.InputStream := nil;
  end;

  if Assigned(sfVideo.Sprite) then
  begin
    sfSprite_destroy(sfVideo.Sprite);
    sfVideo.Sprite := nil;
  end;

  if Assigned(sfVideo.Texture) then
  begin
    sfTexture_destroy(sfVideo.Texture);
    sfVideo.Texture := nil;
  end;

  if Assigned(sfVideo.Image) then
  begin
    sfImage_destroy(sfVideo.Image);
    sfVideo.Image := nil;
  end;

  if Assigned(sfVideo.RingBuffer) then
  begin
    sfVideo.RingBuffer.Free;
    sfVideo.RingBuffer := nil;
  end;

  if Assigned(sfVideo.Handle) then
  begin
    plm_destroy(sfVideo.Handle);
    sfVideo.Handle := nil;
  end;

  sfVideo := Default(TsfVideo);
end;

function sfVideo_update(const AWindow: PsfRenderWindow): sfVideoStatus;
begin
  Result := sfVideo.Status;

  if not Assigned(sfVideo.Handle) then Exit;
  if not Assigned(sfVideo.AudioStream) then Exit;
  if not Assigned(sfVideo.InputStream) then Exit;
  if sfVideo.Status <> vsPlaying then Exit;

  if sfVideo.StopFlag then
    begin
      if sfVideo.Loop then
        begin
          sfSoundStream_stop(sfVideo.AudioStream);
          sfVideo.RingBuffer.Clear;
          plm_rewind(sfVideo.Handle);
          sfInputStream_seek(sfVideo.InputStream, 0);
          sfSoundStream_play(sfVideo.AudioStream);
          sfVideo.Status := vsPlaying;
          sfVideo.StopFlag := False;
        end
      else
        begin
          sfVideo.Status := vsStopped;
          sfSoundStream_stop(sfVideo.AudioStream);
          sfVideo.RingBuffer.Clear;
          if Assigned(sfVideo.Handler) then
          begin
            sfVideo.Handler(sfVideo.Sender, sfVideo.Status, sfVideo.Name);
          end;
        end;
    end
  else
    begin
      plm_decode(sfVideo.Handle, 1.0/AWindow.Timing.Limit);
    end;

  Result := sfVideo.Status;
end;

procedure sfVideo_render(const AWindow: PsfRenderWindow; const X, Y, AScale: Single);
begin
  if not Assigned(AWindow) then Exit;
  if not Assigned(AWindow.Handle) then Exit;

  if not Assigned(sfVideo.Handle) then Exit;
  if sfVideo.Status <> vsPlaying then Exit;
  sfSprite_setScale(sfVideo.Sprite, sfVector2f_create(AScale, AScale));
  sfRenderWindow_drawSprite(AWindow, sfVideo.Sprite, nil);
end;

function  sfVideo_getStatus(): sfVideoStatus;
begin
  Result := sfVideo.Status;
end;

function  sfVideo_isLooping(): Boolean;
begin
  Result := sfVideo.Loop;
end;

procedure sfVideo_setLooping(const ALoop: Boolean);
begin
  sfVideo.Loop := ALoop;
end;

function  sfVideo_getVolume(): Single;
begin
  Result := sfVideo.Volume;
end;

procedure sfVideo_setVolume(const AVolume: Single);
begin
  if not Assigned(sfVideo.AudioStream) then Exit;
  sfVideo.Volume := EnsureRange(AVolume, 0, 1);
  sfSoundStream_setVolume(sfVideo.AudioStream, PSFML.Common.UnitToScalarValue(sfVideo.Volume, 100));
end;

{$REGION ' UNIT INIT '}
initialization
begin
  ReportMemoryLeaksOnShutdown := True;
  redirect_cerr_to_callback(cerr_callback, nil);
  sfVideo := Default(TsfVideo);
end;

finalization
begin
  sfVideo_destroy();
  restore_cerr();
end;
{$ENDREGION}

end.
