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

unit UZipFile;

interface

procedure Test01();

implementation

uses
  System.SysUtils,
  PSFML,
  PSFML.Ext,
  UCommon;

procedure Test01_ZipFileBuildProgress(const ASender: Pointer; const AFilename: string; const AProgress: Integer; const ANewFile: Boolean); cdecl;
begin
  if ANewFile then
    sfConsole_PrintLn('', []);

  sfConsole_print(sfCR+'%sAdding %s(%d%s)...', [sfCSIFGGreen, ExtractFileName(AFilename), AProgress, '%']);
end;

procedure Test01();
begin
  sfConsole_setTitle('PSFM: ZipFile #01');
  //sfConsole_print('%s', [sfEraseFullScreen]);
  //sfConsole_print(sfSetCursorPos, [0, 0]);
  sfConsole_clearScreen();

  sfConsole_printLn(sfCRLF+'%sCreating %s...', [sfCSIFGWhite, CZipFilename]);

  if sfZipFile_build(CZipFilename, 'res', sfZipFileDefaultPassword, nil, Test01_ZipFileBuildProgress) then
  begin
    sfConsole_printLn('', []);
    sfConsole_printLn('%sSuccess!', [sfCSIBlink + sfCSIFGCyan]);
  end
  else
  begin
    sfConsole_printLn('', []);
    sfConsole_printLn('%sFailed!', [sfCSIBold + sfCSIFGRed]);
  end;

  sfConsole_pause(True);
end;


end.
