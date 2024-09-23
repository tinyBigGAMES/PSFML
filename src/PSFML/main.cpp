/****************************************************************************
						 ___  ___  ___  __  __  _ ™
						| _ \/ __|| __||  \/  || |
						|  _/\__ \| _| | |\/| || |__
						|_|  |___/|_|  |_|  |_||____|
							  SFML for Pascal

				  Copyright © 2024-present tinyBigGAMES™ LLC
						   All Rights Reserved.

					https://github.com/tinyBigGAMES/PSFML
				   See LICENSE file for license information
****************************************************************************/


//   Important note about DLL memory management when your DLL uses the
//   static version of the RunTime Library:
//
//   If your DLL exports any functions that pass String objects (or structs/
//   classes containing nested Strings) as parameter or function results,
//   you will need to add the library MEMMGR.LIB to both the DLL project and
//   any other projects that use the DLL.  You will also need to use MEMMGR.LIB
//   if any other projects which use the DLL will be performing new or delete
//   operations on any non-TObject-derived classes which are exported from the
//   DLL. Adding MEMMGR.LIB to your project will change the DLL and its calling
//   EXE's to use the BORLNDMM.DLL as their memory manager.  In these cases,
//   the file BORLNDMM.DLL should be deployed along with your DLL.
//
//   To avoid using BORLNDMM.DLL, pass string information using "char *" or
//   ShortString parameters.
//
//   If your DLL uses the dynamic version of the RTL, you do not need to
//   explicitly add MEMMGR.LIB as this will be done implicitly for you.
//   If you are using the static version of the RTL, add #include<usebormm.h>
//   to one of the source files for your DLL

#include <vcl.h>
#include <windows.h>

#pragma hdrstop
#pragma argsused

int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void* lpReserved)
{
	return 1;
}

