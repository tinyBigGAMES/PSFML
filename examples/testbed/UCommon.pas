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

unit UCommon;

interface

uses
  PSFML,
  PSFML.Ext;

const
  CZipFilename = 'data.zip';

procedure ErrorCallback(const AText: string; const AUserData: Pointer); cdecl;

implementation

procedure ErrorCallback(const AText: string; const AUserData: Pointer);
begin
  sfConsole_printLn('%s%s', [sfCSIFGRed, AText]);
end;


initialization
begin
  sfError_setCallback(ErrorCallback, nil);
end;

finalization
begin

end;

end.
