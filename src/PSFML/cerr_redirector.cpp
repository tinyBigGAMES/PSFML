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

#include <iostream>
#include <streambuf>
#include <string>

extern "C" {
#include "cerr_redirector.h"
}


void* userData = nullptr;

class CallbackStreambuf : public std::streambuf {
public:
    CallbackStreambuf(cerr_callback callback) : callbackFunction(callback) {}

protected:
    virtual int sync() override {
        if (callbackFunction && !buffer.empty()) {
            callbackFunction(buffer.c_str(), userData);
            buffer.clear();
        }
        return 0;
    }

    virtual std::streamsize xsputn(const char_type* s, std::streamsize count) override {
        buffer.append(s, count);
        return count;
    }

    virtual int_type overflow(int_type c = traits_type::eof()) override {
        if (!traits_type::eq_int_type(c, traits_type::eof())) {
            char_type ch = traits_type::to_char_type(c);
            buffer += ch;
        }
        return c;
    }

private:
    std::string buffer;
    cerr_callback callbackFunction;
};

std::streambuf* originalCerrBuf = nullptr;
CallbackStreambuf* callbackStreambuf = nullptr;

void redirect_cerr_to_callback(cerr_callback callback, void* user_data) {
    if (!callbackStreambuf) {
        callbackStreambuf = new CallbackStreambuf(callback);
        originalCerrBuf = std::cerr.rdbuf(); 
        std::cerr.rdbuf(callbackStreambuf); 
        userData = user_data;
    }
}

void restore_cerr() {
    if (originalCerrBuf != nullptr) {
        std::cerr.rdbuf(originalCerrBuf); 
        delete callbackStreambuf;
        callbackStreambuf = nullptr;
        originalCerrBuf = nullptr;
    }
}
