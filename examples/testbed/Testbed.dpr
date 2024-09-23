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
  PSFML in '..\..\lib\PSFML.pas',
  PSFML.Ext in '..\..\lib\PSFML.Ext.pas',
  PSFML.Common in '..\..\lib\PSFML.Common.pas',
  UZipFile in 'UZipFile.pas',
  PSFML.MModule in '..\..\lib\PSFML.MModule.pas',
  UVideo in 'UVideo.pas';

begin
  try
    RunTests();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
