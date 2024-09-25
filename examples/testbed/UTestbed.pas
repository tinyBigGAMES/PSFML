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

unit UTestbed;

interface

procedure RunTests();

implementation

uses
  System.SysUtils,
  PSFML,
  PSFML.Ext,
  UZipFile,
  URenderWindow,
  UVideo;

procedure RunTests();
var
  LChoice: string;
begin

  while True do
  begin
    sfConsole_setTitle('PSFM - SFML for Pascal');
    sfConsole_clearScreen();
    sfConsole_printLn('%s%sPSFML%s - SFML for Pascal', [sfCSIBold, sfCSIFGMagenta, sfCSIFGWhite]);
    sfConsole_printLn('', []);
    sfConsole_printLn('%s---==== M E N U ===---', [sfCSIFGCyan]);
    sfConsole_printLn('', []);

    sfConsole_printLn('%s1 - ZipFile #01', [sfCSIFGGreen]);
    sfConsole_printLn('%s2 - RenerWindow #01', [sfCSIFGGreen]);
    sfConsole_printLn('%s3 - Video #01', [sfCSIFGGreen]);
    sfConsole_printLn('%s4 - Video #02', [sfCSIFGGreen]);

    sfConsole_printLn('%sq - Quit', [sfCSIFGGreen]);
    sfConsole_printLn('', []);
    sfConsole_print('Select: ', []);
    ReadLn(LChoice);
    LChoice := LChoice.ToLower();

    if LChoice = '1' then
      UZipFile.Test01()

    else if LChoice = '2' then
      URenderWindow.Test01()

    else if LChoice = '3' then
      UVideo.Test01()

    else if LChoice = '4' then
      UVideo.Test02()

    else if LChoice = 'q' then
      Break;
  end;

end;

end.
