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

#ifndef CERR_REDIRECTOR_H
#define CERR_REDIRECTOR_H

#ifdef __cplusplus
extern "C" {
#endif

typedef void (*cerr_callback)(const char* text, void* user_data);

__declspec(dllexport) void redirect_cerr_to_callback(cerr_callback callback, void* user_data);
__declspec(dllexport) void restore_cerr();

#ifdef __cplusplus
}
#endif

#endif // CERR_REDIRECTOR_H
