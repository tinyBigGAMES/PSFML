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

program Testbed;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UTestbed in 'UTestbed.pas',
  URenderWindow in 'URenderWindow.pas',
  UCommon in 'UCommon.pas',
  UZipFile in 'UZipFile.pas',
  UVideo in 'UVideo.pas',
  UAudio in 'UAudio.pas',
  PSFML.Audio in '..\..\src\PSFML.Audio.pas',
  PSFML.Common in '..\..\src\PSFML.Common.pas',
  PSFML.Ext in '..\..\src\PSFML.Ext.pas',
  PSFML.Math in '..\..\src\PSFML.Math.pas',
  PSFML in '..\..\src\PSFML.pas';

begin
  try
    RunTests();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
