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

procedure Pause();
begin
  WriteLn;
  Write('Press ENTER to continue...');
  ReadLn;
  WriteLn;
end;

procedure RunTests();
var
  LChoice: string;
begin
  while True do
  begin
    sfConsole_setTitle('PSFM - SFML for Pascal');
    sfConsole_print('%s', [sfEraseFullScreen]);
    sfConsole_print(sfSetCursorPos, [0, 0]);
    sfConsole_printLn('%s%sPSFML%s - SFML for Pascal', [sfStyleBold, sfForeMagenta, sfForeWhite]);
    sfConsole_printLn('', []);
    sfConsole_printLn('%s---==== M E N U ===---', [sfForeCyan]);
    sfConsole_printLn('', []);

    sfConsole_printLn('%s1 - ZipFile #01', [sfForeGreen]);
    sfConsole_printLn('%s2 - RenerWindow #01', [sfForeGreen]);
    sfConsole_printLn('%s3 - Video #01', [sfForeGreen]);
    sfConsole_printLn('%s4 - Video #02', [sfForeGreen]);

    sfConsole_printLn('%sq - Quit', [sfForeGreen]);
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
