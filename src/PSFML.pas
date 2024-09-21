{==============================================================================
 ___  ___  ___  __  __  _ ™
| _ \/ __|| __||  \/  || |
|  _/\__ \| _| | |\/| || |__
|_|  |___/|_|  |_|  |_||____|
       SFML for Pascal

Copyright © 2024-present tinyBigGAMES™ LLC
All Rights Reserved.

Website: https://tinybiggames.com
Email  : support@tinybiggames.com
License: BSD 3-Clause

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.

This product uses the following open-source libraries:

* CSFML   - https://github.com/SFML/CSFML
* minizip - https://github.com/madler/zlib/contrib/minizip
* pl_mpeg - https://github.com/phoboslab/pl_mpeg
==============================================================================}

unit PSFML;

{$IFDEF FPC}
  {$MODE DELPHIUNICODE}
{$ENDIF}

interface

const
  PSFML_VERSION_MAJOR = 3;
  PSFML_VERSION_MINOR = 0;
  PSFML_VERSION_PATCH = 0;

  sfStopped = 0;
  sfPaused = 1;
  sfPlaying = 2;

  sfSoundChannelUnspecified = 0;
  sfSoundChannelMono = 1;
  sfSoundChannelFrontLeft = 2;
  sfSoundChannelFrontRight = 3;
  sfSoundChannelFrontCenter = 4;
  sfSoundChannelFrontLeftOfCenter = 5;
  sfSoundChannelFrontRightOfCenter = 6;
  sfSoundChannelLowFrequencyEffects = 7;
  sfSoundChannelBackLeft = 8;
  sfSoundChannelBackRight = 9;
  sfSoundChannelBackCenter = 10;
  sfSoundChannelSideLeft = 11;
  sfSoundChannelSideRight = 12;
  sfSoundChannelTopCenter = 13;
  sfSoundChannelTopFrontLeft = 14;
  sfSoundChannelTopFrontRight = 15;
  sfSoundChannelTopFrontCenter = 16;
  sfSoundChannelTopBackLeft = 17;
  sfSoundChannelTopBackRight = 18;
  sfSoundChannelTopBackCenter = 19;

  sfBlendFactorZero = 0;
  sfBlendFactorOne = 1;
  sfBlendFactorSrcColor = 2;
  sfBlendFactorOneMinusSrcColor = 3;
  sfBlendFactorDstColor = 4;
  sfBlendFactorOneMinusDstColor = 5;
  sfBlendFactorSrcAlpha = 6;
  sfBlendFactorOneMinusSrcAlpha = 7;
  sfBlendFactorDstAlpha = 8;
  sfBlendFactorOneMinusDstAlpha = 9;

  sfBlendEquationAdd = 0;
  sfBlendEquationSubtract = 1;
  sfBlendEquationReverseSubtract = 2;
  sfBlendEquationMin = 3;
  sfBlendEquationMax = 4;

  sfPoints = 0;
  sfLines = 1;
  sfLineStrip = 2;
  sfTriangles = 3;
  sfTriangleStrip = 4;
  sfTriangleFan = 5;

  sfJoystickCount = 8;
  sfJoystickButtonCount = 32;
  sfJoystickAxisCount = 8;

  sfJoystickX = 0;
  sfJoystickY = 1;
  sfJoystickZ = 2;
  sfJoystickR = 3;
  sfJoystickU = 4;
  sfJoystickV = 5;
  sfJoystickPovX = 6;
  sfJoystickPovY = 7;

  sfKeyUnknown = -1;
  sfKeyA = 0;
  sfKeyB = 1;
  sfKeyC = 2;
  sfKeyD = 3;
  sfKeyE = 4;
  sfKeyF = 5;
  sfKeyG = 6;
  sfKeyH = 7;
  sfKeyI = 8;
  sfKeyJ = 9;
  sfKeyK = 10;
  sfKeyL = 11;
  sfKeyM = 12;
  sfKeyN = 13;
  sfKeyO = 14;
  sfKeyP = 15;
  sfKeyQ = 16;
  sfKeyR = 17;
  sfKeyS = 18;
  sfKeyT = 19;
  sfKeyU = 20;
  sfKeyV = 21;
  sfKeyW = 22;
  sfKeyX = 23;
  sfKeyY = 24;
  sfKeyZ = 25;
  sfKeyNum0 = 26;
  sfKeyNum1 = 27;
  sfKeyNum2 = 28;
  sfKeyNum3 = 29;
  sfKeyNum4 = 30;
  sfKeyNum5 = 31;
  sfKeyNum6 = 32;
  sfKeyNum7 = 33;
  sfKeyNum8 = 34;
  sfKeyNum9 = 35;
  sfKeyEscape = 36;
  sfKeyLControl = 37;
  sfKeyLShift = 38;
  sfKeyLAlt = 39;
  sfKeyLSystem = 40;
  sfKeyRControl = 41;
  sfKeyRShift = 42;
  sfKeyRAlt = 43;
  sfKeyRSystem = 44;
  sfKeyMenu = 45;
  sfKeyLBracket = 46;
  sfKeyRBracket = 47;
  sfKeySemicolon = 48;
  sfKeyComma = 49;
  sfKeyPeriod = 50;
  sfKeyApostrophe = 51;
  sfKeySlash = 52;
  sfKeyBackslash = 53;
  sfKeyGrave = 54;
  sfKeyEqual = 55;
  sfKeyHyphen = 56;
  sfKeySpace = 57;
  sfKeyEnter = 58;
  sfKeyBackspace = 59;
  sfKeyTab = 60;
  sfKeyPageUp = 61;
  sfKeyPageDown = 62;
  sfKeyEnd = 63;
  sfKeyHome = 64;
  sfKeyInsert = 65;
  sfKeyDelete = 66;
  sfKeyAdd = 67;
  sfKeySubtract = 68;
  sfKeyMultiply = 69;
  sfKeyDivide = 70;
  sfKeyLeft = 71;
  sfKeyRight = 72;
  sfKeyUp = 73;
  sfKeyDown = 74;
  sfKeyNumpad0 = 75;
  sfKeyNumpad1 = 76;
  sfKeyNumpad2 = 77;
  sfKeyNumpad3 = 78;
  sfKeyNumpad4 = 79;
  sfKeyNumpad5 = 80;
  sfKeyNumpad6 = 81;
  sfKeyNumpad7 = 82;
  sfKeyNumpad8 = 83;
  sfKeyNumpad9 = 84;
  sfKeyF1 = 85;
  sfKeyF2 = 86;
  sfKeyF3 = 87;
  sfKeyF4 = 88;
  sfKeyF5 = 89;
  sfKeyF6 = 90;
  sfKeyF7 = 91;
  sfKeyF8 = 92;
  sfKeyF9 = 93;
  sfKeyF10 = 94;
  sfKeyF11 = 95;
  sfKeyF12 = 96;
  sfKeyF13 = 97;
  sfKeyF14 = 98;
  sfKeyF15 = 99;
  sfKeyPause = 100;
  sfKeyCount = 101;

  sfScanUnknown = -1;
  sfScanA = 0;
  sfScanB = 1;
  sfScanC = 2;
  sfScanD = 3;
  sfScanE = 4;
  sfScanF = 5;
  sfScanG = 6;
  sfScanH = 7;
  sfScanI = 8;
  sfScanJ = 9;
  sfScanK = 10;
  sfScanL = 11;
  sfScanM = 12;
  sfScanN = 13;
  sfScanO = 14;
  sfScanP = 15;
  sfScanQ = 16;
  sfScanR = 17;
  sfScanS = 18;
  sfScanT = 19;
  sfScanU = 20;
  sfScanV = 21;
  sfScanW = 22;
  sfScanX = 23;
  sfScanY = 24;
  sfScanZ = 25;
  sfScanNum1 = 26;
  sfScanNum2 = 27;
  sfScanNum3 = 28;
  sfScanNum4 = 29;
  sfScanNum5 = 30;
  sfScanNum6 = 31;
  sfScanNum7 = 32;
  sfScanNum8 = 33;
  sfScanNum9 = 34;
  sfScanNum0 = 35;
  sfScanEnter = 36;
  sfScanEscape = 37;
  sfScanBackspace = 38;
  sfScanTab = 39;
  sfScanSpace = 40;
  sfScanHyphen = 41;
  sfScanEqual = 42;
  sfScanLBracket = 43;
  sfScanRBracket = 44;
  sfScanBackslash = 45;
  sfScanSemicolon = 46;
  sfScanApostrophe = 47;
  sfScanGrave = 48;
  sfScanComma = 49;
  sfScanPeriod = 50;
  sfScanSlash = 51;
  sfScanF1 = 52;
  sfScanF2 = 53;
  sfScanF3 = 54;
  sfScanF4 = 55;
  sfScanF5 = 56;
  sfScanF6 = 57;
  sfScanF7 = 58;
  sfScanF8 = 59;
  sfScanF9 = 60;
  sfScanF10 = 61;
  sfScanF11 = 62;
  sfScanF12 = 63;
  sfScanF13 = 64;
  sfScanF14 = 65;
  sfScanF15 = 66;
  sfScanF16 = 67;
  sfScanF17 = 68;
  sfScanF18 = 69;
  sfScanF19 = 70;
  sfScanF20 = 71;
  sfScanF21 = 72;
  sfScanF22 = 73;
  sfScanF23 = 74;
  sfScanF24 = 75;
  sfScanCapsLock = 76;
  sfScanPrintScreen = 77;
  sfScanScrollLock = 78;
  sfScanPause = 79;
  sfScanInsert = 80;
  sfScanHome = 81;
  sfScanPageUp = 82;
  sfScanDelete = 83;
  sfScanEnd = 84;
  sfScanPageDown = 85;
  sfScanRight = 86;
  sfScanLeft = 87;
  sfScanDown = 88;
  sfScanUp = 89;
  sfScanNumLock = 90;
  sfScanNumpadDivide = 91;
  sfScanNumpadMultiply = 92;
  sfScanNumpadMinus = 93;
  sfScanNumpadPlus = 94;
  sfScanNumpadEqual = 95;
  sfScanNumpadEnter = 96;
  sfScanNumpadDecimal = 97;
  sfScanNumpad1 = 98;
  sfScanNumpad2 = 99;
  sfScanNumpad3 = 100;
  sfScanNumpad4 = 101;
  sfScanNumpad5 = 102;
  sfScanNumpad6 = 103;
  sfScanNumpad7 = 104;
  sfScanNumpad8 = 105;
  sfScanNumpad9 = 106;
  sfScanNumpad0 = 107;
  sfScanNonUsBackslash = 108;
  sfScanApplication = 109;
  sfScanExecute = 110;
  sfScanModeChange = 111;
  sfScanHelp = 112;
  sfScanMenu = 113;
  sfScanSelect = 114;
  sfScanRedo = 115;
  sfScanUndo = 116;
  sfScanCut = 117;
  sfScanCopy = 118;
  sfScanPaste = 119;
  sfScanVolumeMute = 120;
  sfScanVolumeUp = 121;
  sfScanVolumeDown = 122;
  sfScanMediaPlayPause = 123;
  sfScanMediaStop = 124;
  sfScanMediaNextTrack = 125;
  sfScanMediaPreviousTrack = 126;
  sfScanLControl = 127;
  sfScanLShift = 128;
  sfScanLAlt = 129;
  sfScanLSystem = 130;
  sfScanRControl = 131;
  sfScanRShift = 132;
  sfScanRAlt = 133;
  sfScanRSystem = 134;
  sfScanBack = 135;
  sfScanForward = 136;
  sfScanRefresh = 137;
  sfScanStop = 138;
  sfScanSearch = 139;
  sfScanFavorites = 140;
  sfScanHomePage = 141;
  sfScanLaunchApplication1 = 142;
  sfScanLaunchApplication2 = 143;
  sfScanLaunchMail = 144;
  sfScanLaunchMediaSelect = 145;
  sfScancodeCount = 146;

  sfMouseLeft = 0;
  sfMouseRight = 1;
  sfMouseMiddle = 2;
  sfMouseXButton1 = 3;
  sfMouseXButton2 = 4;
  sfMouseButtonCount = 5;

  sfMouseVerticalWheel = 0;
  sfMouseHorizontalWheel = 1;

  sfSensorAccelerometer = 0;
  sfSensorGyroscope = 1;
  sfSensorMagnetometer = 2;
  sfSensorGravity = 3;
  sfSensorUserAcceleration = 4;
  sfSensorOrientation = 5;
  sfSensorCount = 6;

  sfEvtClosed = 0;
  sfEvtResized = 1;
  sfEvtFocusLost = 2;
  sfEvtFocusGained = 3;
  sfEvtTextEntered = 4;
  sfEvtKeyPressed = 5;
  sfEvtKeyReleased = 6;
  sfEvtMouseWheelScrolled = 7;
  sfEvtMouseButtonPressed = 8;
  sfEvtMouseButtonReleased = 9;
  sfEvtMouseMoved = 10;
  sfEvtMouseEntered = 11;
  sfEvtMouseLeft = 12;
  sfEvtJoystickButtonPressed = 13;
  sfEvtJoystickButtonReleased = 14;
  sfEvtJoystickMoved = 15;
  sfEvtJoystickConnected = 16;
  sfEvtJoystickDisconnected = 17;
  sfEvtTouchBegan = 18;
  sfEvtTouchMoved = 19;
  sfEvtTouchEnded = 20;
  sfEvtSensorChanged = 21;
  sfEvtCount = 22;

  sfNone = 0;
  sfTitlebar = 1;
  sfResize = 2;
  sfClose = 4;
  sfDefaultStyle = 7;

  sfWindowed = 0;
  sfFullscreen = 1;

  sfContextDefault = 0;
  sfContextCore = 1;
  sfContextDebug = 4;

  sfTextRegular = 0;
  sfTextBold = 1;
  sfTextItalic = 2;
  sfTextUnderlined = 4;
  sfTextStrikeThrough = 8;

  sfTextureNormalized = 0;
  sfTexturePixels = 1;

  sfVertexBufferStream = 0;
  sfVertexBufferDynamic = 1;
  sfVertexBufferStatic = 2;

  sfCursorArrow = 0;
  sfCursorArrowWait = 1;
  sfCursorWait = 2;
  sfCursorText = 3;
  sfCursorHand = 4;
  sfCursorSizeHorizontal = 5;
  sfCursorSizeVertical = 6;
  sfCursorSizeTopLeftBottomRight = 7;
  sfCursorSizeBottomLeftTopRight = 8;
  sfCursorSizeLeft = 9;
  sfCursorSizeRight = 10;
  sfCursorSizeTop = 11;
  sfCursorSizeBottom = 12;
  sfCursorSizeTopLeft = 13;
  sfCursorSizeBottomRight = 14;
  sfCursorSizeBottomLeft = 15;
  sfCursorSizeTopRight = 16;
  sfCursorSizeAll = 17;
  sfCursorCross = 18;
  sfCursorHelp = 19;
  sfCursorNotAllowed = 20;

  sfFtpBinary = 0;
  sfFtpAscii = 1;
  sfFtpEbcdic = 2;

  sfFtpRestartMarkerReply = 110;
  sfFtpServiceReadySoon = 120;
  sfFtpDataConnectionAlreadyOpened = 125;
  sfFtpOpeningDataConnection = 150;
  sfFtpOk = 200;
  sfFtpPointlessCommand = 202;
  sfFtpSystemStatus = 211;
  sfFtpDirectoryStatus = 212;
  sfFtpFileStatus = 213;
  sfFtpHelpMessage = 214;
  sfFtpSystemType = 215;
  sfFtpServiceReady = 220;
  sfFtpClosingConnection = 221;
  sfFtpDataConnectionOpened = 225;
  sfFtpClosingDataConnection = 226;
  sfFtpEnteringPassiveMode = 227;
  sfFtpLoggedIn = 230;
  sfFtpFileActionOk = 250;
  sfFtpDirectoryOk = 257;
  sfFtpNeedPassword = 331;
  sfFtpNeedAccountToLogIn = 332;
  sfFtpNeedInformation = 350;
  sfFtpServiceUnavailable = 421;
  sfFtpDataConnectionUnavailable = 425;
  sfFtpTransferAborted = 426;
  sfFtpFileActionAborted = 450;
  sfFtpLocalError = 451;
  sfFtpInsufficientStorageSpace = 452;
  sfFtpCommandUnknown = 500;
  sfFtpParametersUnknown = 501;
  sfFtpCommandNotImplemented = 502;
  sfFtpBadCommandSequence = 503;
  sfFtpParameterNotImplemented = 504;
  sfFtpNotLoggedIn = 530;
  sfFtpNeedAccountToStore = 532;
  sfFtpFileUnavailable = 550;
  sfFtpPageTypeUnknown = 551;
  sfFtpNotEnoughMemory = 552;
  sfFtpFilenameNotAllowed = 553;
  sfFtpInvalidResponse = 1000;
  sfFtpConnectionFailed = 1001;
  sfFtpConnectionClosed = 1002;
  sfFtpInvalidFile = 1003;

  sfHttpGet = 0;
  sfHttpPost = 1;
  sfHttpHead = 2;
  sfHttpPut = 3;
  sfHttpDelete = 4;

  sfHttpOk = 200;
  sfHttpCreated = 201;
  sfHttpAccepted = 202;
  sfHttpNoContent = 204;
  sfHttpResetContent = 205;
  sfHttpPartialContent = 206;
  sfHttpMultipleChoices = 300;
  sfHttpMovedPermanently = 301;
  sfHttpMovedTemporarily = 302;
  sfHttpNotModified = 304;
  sfHttpBadRequest = 400;
  sfHttpUnauthorized = 401;
  sfHttpForbidden = 403;
  sfHttpNotFound = 404;
  sfHttpRangeNotSatisfiable = 407;
  sfHttpInternalServerError = 500;
  sfHttpNotImplemented = 501;
  sfHttpBadGateway = 502;
  sfHttpServiceNotAvailable = 503;
  sfHttpGatewayTimeout = 504;
  sfHttpVersionNotSupported = 505;
  sfHttpInvalidResponse = 1000;
  sfHttpConnectionFailed = 1001;

  sfSocketDone = 0;
  sfSocketNotReady = 1;
  sfSocketPartial = 2;
  sfSocketDisconnected = 3;
  sfSocketError = 4;

type
  sfSoundStatus = Integer;
  PsfSoundStatus = ^sfSoundStatus;

  sfSoundChannel = Integer;
  PsfSoundChannel = ^sfSoundChannel;

  sfBlendFactor = Integer;
  PsfBlendFactor = ^sfBlendFactor;

  sfBlendEquation = Integer;
  PsfBlendEquation = ^sfBlendEquation;

  sfPrimitiveType = Integer;
  PsfPrimitiveType = ^sfPrimitiveType;

  sfJoystickAxis = Integer;
  PsfJoystickAxis = ^sfJoystickAxis;

  sfKeyCode = Integer;
  PsfKeyCode = ^sfKeyCode;

  sfScancode = Integer;
  PsfScancode = ^sfScancode;

  sfMouseButton = Integer;
  PsfMouseButton = ^sfMouseButton;

  sfMouseWheel = Integer;
  PsfMouseWheel = ^sfMouseWheel;

  sfSensorType = Integer;
  PsfSensorType = ^sfSensorType;

  sfEventType = Integer;
  PsfEventType = ^sfEventType;

  sfWindowStyle = Integer;
  PsfWindowStyle = ^sfWindowStyle;

  sfWindowState = Integer;
  PsfWindowState = ^sfWindowState;

  sfContextAttribute = Integer;
  PsfContextAttribute = ^sfContextAttribute;

  sfTextStyle = Integer;
  PsfTextStyle = ^sfTextStyle;

  sfTextureCoordinateType = Integer;
  PsfTextureCoordinateType = ^sfTextureCoordinateType;

  sfVertexBufferUsage = Integer;
  PsfVertexBufferUsage = ^sfVertexBufferUsage;

  sfCursorType = Integer;
  PsfCursorType = ^sfCursorType;

  sfFtpTransferMode = Integer;
  PsfFtpTransferMode = ^sfFtpTransferMode;

  sfFtpStatus = Integer;
  PsfFtpStatus = ^sfFtpStatus;

  sfHttpMethod = Integer;
  PsfHttpMethod = ^sfHttpMethod;

  sfHttpStatus = Integer;
  PsfHttpStatus = ^sfHttpStatus;

  sfSocketStatus = Integer;
  PsfSocketStatus = ^sfSocketStatus;

type
  PPUTF8Char = ^PUTF8Char;
  PInt16 = ^Int16;
  PNativeUInt = ^NativeUInt;
  PUInt8 = ^UInt8;
  PWideChar = ^WideChar;
  PPointer = ^Pointer;
  PVkInstance_T = Pointer;
  PPVkInstance_T = ^PVkInstance_T;
  PVkSurfaceKHR_T = Pointer;
  PPVkSurfaceKHR_T = ^PVkSurfaceKHR_T;
  PHWND__ = Pointer;
  PPHWND__ = ^PHWND__;
  PsfVector3f = ^sfVector3f;
  PsfInputStream = ^sfInputStream;
  PsfTime = ^sfTime;
  PsfTimeSpan = ^sfTimeSpan;
  PsfSoundStreamChunk = ^sfSoundStreamChunk;
  PsfVector2i = ^sfVector2i;
  PsfVector2u = ^sfVector2u;
  PsfVector2f = ^sfVector2f;
  PsfBlendMode = ^sfBlendMode;
  PsfColor = ^sfColor;
  PsfFloatRect = ^sfFloatRect;
  PsfIntRect = ^sfIntRect;
  PsfTransform = ^sfTransform;
  PsfFontInfo = ^sfFontInfo;
  PsfGlyph = ^sfGlyph;
  PsfRenderStates = ^sfRenderStates;
  PsfVertex = ^sfVertex;
  PsfJoystickIdentification = ^sfJoystickIdentification;
  PsfKeyEvent = ^sfKeyEvent;
  PsfTextEvent = ^sfTextEvent;
  PsfMouseMoveEvent = ^sfMouseMoveEvent;
  PsfMouseButtonEvent = ^sfMouseButtonEvent;
  PsfMouseWheelScrollEvent = ^sfMouseWheelScrollEvent;
  PsfJoystickMoveEvent = ^sfJoystickMoveEvent;
  PsfJoystickButtonEvent = ^sfJoystickButtonEvent;
  PsfJoystickConnectEvent = ^sfJoystickConnectEvent;
  PsfSizeEvent = ^sfSizeEvent;
  PsfTouchEvent = ^sfTouchEvent;
  PsfSensorEvent = ^sfSensorEvent;
  PsfVideoMode = ^sfVideoMode;
  PsfContextSettings = ^sfContextSettings;
  PsfGlslBvec2 = ^sfGlslBvec2;
  PsfGlslIvec3 = ^sfGlslIvec3;
  PsfGlslBvec3 = ^sfGlslBvec3;
  PsfGlslVec4 = ^sfGlslVec4;
  PsfGlslIvec4 = ^sfGlslIvec4;
  PsfGlslBvec4 = ^sfGlslBvec4;
  PsfGlslMat3 = ^sfGlslMat3;
  PsfGlslMat4 = ^sfGlslMat4;
  PsfIpAddress = ^sfIpAddress;

  sfChar32 = UInt32;
  PsfChar32 = ^sfChar32;

  sfVector3f = record
    x: Single;
    y: Single;
    z: Single;
  end;

  PsfMusic = Pointer;
  PPsfMusic = ^PsfMusic;
  PsfSound = Pointer;
  PPsfSound = ^PsfSound;
  PsfSoundBuffer = Pointer;
  PPsfSoundBuffer = ^PsfSoundBuffer;
  PsfSoundBufferRecorder = Pointer;
  PPsfSoundBufferRecorder = ^PsfSoundBufferRecorder;
  PsfSoundRecorder = Pointer;
  PPsfSoundRecorder = ^PsfSoundRecorder;
  PsfSoundStream = Pointer;
  PPsfSoundStream = ^PsfSoundStream;

  sfInputStreamReadFunc = function(data: Pointer; size: NativeUInt; userData: Pointer): Int64; cdecl;
  sfInputStreamSeekFunc = function(position: NativeUInt; userData: Pointer): Int64; cdecl;
  sfInputStreamTellFunc = function(userData: Pointer): Int64; cdecl;
  sfInputStreamGetSizeFunc = function(userData: Pointer): Int64; cdecl;

  sfInputStream = record
    read: sfInputStreamReadFunc;
    seek: sfInputStreamSeekFunc;
    tell: sfInputStreamTellFunc;
    getSize: sfInputStreamGetSizeFunc;
    userData: Pointer;
  end;

  sfTime = record
    microseconds: Int64;
  end;

  sfTimeSpan = record
    offset: sfTime;
    length: sfTime;
  end;

  sfSoundRecorderStartCallback = function(p1: Pointer): Boolean; cdecl;
  sfSoundRecorderProcessCallback = function(const p1: PInt16; p2: NativeUInt; p3: Pointer): Boolean; cdecl;
  sfSoundRecorderStopCallback = procedure(p1: Pointer); cdecl;

  sfSoundStreamChunk = record
    samples: PInt16;
    sampleCount: Cardinal;
  end;

  sfSoundStreamGetDataCallback = function(p1: PsfSoundStreamChunk; p2: Pointer): Boolean; cdecl;
  sfSoundStreamSeekCallback = procedure(p1: sfTime; p2: Pointer); cdecl;

  PsfBuffer = Pointer;
  PPsfBuffer = ^PsfBuffer;
  PsfClock = Pointer;
  PPsfClock = ^PsfClock;

  sfVector2i = record
    x: Integer;
    y: Integer;
  end;

  sfVector2u = record
    x: Cardinal;
    y: Cardinal;
  end;

  sfVector2f = record
    x: Single;
    y: Single;
  end;

  sfBlendMode = record
    colorSrcFactor: sfBlendFactor;
    colorDstFactor: sfBlendFactor;
    colorEquation: sfBlendEquation;
    alphaSrcFactor: sfBlendFactor;
    alphaDstFactor: sfBlendFactor;
    alphaEquation: sfBlendEquation;
  end;

  sfColor = record
    r: UInt8;
    g: UInt8;
    b: UInt8;
    a: UInt8;
  end;

  sfFloatRect = record
    position: sfVector2f;
    size: sfVector2f;
  end;

  sfIntRect = record
    position: sfVector2i;
    size: sfVector2i;
  end;

  PsfCircleShape = Pointer;
  PPsfCircleShape = ^PsfCircleShape;
  PsfConvexShape = Pointer;
  PPsfConvexShape = ^PsfConvexShape;
  PsfFont = Pointer;
  PPsfFont = ^PsfFont;
  PsfImage = Pointer;
  PPsfImage = ^PsfImage;
  PsfShader = Pointer;
  PPsfShader = ^PsfShader;
  PsfRectangleShape = Pointer;
  PPsfRectangleShape = ^PsfRectangleShape;
  PsfRenderTexture = Pointer;
  PPsfRenderTexture = ^PsfRenderTexture;
  PsfRenderWindow = Pointer;
  PPsfRenderWindow = ^PsfRenderWindow;
  PsfShape = Pointer;
  PPsfShape = ^PsfShape;
  PsfSprite = Pointer;
  PPsfSprite = ^PsfSprite;
  PsfText = Pointer;
  PPsfText = ^PsfText;
  PsfTexture = Pointer;
  PPsfTexture = ^PsfTexture;
  PsfTransformable = Pointer;
  PPsfTransformable = ^PsfTransformable;
  PsfVertexArray = Pointer;
  PPsfVertexArray = ^PsfVertexArray;
  PsfVertexBuffer = Pointer;
  PPsfVertexBuffer = ^PsfVertexBuffer;
  PsfView = Pointer;
  PPsfView = ^PsfView;

  sfTransform = record
    matrix: array [0..8] of Single;
  end;

  sfFontInfo = record
    family: PUTF8Char;
  end;

  sfGlyph = record
    advance: Single;
    bounds: sfFloatRect;
    textureRect: sfIntRect;
  end;

  sfRenderStates = record
    blendMode: sfBlendMode;
    transform: sfTransform;
    texture: PsfTexture;
    shader: PsfShader;
  end;

  sfVertex = record
    position: sfVector2f;
    color: sfColor;
    texCoords: sfVector2f;
  end;

  sfJoystickIdentification = record
    name: PUTF8Char;
    vendorId: Cardinal;
    productId: Cardinal;
  end;

  PsfContext = Pointer;
  PPsfContext = ^PsfContext;
  PsfCursor = Pointer;
  PPsfCursor = ^PsfCursor;
  PsfWindow = Pointer;
  PPsfWindow = ^PsfWindow;
  PsfWindowBase = Pointer;
  PPsfWindowBase = ^PsfWindowBase;

  sfKeyEvent = record
    &type: sfEventType;
    code: sfKeyCode;
    scancode: sfScancode;
    alt: Boolean;
    control: Boolean;
    shift: Boolean;
    system: Boolean;
  end;

  sfTextEvent = record
    &type: sfEventType;
    unicode: UInt32;
  end;

  sfMouseMoveEvent = record
    &type: sfEventType;
    x: Integer;
    y: Integer;
  end;

  sfMouseButtonEvent = record
    &type: sfEventType;
    button: sfMouseButton;
    x: Integer;
    y: Integer;
  end;

  sfMouseWheelScrollEvent = record
    &type: sfEventType;
    wheel: sfMouseWheel;
    delta: Single;
    x: Integer;
    y: Integer;
  end;

  sfJoystickMoveEvent = record
    &type: sfEventType;
    joystickId: Cardinal;
    axis: sfJoystickAxis;
    position: Single;
  end;

  sfJoystickButtonEvent = record
    &type: sfEventType;
    joystickId: Cardinal;
    button: Cardinal;
  end;

  sfJoystickConnectEvent = record
    &type: sfEventType;
    joystickId: Cardinal;
  end;

  sfSizeEvent = record
    &type: sfEventType;
    width: Cardinal;
    height: Cardinal;
  end;

  sfTouchEvent = record
    &type: sfEventType;
    finger: Cardinal;
    x: Integer;
    y: Integer;
  end;

  sfSensorEvent = record
    &type: sfEventType;
    sensorType: sfSensorType;
    x: Single;
    y: Single;
    z: Single;
  end;

  PsfEvent = ^sfEvent;
  sfEvent = record
    case Integer of
      0: (&type: sfEventType);
      1: (size: sfSizeEvent);
      2: (key: sfKeyEvent);
      3: (text: sfTextEvent);
      4: (mouseMove: sfMouseMoveEvent);
      5: (mouseButton: sfMouseButtonEvent);
      6: (mouseWheelScroll: sfMouseWheelScrollEvent);
      7: (joystickMove: sfJoystickMoveEvent);
      8: (joystickButton: sfJoystickButtonEvent);
      9: (joystickConnect: sfJoystickConnectEvent);
      10: (touch: sfTouchEvent);
      11: (sensor: sfSensorEvent);
  end;

  sfVideoMode = record
    size: sfVector2u;
    bitsPerPixel: Cardinal;
  end;

  VkInstance = Pointer;
  PVkInstance = ^VkInstance;
  VkSurfaceKHR = Pointer;
  PVkSurfaceKHR = ^VkSurfaceKHR;
  PVkAllocationCallbacks = Pointer;
  PPVkAllocationCallbacks = ^PVkAllocationCallbacks;

  sfVulkanFunctionPointer = procedure(); cdecl;
  sfWindowHandle = Pointer;
  PsfWindowHandle = ^sfWindowHandle;

  sfContextSettings = record
    depthBits: Cardinal;
    stencilBits: Cardinal;
    antiAliasingLevel: Cardinal;
    majorVersion: Cardinal;
    minorVersion: Cardinal;
    attributeFlags: UInt32;
    sRgbCapable: Boolean;
  end;

  sfGlslVec2 = sfVector2f;
  PsfGlslVec2 = ^sfGlslVec2;
  sfGlslIvec2 = sfVector2i;

  sfGlslBvec2 = record
    x: Boolean;
    y: Boolean;
  end;

  sfGlslVec3 = sfVector3f;
  PsfGlslVec3 = ^sfGlslVec3;

  sfGlslIvec3 = record
    x: Integer;
    y: Integer;
    z: Integer;
  end;

  sfGlslBvec3 = record
    x: Boolean;
    y: Boolean;
    z: Boolean;
  end;

  sfGlslVec4 = record
    x: Single;
    y: Single;
    z: Single;
    w: Single;
  end;

  sfGlslIvec4 = record
    x: Integer;
    y: Integer;
    z: Integer;
    w: Integer;
  end;

  sfGlslBvec4 = record
    x: Boolean;
    y: Boolean;
    z: Boolean;
    w: Boolean;
  end;

  sfGlslMat3 = record
    &array: array [0..8] of Single;
  end;

  sfGlslMat4 = record
    &array: array [0..15] of Single;
  end;

  sfShapeGetPointCountCallback = function(p1: Pointer): NativeUInt; cdecl;
  sfShapeGetPointCallback = function(p1: NativeUInt; p2: Pointer): sfVector2f; cdecl;
  sfGlFunctionPointer = procedure(); cdecl;

  sfIpAddress = record
    address: array [0..15] of UTF8Char;
  end;

  PsfFtpDirectoryResponse = Pointer;
  PPsfFtpDirectoryResponse = ^PsfFtpDirectoryResponse;
  PsfFtpListingResponse = Pointer;
  PPsfFtpListingResponse = ^PsfFtpListingResponse;
  PsfFtpResponse = Pointer;
  PPsfFtpResponse = ^PsfFtpResponse;
  PsfFtp = Pointer;
  PPsfFtp = ^PsfFtp;
  PsfHttpRequest = Pointer;
  PPsfHttpRequest = ^PsfHttpRequest;
  PsfHttpResponse = Pointer;
  PPsfHttpResponse = ^PsfHttpResponse;
  PsfHttp = Pointer;
  PPsfHttp = ^PsfHttp;
  PsfPacket = Pointer;
  PPsfPacket = ^PsfPacket;
  PsfSocketSelector = Pointer;
  PPsfSocketSelector = ^PsfSocketSelector;
  PsfTcpListener = Pointer;
  PPsfTcpListener = ^PsfTcpListener;
  PsfTcpSocket = Pointer;
  PPsfTcpSocket = ^PsfTcpSocket;
  PsfUdpSocket = Pointer;
  PPsfUdpSocket = ^PsfUdpSocket;

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
  DARKSLATEBROWN      : sfColor = (r:30;  g:31;  b:30;  a:1);
  RAYWHITE            : sfColor = (r:245; g:245; b:245; a:255);
  TRANSPARENT         : sfColor = (r:255; g:255; b:255; a:0);
{$ENDREGION}

//=== MUSIC =================================================================
var
  sfListener_SetGlobalVolume: procedure(volume: Single); cdecl;
  sfListener_GetGlobalVolume: function(): Single; cdecl;
  sfListener_SetPosition: procedure(position: sfVector3f); cdecl;
  sfListener_GetPosition: function(): sfVector3f; cdecl;
  sfListener_SetDirection: procedure(direction: sfVector3f); cdecl;
  sfListener_GetDirection: function(): sfVector3f; cdecl;
  sfListener_SetUpVector: procedure(upVector: sfVector3f); cdecl;
  sfListener_GetUpVector: function(): sfVector3f; cdecl;
  sfTime_AsSeconds: function(time: sfTime): Single; cdecl;
  sfTime_AsMilliseconds: function(time: sfTime): Int32; cdecl;
  sfTime_AsMicroseconds: function(time: sfTime): Int64; cdecl;
  sfSeconds: function(amount: Single): sfTime; cdecl;
  sfMilliseconds: function(amount: Int32): sfTime; cdecl;
  sfMicroseconds: function(amount: Int64): sfTime; cdecl;
  sfMusic_CreateFromFile: function(const filename: PUTF8Char): PsfMusic; cdecl;
  sfMusic_CreateFromMemory: function(const data: Pointer; sizeInBytes: NativeUInt): PsfMusic; cdecl;
  sfMusic_CreateFromStream: function(stream: PsfInputStream): PsfMusic; cdecl;
  sfMusic_Destroy: procedure(const music: PsfMusic); cdecl;
  sfMusic_SetLooping: procedure(music: PsfMusic; loop: Boolean); cdecl;
  sfMusic_IsLooping: function(const music: PsfMusic): Boolean; cdecl;
  sfMusic_GetDuration: function(const music: PsfMusic): sfTime; cdecl;
  sfMusic_GetLoopPoints: function(const music: PsfMusic): sfTimeSpan; cdecl;
  sfMusic_SetLoopPoints: procedure(music: PsfMusic; timePoints: sfTimeSpan); cdecl;
  sfMusic_Play: procedure(music: PsfMusic); cdecl;
  sfMusic_Pause: procedure(music: PsfMusic); cdecl;
  sfMusic_Stop: procedure(music: PsfMusic); cdecl;
  sfMusic_GetChannelCount: function(const music: PsfMusic): Cardinal; cdecl;
  sfMusic_GetSampleRate: function(const music: PsfMusic): Cardinal; cdecl;
  sfMusic_GetStatus: function(const music: PsfMusic): sfSoundStatus; cdecl;
  sfMusic_GetPlayingOffset: function(const music: PsfMusic): sfTime; cdecl;
  sfMusic_SetPitch: procedure(music: PsfMusic; pitch: Single); cdecl;
  sfMusic_SetVolume: procedure(music: PsfMusic; volume: Single); cdecl;
  sfMusic_SetPosition: procedure(music: PsfMusic; position: sfVector3f); cdecl;
  sfMusic_SetRelativeToListener: procedure(music: PsfMusic; relative: Boolean); cdecl;
  sfMusic_SetMinDistance: procedure(music: PsfMusic; distance: Single); cdecl;
  sfMusic_SetAttenuation: procedure(music: PsfMusic; attenuation: Single); cdecl;
  sfMusic_SetPlayingOffset: procedure(music: PsfMusic; timeOffset: sfTime); cdecl;
  sfMusic_GetPitch: function(const music: PsfMusic): Single; cdecl;
  sfMusic_GetVolume: function(const music: PsfMusic): Single; cdecl;
  sfMusic_GetPosition: function(const music: PsfMusic): sfVector3f; cdecl;
  sfMusic_IsRelativeToListener: function(const music: PsfMusic): Boolean; cdecl;
  sfMusic_GetMinDistance: function(const music: PsfMusic): Single; cdecl;
  sfMusic_GetAttenuation: function(const music: PsfMusic): Single; cdecl;

//=== SOUND =================================================================
var
  sfSound_Create: function(const buffer: PsfSoundBuffer): PsfSound; cdecl;
  sfSound_Copy: function(const sound: PsfSound): PsfSound; cdecl;
  sfSound_Destroy: procedure(const sound: PsfSound); cdecl;
  sfSound_Play: procedure(sound: PsfSound); cdecl;
  sfSound_Pause: procedure(sound: PsfSound); cdecl;
  sfSound_Stop: procedure(sound: PsfSound); cdecl;
  sfSound_SetBuffer: procedure(sound: PsfSound; const buffer: PsfSoundBuffer); cdecl;
  sfSound_GetBuffer: function(const sound: PsfSound): PsfSoundBuffer; cdecl;
  sfSound_SetLooping: procedure(sound: PsfSound; loop: Boolean); cdecl;
  sfSound_IsLooping: function(const sound: PsfSound): Boolean; cdecl;
  sfSound_GetStatus: function(const sound: PsfSound): sfSoundStatus; cdecl;
  sfSound_SetPitch: procedure(sound: PsfSound; pitch: Single); cdecl;
  sfSound_SetVolume: procedure(sound: PsfSound; volume: Single); cdecl;
  sfSound_SetPosition: procedure(sound: PsfSound; position: sfVector3f); cdecl;
  sfSound_SetRelativeToListener: procedure(sound: PsfSound; relative: Boolean); cdecl;
  sfSound_SetMinDistance: procedure(sound: PsfSound; distance: Single); cdecl;
  sfSound_SetAttenuation: procedure(sound: PsfSound; attenuation: Single); cdecl;
  sfSound_SetPlayingOffset: procedure(sound: PsfSound; timeOffset: sfTime); cdecl;
  sfSound_GetPitch: function(const sound: PsfSound): Single; cdecl;
  sfSound_GetVolume: function(const sound: PsfSound): Single; cdecl;
  sfSound_GetPosition: function(const sound: PsfSound): sfVector3f; cdecl;
  sfSound_IsRelativeToListener: function(const sound: PsfSound): Boolean; cdecl;
  sfSound_GetMinDistance: function(const sound: PsfSound): Single; cdecl;
  sfSound_GetAttenuation: function(const sound: PsfSound): Single; cdecl;
  sfSound_GetPlayingOffset: function(const sound: PsfSound): sfTime; cdecl;

//=== SOUNDBUFFER ===========================================================
var
  sfSoundBuffer_CreateFromFile: function(const filename: PUTF8Char): PsfSoundBuffer; cdecl;
  sfSoundBuffer_CreateFromMemory: function(const data: Pointer; sizeInBytes: NativeUInt): PsfSoundBuffer; cdecl;
  sfSoundBuffer_CreateFromStream: function(stream: PsfInputStream): PsfSoundBuffer; cdecl;
  sfSoundBuffer_CreateFromSamples: function(const samples: PInt16; sampleCount: UInt64; channelCount: Cardinal; sampleRate: Cardinal; channelMapData: PsfSoundChannel; channelMapSize: NativeUInt): PsfSoundBuffer; cdecl;
  sfSoundBuffer_Copy: function(const soundBuffer: PsfSoundBuffer): PsfSoundBuffer; cdecl;
  sfSoundBuffer_Destroy: procedure(const soundBuffer: PsfSoundBuffer); cdecl;
  sfSoundBuffer_SaveToFile: function(const soundBuffer: PsfSoundBuffer; const filename: PUTF8Char): Boolean; cdecl;
  sfSoundBuffer_GetSamples: function(const soundBuffer: PsfSoundBuffer): PInt16; cdecl;
  sfSoundBuffer_GetSampleCount: function(const soundBuffer: PsfSoundBuffer): UInt64; cdecl;
  sfSoundBuffer_GetSampleRate: function(const soundBuffer: PsfSoundBuffer): Cardinal; cdecl;
  sfSoundBuffer_GetChannelCount: function(const soundBuffer: PsfSoundBuffer): Cardinal; cdecl;
  sfSoundBuffer_GetDuration: function(const soundBuffer: PsfSoundBuffer): sfTime; cdecl;
  sfSoundBufferRecorder_Create: function(): PsfSoundBufferRecorder; cdecl;
  sfSoundBufferRecorder_Destroy: procedure(const soundBufferRecorder: PsfSoundBufferRecorder); cdecl;
  sfSoundBufferRecorder_Start: function(soundBufferRecorder: PsfSoundBufferRecorder; sampleRate: Cardinal): Boolean; cdecl;
  sfSoundBufferRecorder_Stop: procedure(soundBufferRecorder: PsfSoundBufferRecorder); cdecl;
  sfSoundBufferRecorder_GetSampleRate: function(const soundBufferRecorder: PsfSoundBufferRecorder): Cardinal; cdecl;
  sfSoundBufferRecorder_GetBuffer: function(const soundBufferRecorder: PsfSoundBufferRecorder): PsfSoundBuffer; cdecl;
  sfSoundBufferRecorder_SetDevice: function(soundBufferRecorder: PsfSoundBufferRecorder; const name: PUTF8Char): Boolean; cdecl;
  sfSoundBufferRecorder_GetDevice: function(soundBufferRecorder: PsfSoundBufferRecorder): PUTF8Char; cdecl;
  sfSoundBufferRecorder_SetChannelCount: procedure(soundBufferRecorder: PsfSoundBufferRecorder; channelCount: Cardinal); cdecl;
  sfSoundBufferRecorder_GetChannelCount: function(const soundBufferRecorder: PsfSoundBufferRecorder): Cardinal; cdecl;

//=== SOUNDRECORDER =========================================================
  sfSoundRecorder_Create: function(onStart: sfSoundRecorderStartCallback; onProcess: sfSoundRecorderProcessCallback; onStop: sfSoundRecorderStopCallback; userData: Pointer): PsfSoundRecorder; cdecl;
  sfSoundRecorder_Destroy: procedure(const soundRecorder: PsfSoundRecorder); cdecl;
  sfSoundRecorder_Start: function(soundRecorder: PsfSoundRecorder; sampleRate: Cardinal): Boolean; cdecl;
  sfSoundRecorder_Stop: procedure(soundRecorder: PsfSoundRecorder); cdecl;
  sfSoundRecorder_GetSampleRate: function(const soundRecorder: PsfSoundRecorder): Cardinal; cdecl;
  sfSoundRecorder_IsAvailable: function(): Boolean; cdecl;
  sfSoundRecorder_GetAvailableDevices: function(count: PNativeUInt): PPUTF8Char; cdecl;
  sfSoundRecorder_GetDefaultDevice: function(): PUTF8Char; cdecl;
  sfSoundRecorder_SetDevice: function(soundRecorder: PsfSoundRecorder; const name: PUTF8Char): Boolean; cdecl;
  sfSoundRecorder_GetDevice: function(soundRecorder: PsfSoundRecorder): PUTF8Char; cdecl;
  sfSoundRecorder_SetChannelCount: procedure(soundRecorder: PsfSoundRecorder; channelCount: Cardinal); cdecl;
  sfSoundRecorder_GetChannelCount: function(const soundRecorder: PsfSoundRecorder): Cardinal; cdecl;
  
//=== SOUNDSTREAM ===========================================================
var  
  sfSoundStream_Create: function(onGetData: sfSoundStreamGetDataCallback; onSeek: sfSoundStreamSeekCallback; channelCount: Cardinal; sampleRate: Cardinal; channelMapData: PsfSoundChannel; channelMapSize: NativeUInt; userData: Pointer): PsfSoundStream; cdecl;
  sfSoundStream_Destroy: procedure(const soundStream: PsfSoundStream); cdecl;
  sfSoundStream_Play: procedure(soundStream: PsfSoundStream); cdecl;
  sfSoundStream_Pause: procedure(soundStream: PsfSoundStream); cdecl;
  sfSoundStream_Stop: procedure(soundStream: PsfSoundStream); cdecl;
  sfSoundStream_GetStatus: function(const soundStream: PsfSoundStream): sfSoundStatus; cdecl;
  sfSoundStream_GetChannelCount: function(const soundStream: PsfSoundStream): Cardinal; cdecl;
  sfSoundStream_GetSampleRate: function(const soundStream: PsfSoundStream): Cardinal; cdecl;
  sfSoundStream_SetPitch: procedure(soundStream: PsfSoundStream; pitch: Single); cdecl;
  sfSoundStream_SetVolume: procedure(soundStream: PsfSoundStream; volume: Single); cdecl;
  sfSoundStream_SetPosition: procedure(soundStream: PsfSoundStream; position: sfVector3f); cdecl;
  sfSoundStream_SetRelativeToListener: procedure(soundStream: PsfSoundStream; relative: Boolean); cdecl;
  sfSoundStream_SetMinDistance: procedure(soundStream: PsfSoundStream; distance: Single); cdecl;
  sfSoundStream_SetAttenuation: procedure(soundStream: PsfSoundStream; attenuation: Single); cdecl;
  sfSoundStream_SetPlayingOffset: procedure(soundStream: PsfSoundStream; timeOffset: sfTime); cdecl;
  sfSoundStream_SetLooping: procedure(soundStream: PsfSoundStream; loop: Boolean); cdecl;
  sfSoundStream_GetPitch: function(const soundStream: PsfSoundStream): Single; cdecl;
  sfSoundStream_GetVolume: function(const soundStream: PsfSoundStream): Single; cdecl;
  sfSoundStream_GetPosition: function(const soundStream: PsfSoundStream): sfVector3f; cdecl;
  sfSoundStream_IsRelativeToListener: function(const soundStream: PsfSoundStream): Boolean; cdecl;
  sfSoundStream_GetMinDistance: function(const soundStream: PsfSoundStream): Single; cdecl;
  sfSoundStream_GetAttenuation: function(const soundStream: PsfSoundStream): Single; cdecl;
  sfSoundStream_IsLooping: function(const soundStream: PsfSoundStream): Boolean; cdecl;
  sfSoundStream_GetPlayingOffset: function(const soundStream: PsfSoundStream): sfTime; cdecl;
  
//=== SOUNDBUFFER ===========================================================
var
  sfBuffer_Create: function(): PsfBuffer; cdecl;
  sfBuffer_Destroy: procedure(const buffer: PsfBuffer); cdecl;
  sfBuffer_GetSize: function(const buffer: PsfBuffer): NativeUInt; cdecl;
  sfBuffer_GetData: function(const buffer: PsfBuffer): PUInt8; cdecl;

//=== CLOCK =================================================================
var
  sfClock_Create: function(): PsfClock; cdecl;
  sfClock_Copy: function(const clock: PsfClock): PsfClock; cdecl;
  sfClock_Destroy: procedure(const clock: PsfClock); cdecl;
  sfClock_GetElapsedTime: function(const clock: PsfClock): sfTime; cdecl;
  sfClock_Restart: function(clock: PsfClock): sfTime; cdecl;
  sfSleep: procedure(duration: sfTime); cdecl;
  
//=== COLOR =================================================================
var
  sfColor_FromRGB: function(red: UInt8; green: UInt8; blue: UInt8): sfColor; cdecl;
  sfColor_FromRGBA: function(red: UInt8; green: UInt8; blue: UInt8; alpha: UInt8): sfColor; cdecl;
  sfColor_FromInteger: function(color: UInt32): sfColor; cdecl;
  sfColor_ToInteger: function(color: sfColor): UInt32; cdecl;
  sfColor_Add: function(color1: sfColor; color2: sfColor): sfColor; cdecl;
  sfColor_Subtract: function(color1: sfColor; color2: sfColor): sfColor; cdecl;
  sfColor_Modulate: function(color1: sfColor; color2: sfColor): sfColor; cdecl;

//=== RECT ==================================================================
var
  sfFloatRect_Contains: function(const rect: PsfFloatRect; point: sfVector2f): Boolean; cdecl;
  sfIntRect_Contains: function(const rect: PsfIntRect; point: sfVector2i): Boolean; cdecl;
  sfFloatRect_Intersects: function(const rect1: PsfFloatRect; const rect2: PsfFloatRect; intersection: PsfFloatRect): Boolean; cdecl;
  sfIntRect_Intersects: function(const rect1: PsfIntRect; const rect2: PsfIntRect; intersection: PsfIntRect): Boolean; cdecl;
  
//=== TRANSFORM =============================================================
var
  sfTransform_FromMatrix: function(a00: Single; a01: Single; a02: Single; a10: Single; a11: Single; a12: Single; a20: Single; a21: Single; a22: Single): sfTransform; cdecl;
  sfTransform_GetMatrix: procedure(const transform: PsfTransform; matrix: PSingle); cdecl;
  sfTransform_GetInverse: function(const transform: PsfTransform): sfTransform; cdecl;
  sfTransform_TransformPoint: function(const transform: PsfTransform; point: sfVector2f): sfVector2f; cdecl;
  sfTransform_TransformRect: function(const transform: PsfTransform; rectangle: sfFloatRect): sfFloatRect; cdecl;
  sfTransform_Combine: procedure(transform: PsfTransform; const other: PsfTransform); cdecl;
  sfTransform_Translate: procedure(transform: PsfTransform; offset: sfVector2f); cdecl;
  sfTransform_Rotate: procedure(transform: PsfTransform; angle: Single); cdecl;
  sfTransform_RotateWithCenter: procedure(transform: PsfTransform; angle: Single; center: sfVector2f); cdecl;
  sfTransform_Scale: procedure(transform: PsfTransform; scale: sfVector2f); cdecl;
  sfTransform_ScaleWithCenter: procedure(transform: PsfTransform; scale: sfVector2f; center: sfVector2f); cdecl;
  sfTransform_Equal: function(left: PsfTransform; right: PsfTransform): Boolean; cdecl;

//=== CIRCLESHAPE ===========================================================
var
  sfCircleShape_Create: function(): PsfCircleShape; cdecl;
  sfCircleShape_Copy: function(const shape: PsfCircleShape): PsfCircleShape; cdecl;
  sfCircleShape_Destroy: procedure(const shape: PsfCircleShape); cdecl;
  sfCircleShape_SetPosition: procedure(shape: PsfCircleShape; position: sfVector2f); cdecl;
  sfCircleShape_SetRotation: procedure(shape: PsfCircleShape; angle: Single); cdecl;
  sfCircleShape_SetScale: procedure(shape: PsfCircleShape; scale: sfVector2f); cdecl;
  sfCircleShape_SetOrigin: procedure(shape: PsfCircleShape; origin: sfVector2f); cdecl;
  sfCircleShape_GetPosition: function(const shape: PsfCircleShape): sfVector2f; cdecl;
  sfCircleShape_GetRotation: function(const shape: PsfCircleShape): Single; cdecl;
  sfCircleShape_GetScale: function(const shape: PsfCircleShape): sfVector2f; cdecl;
  sfCircleShape_GetOrigin: function(const shape: PsfCircleShape): sfVector2f; cdecl;
  sfCircleShape_Move: procedure(shape: PsfCircleShape; offset: sfVector2f); cdecl;
  sfCircleShape_Rotate: procedure(shape: PsfCircleShape; angle: Single); cdecl;
  sfCircleShape_Scale: procedure(shape: PsfCircleShape; factors: sfVector2f); cdecl;
  sfCircleShape_GetTransform: function(const shape: PsfCircleShape): sfTransform; cdecl;
  sfCircleShape_GetInverseTransform: function(const shape: PsfCircleShape): sfTransform; cdecl;
  sfCircleShape_SetTexture: procedure(shape: PsfCircleShape; const texture: PsfTexture; resetRect: Boolean); cdecl;
  sfCircleShape_SetTextureRect: procedure(shape: PsfCircleShape; rect: sfIntRect); cdecl;
  sfCircleShape_SetFillColor: procedure(shape: PsfCircleShape; color: sfColor); cdecl;
  sfCircleShape_SetOutlineColor: procedure(shape: PsfCircleShape; color: sfColor); cdecl;
  sfCircleShape_SetOutlineThickness: procedure(shape: PsfCircleShape; thickness: Single); cdecl;
  sfCircleShape_GetTexture: function(const shape: PsfCircleShape): PsfTexture; cdecl;
  sfCircleShape_GetTextureRect: function(const shape: PsfCircleShape): sfIntRect; cdecl;
  sfCircleShape_GetFillColor: function(const shape: PsfCircleShape): sfColor; cdecl;
  sfCircleShape_GetOutlineColor: function(const shape: PsfCircleShape): sfColor; cdecl;
  sfCircleShape_GetOutlineThickness: function(const shape: PsfCircleShape): Single; cdecl;
  sfCircleShape_GetPointCount: function(const shape: PsfCircleShape): NativeUInt; cdecl;
  sfCircleShape_GetPoint: function(const shape: PsfCircleShape; index: NativeUInt): sfVector2f; cdecl;
  sfCircleShape_SetRadius: procedure(shape: PsfCircleShape; radius: Single); cdecl;
  sfCircleShape_GetRadius: function(const shape: PsfCircleShape): Single; cdecl;
  sfCircleShape_SetPointCount: procedure(shape: PsfCircleShape; count: NativeUInt); cdecl;
  sfCircleShape_GetLocalBounds: function(const shape: PsfCircleShape): sfFloatRect; cdecl;
  sfCircleShape_GetGlobalBounds: function(const shape: PsfCircleShape): sfFloatRect; cdecl;
  
//=== CONVEXSHAPE ===========================================================
var
  sfConvexShape_Create: function(): PsfConvexShape; cdecl;
  sfConvexShape_Copy: function(const shape: PsfConvexShape): PsfConvexShape; cdecl;
  sfConvexShape_Destroy: procedure(const shape: PsfConvexShape); cdecl;
  sfConvexShape_SetPosition: procedure(shape: PsfConvexShape; position: sfVector2f); cdecl;
  sfConvexShape_SetRotation: procedure(shape: PsfConvexShape; angle: Single); cdecl;
  sfConvexShape_SetScale: procedure(shape: PsfConvexShape; scale: sfVector2f); cdecl;
  sfConvexShape_SetOrigin: procedure(shape: PsfConvexShape; origin: sfVector2f); cdecl;
  sfConvexShape_GetPosition: function(const shape: PsfConvexShape): sfVector2f; cdecl;
  sfConvexShape_GetRotation: function(const shape: PsfConvexShape): Single; cdecl;
  sfConvexShape_GetScale: function(const shape: PsfConvexShape): sfVector2f; cdecl;
  sfConvexShape_GetOrigin: function(const shape: PsfConvexShape): sfVector2f; cdecl;
  sfConvexShape_Move: procedure(shape: PsfConvexShape; offset: sfVector2f); cdecl;
  sfConvexShape_Rotate: procedure(shape: PsfConvexShape; angle: Single); cdecl;
  sfConvexShape_Scale: procedure(shape: PsfConvexShape; factors: sfVector2f); cdecl;
  sfConvexShape_GetTransform: function(const shape: PsfConvexShape): sfTransform; cdecl;
  sfConvexShape_GetInverseTransform: function(const shape: PsfConvexShape): sfTransform; cdecl;
  sfConvexShape_SetTexture: procedure(shape: PsfConvexShape; const texture: PsfTexture; resetRect: Boolean); cdecl;
  sfConvexShape_SetTextureRect: procedure(shape: PsfConvexShape; rect: sfIntRect); cdecl;
  sfConvexShape_SetFillColor: procedure(shape: PsfConvexShape; color: sfColor); cdecl;
  sfConvexShape_SetOutlineColor: procedure(shape: PsfConvexShape; color: sfColor); cdecl;
  sfConvexShape_SetOutlineThickness: procedure(shape: PsfConvexShape; thickness: Single); cdecl;
  sfConvexShape_GetTexture: function(const shape: PsfConvexShape): PsfTexture; cdecl;
  sfConvexShape_GetTextureRect: function(const shape: PsfConvexShape): sfIntRect; cdecl;
  sfConvexShape_GetFillColor: function(const shape: PsfConvexShape): sfColor; cdecl;
  sfConvexShape_GetOutlineColor: function(const shape: PsfConvexShape): sfColor; cdecl;
  sfConvexShape_GetOutlineThickness: function(const shape: PsfConvexShape): Single; cdecl;
  sfConvexShape_GetPointCount: function(const shape: PsfConvexShape): NativeUInt; cdecl;
  sfConvexShape_GetPoint: function(const shape: PsfConvexShape; index: NativeUInt): sfVector2f; cdecl;
  sfConvexShape_SetPointCount: procedure(shape: PsfConvexShape; count: NativeUInt); cdecl;
  sfConvexShape_SetPoint: procedure(shape: PsfConvexShape; index: NativeUInt; point: sfVector2f); cdecl;
  sfConvexShape_GetLocalBounds: function(const shape: PsfConvexShape): sfFloatRect; cdecl;
  sfConvexShape_GetGlobalBounds: function(const shape: PsfConvexShape): sfFloatRect; cdecl;
  sfFont_CreateFromFile: function(const filename: PUTF8Char): PsfFont; cdecl;

//=== FONT ==================================================================
var
  sfFont_CreateFromMemory: function(const data: Pointer; sizeInBytes: NativeUInt): PsfFont; cdecl;
  sfFont_CreateFromStream: function(stream: PsfInputStream): PsfFont; cdecl;
  sfFont_Copy: function(const font: PsfFont): PsfFont; cdecl;
  sfFont_Destroy: procedure(const font: PsfFont); cdecl;
  sfFont_GetGlyph: function(const font: PsfFont; codePoint: UInt32; characterSize: Cardinal; bold: Boolean; outlineThickness: Single): sfGlyph; cdecl;
  sfFont_HasGlyph: function(const font: PsfFont; codePoint: UInt32): Boolean; cdecl;
  sfFont_GetKerning: function(const font: PsfFont; first: UInt32; second: UInt32; characterSize: Cardinal): Single; cdecl;
  sfFont_GetBoldKerning: function(const font: PsfFont; first: UInt32; second: UInt32; characterSize: Cardinal): Single; cdecl;
  sfFont_GetLineSpacing: function(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  sfFont_GetUnderlinePosition: function(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  sfFont_GetUnderlineThickness: function(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  sfFont_GetTexture: function(font: PsfFont; characterSize: Cardinal): PsfTexture; cdecl;
  sfFont_SetSmooth: procedure(font: PsfFont; smooth: Boolean); cdecl;
  sfFont_IsSmooth: function(const font: PsfFont): Boolean; cdecl;
  sfFont_GetInfo: function(const font: PsfFont): sfFontInfo; cdecl;
  
//=== IMAGE =================================================================
var
  sfImage_Create: function(size: sfVector2u): PsfImage; cdecl;
  sfImage_CreateFromColor: function(size: sfVector2u; color: sfColor): PsfImage; cdecl;
  sfImage_CreateFromPixels: function(size: sfVector2u; const pixels: PUInt8): PsfImage; cdecl;
  sfImage_CreateFromFile: function(const filename: PUTF8Char): PsfImage; cdecl;
  sfImage_CreateFromMemory: function(const data: Pointer; size: NativeUInt): PsfImage; cdecl;
  sfImage_CreateFromStream: function(stream: PsfInputStream): PsfImage; cdecl;
  sfImage_Copy: function(const image: PsfImage): PsfImage; cdecl;
  sfImage_Destroy: procedure(const image: PsfImage); cdecl;
  sfImage_SaveToFile: function(const image: PsfImage; const filename: PUTF8Char): Boolean; cdecl;
  sfImage_SaveToMemory: function(const image: PsfImage; output: PsfBuffer; const format: PUTF8Char): Boolean; cdecl;
  sfImage_GetSize: function(const image: PsfImage): sfVector2u; cdecl;
  sfImage_CreateMaskFromColor: procedure(image: PsfImage; color: sfColor; alpha: UInt8); cdecl;
  sfImage_CopyImage: function(image: PsfImage; const source: PsfImage; dest: sfVector2u; sourceRect: sfIntRect; applyAlpha: Boolean): Boolean; cdecl;
  sfImage_SetPixel: procedure(image: PsfImage; coords: sfVector2u; color: sfColor); cdecl;
  sfImage_GetPixel: function(const image: PsfImage; coords: sfVector2u): sfColor; cdecl;
  sfImage_GetPixelsPtr: function(const image: PsfImage): PUInt8; cdecl;
  sfImage_FlipHorizontally: procedure(image: PsfImage); cdecl;
  sfImage_FlipVertically: procedure(image: PsfImage); cdecl;

//=== RECTANGLESHAPE ========================================================
var
  sfRectangleShape_Create: function(): PsfRectangleShape; cdecl;
  sfRectangleShape_Copy: function(const shape: PsfRectangleShape): PsfRectangleShape; cdecl;
  sfRectangleShape_Destroy: procedure(const shape: PsfRectangleShape); cdecl;
  sfRectangleShape_SetPosition: procedure(shape: PsfRectangleShape; position: sfVector2f); cdecl;
  sfRectangleShape_SetRotation: procedure(shape: PsfRectangleShape; angle: Single); cdecl;
  sfRectangleShape_SetScale: procedure(shape: PsfRectangleShape; scale: sfVector2f); cdecl;
  sfRectangleShape_SetOrigin: procedure(shape: PsfRectangleShape; origin: sfVector2f); cdecl;
  sfRectangleShape_GetPosition: function(const shape: PsfRectangleShape): sfVector2f; cdecl;
  sfRectangleShape_GetRotation: function(const shape: PsfRectangleShape): Single; cdecl;
  sfRectangleShape_GetScale: function(const shape: PsfRectangleShape): sfVector2f; cdecl;
  sfRectangleShape_GetOrigin: function(const shape: PsfRectangleShape): sfVector2f; cdecl;
  sfRectangleShape_Move: procedure(shape: PsfRectangleShape; offset: sfVector2f); cdecl;
  sfRectangleShape_Rotate: procedure(shape: PsfRectangleShape; angle: Single); cdecl;
  sfRectangleShape_Scale: procedure(shape: PsfRectangleShape; factors: sfVector2f); cdecl;
  sfRectangleShape_GetTransform: function(const shape: PsfRectangleShape): sfTransform; cdecl;
  sfRectangleShape_GetInverseTransform: function(const shape: PsfRectangleShape): sfTransform; cdecl;
  sfRectangleShape_SetTexture: procedure(shape: PsfRectangleShape; const texture: PsfTexture; resetRect: Boolean); cdecl;
  sfRectangleShape_SetTextureRect: procedure(shape: PsfRectangleShape; rect: sfIntRect); cdecl;
  sfRectangleShape_SetFillColor: procedure(shape: PsfRectangleShape; color: sfColor); cdecl;
  sfRectangleShape_SetOutlineColor: procedure(shape: PsfRectangleShape; color: sfColor); cdecl;
  sfRectangleShape_SetOutlineThickness: procedure(shape: PsfRectangleShape; thickness: Single); cdecl;
  sfRectangleShape_GetTexture: function(const shape: PsfRectangleShape): PsfTexture; cdecl;
  sfRectangleShape_GetTextureRect: function(const shape: PsfRectangleShape): sfIntRect; cdecl;
  sfRectangleShape_GetFillColor: function(const shape: PsfRectangleShape): sfColor; cdecl;
  sfRectangleShape_GetOutlineColor: function(const shape: PsfRectangleShape): sfColor; cdecl;
  sfRectangleShape_GetOutlineThickness: function(const shape: PsfRectangleShape): Single; cdecl;
  sfRectangleShape_GetPointCount: function(const shape: PsfRectangleShape): NativeUInt; cdecl;
  sfRectangleShape_GetPoint: function(const shape: PsfRectangleShape; index: NativeUInt): sfVector2f; cdecl;
  sfRectangleShape_SetSize: procedure(shape: PsfRectangleShape; size: sfVector2f); cdecl;
  sfRectangleShape_GetSize: function(const shape: PsfRectangleShape): sfVector2f; cdecl;
  sfRectangleShape_GetLocalBounds: function(const shape: PsfRectangleShape): sfFloatRect; cdecl;
  sfRectangleShape_GetGlobalBounds: function(const shape: PsfRectangleShape): sfFloatRect; cdecl;
  
//=== RENDERSTATES ==========================================================
var
  sfRenderStates_Default: function(): sfRenderStates; cdecl;
  
//=== JOYSTICK ==============================================================
var
  sfJoystick_IsConnected: function(joystick: Cardinal): Boolean; cdecl;
  sfJoystick_GetButtonCount: function(joystick: Cardinal): Cardinal; cdecl;
  sfJoystick_HasAxis: function(joystick: Cardinal; axis: sfJoystickAxis): Boolean; cdecl;
  sfJoystick_IsButtonPressed: function(joystick: Cardinal; button: Cardinal): Boolean; cdecl;
  sfJoystick_GetAxisPosition: function(joystick: Cardinal; axis: sfJoystickAxis): Single; cdecl;
  sfJoystick_GetIdentification: function(joystick: Cardinal): sfJoystickIdentification; cdecl;
  sfJoystick_Update: procedure(); cdecl;
  
//=== KEYBOARD ==============================================================
var
  sfKeyboard_IsKeyPressed: function(key: sfKeyCode): Boolean; cdecl;
  sfKeyboard_IsScancodePressed: function(code: sfScancode): Boolean; cdecl;
  sfKeyboard_Localize: function(code: sfScancode): sfKeyCode; cdecl;
  sfKeyboard_Delocalize: function(key: sfKeyCode): sfScancode; cdecl;
  sfKeyboard_GetDescription: function(code: sfScancode): PUTF8Char; cdecl;
  sfKeyboard_SetVirtualKeyboardVisible: procedure(visible: Boolean); cdecl;
  
//=== MOUSE =================================================================
var
  sfMouse_IsButtonPressed: function(button: sfMouseButton): Boolean; cdecl;
  sfMouse_GetPosition: function(const relativeTo: PsfWindow): sfVector2i; cdecl;
  sfMouse_SetPosition: procedure(position: sfVector2i; const relativeTo: PsfWindow); cdecl;
  sfMouse_GetPositionWindowBase: function(const relativeTo: PsfWindowBase): sfVector2i; cdecl;
  sfMouse_SetPositionWindowBase: procedure(position: sfVector2i; const relativeTo: PsfWindowBase); cdecl;
  sfMouse_getPositionRenderWindow: function(const relativeTo: PsfRenderWindow): sfVector2i; cdecl;
  sfMouse_setPositionRenderWindow: procedure(position: sfVector2i; const relativeTo: PsfRenderWindow); cdecl;  

//=== SENSOR ================================================================
var
  sfSensor_IsAvailable: function(sensor: sfSensorType): Boolean; cdecl;
  sfSensor_SetEnabled: procedure(sensor: sfSensorType; enabled: Boolean); cdecl;
  sfSensor_GetValue: function(sensor: sfSensorType): sfVector3f; cdecl;
  
//=== VIDEOMODE =============================================================
var
  sfVideoMode_GetDesktopMode: function(): sfVideoMode; cdecl;
  sfVideoMode_GetFullscreenModes: function(count: PNativeUInt): PsfVideoMode; cdecl;
  sfVideoMode_IsValid: function(mode: sfVideoMode): Boolean; cdecl;

//=== VULKAN ================================================================
var
  sfVulkan_isAvailable: function(requireGraphics: Boolean): Boolean; cdecl;
  sfVulkan_getFunction: function(const name: PUTF8Char): sfVulkanFunctionPointer; cdecl;
  sfVulkan_getGraphicsRequiredInstanceExtensions: function(count: PNativeUInt): PPUTF8Char; cdecl;

//=== WINDOWBASE ============================================================
var
  sfWindowBase_Create: function(mode: sfVideoMode; const title: PUTF8Char; style: UInt32; state: sfWindowState): PsfWindowBase; cdecl;
  sfWindowBase_CreateUnicode: function(mode: sfVideoMode; const title: PsfChar32; style: UInt32; state: sfWindowState): PsfWindowBase; cdecl;
  sfWindowBase_CreateFromHandle: function(handle: sfWindowHandle): PsfWindowBase; cdecl;
  sfWindowBase_Destroy: procedure(const windowBase: PsfWindowBase); cdecl;
  sfWindowBase_Close: procedure(windowBase: PsfWindowBase); cdecl;
  sfWindowBase_IsOpen: function(const windowBase: PsfWindowBase): Boolean; cdecl;
  sfWindowBase_PollEvent: function(windowBase: PsfWindowBase; event: PsfEvent): Boolean; cdecl;
  sfWindowBase_WaitEvent: function(windowBase: PsfWindowBase; event: PsfEvent): Boolean; cdecl;
  sfWindowBase_GetPosition: function(const windowBase: PsfWindowBase): sfVector2i; cdecl;
  sfWindowBase_SetPosition: procedure(windowBase: PsfWindowBase; position: sfVector2i); cdecl;
  sfWindowBase_GetSize: function(const windowBase: PsfWindowBase): sfVector2u; cdecl;
  sfWindowBase_SetSize: procedure(windowBase: PsfWindowBase; size: sfVector2u); cdecl;
  sfWindowBase_SetTitle: procedure(windowBase: PsfWindowBase; const title: PUTF8Char); cdecl;
  sfWindowBase_SetUnicodeTitle: procedure(windowBase: PsfWindowBase; const title: PsfChar32); cdecl;
  sfWindowBase_SetIcon: procedure(windowBase: PsfWindowBase; size: sfVector2u; const pixels: PUInt8); cdecl;
  sfWindowBase_SetVisible: procedure(windowBase: PsfWindowBase; visible: Boolean); cdecl;
  sfWindowBase_SetMouseCursorVisible: procedure(windowBase: PsfWindowBase; visible: Boolean); cdecl;
  sfWindowBase_SetMouseCursorGrabbed: procedure(windowBase: PsfWindowBase; grabbed: Boolean); cdecl;
  sfWindowBase_SetMouseCursor: procedure(windowBase: PsfWindowBase; const cursor: PsfCursor); cdecl;
  sfWindowBase_SetKeyRepeatEnabled: procedure(windowBase: PsfWindowBase; enabled: Boolean); cdecl;
  sfWindowBase_SetJoystickThreshold: procedure(windowBase: PsfWindowBase; threshold: Single); cdecl;
  sfWindowBase_RequestFocus: procedure(windowBase: PsfWindowBase); cdecl;
  sfWindowBase_HasFocus: function(const windowBase: PsfWindowBase): Boolean; cdecl;
  sfWindowBase_GetNativeHandle: function(const windowBase: PsfWindowBase): sfWindowHandle; cdecl;
  sfWindowBase_CreateVulkanSurface: function(windowBase: PsfWindowBase; const instance: PVkInstance; surface: PVkSurfaceKHR; const allocator: PVkAllocationCallbacks): Boolean; cdecl;
  
//=== WINDOW ================================================================
var
  sfWindow_Create: function(mode: sfVideoMode; const title: PUTF8Char; style: UInt32; state: sfWindowState; const settings: PsfContextSettings): PsfWindow; cdecl;
  sfWindow_CreateUnicode: function(mode: sfVideoMode; const title: PsfChar32; style: UInt32; state: sfWindowState; const settings: PsfContextSettings): PsfWindow; cdecl;
  sfWindow_CreateFromHandle: function(handle: sfWindowHandle; const settings: PsfContextSettings): PsfWindow; cdecl;
  sfWindow_Destroy: procedure(const window: PsfWindow); cdecl;
  sfWindow_Close: procedure(window: PsfWindow); cdecl;
  sfWindow_IsOpen: function(const window: PsfWindow): Boolean; cdecl;
  sfWindow_GetSettings: function(const window: PsfWindow): sfContextSettings; cdecl;
  sfWindow_PollEvent: function(window: PsfWindow; event: PsfEvent): Boolean; cdecl;
  sfWindow_WaitEvent: function(window: PsfWindow; event: PsfEvent): Boolean; cdecl;
  sfWindow_GetPosition: function(const window: PsfWindow): sfVector2i; cdecl;
  sfWindow_SetPosition: procedure(window: PsfWindow; position: sfVector2i); cdecl;
  sfWindow_GetSize: function(const window: PsfWindow): sfVector2u; cdecl;
  sfWindow_SetSize: procedure(window: PsfWindow; size: sfVector2u); cdecl;
  sfWindow_SetTitle: procedure(window: PsfWindow; const title: PUTF8Char); cdecl;
  sfWindow_SetUnicodeTitle: procedure(window: PsfWindow; const title: PsfChar32); cdecl;
  sfWindow_SetIcon: procedure(window: PsfWindow; size: sfVector2u; const pixels: PUInt8); cdecl;
  sfWindow_SetVisible: procedure(window: PsfWindow; visible: Boolean); cdecl;
  sfWindow_SetVerticalSyncEnabled: procedure(window: PsfWindow; enabled: Boolean); cdecl;
  sfWindow_SetMouseCursorVisible: procedure(window: PsfWindow; visible: Boolean); cdecl;
  sfWindow_SetMouseCursorGrabbed: procedure(window: PsfWindow; grabbed: Boolean); cdecl;
  sfWindow_SetMouseCursor: procedure(window: PsfWindow; const cursor: PsfCursor); cdecl;
  sfWindow_SetKeyRepeatEnabled: procedure(window: PsfWindow; enabled: Boolean); cdecl;
  sfWindow_SetFramerateLimit: procedure(window: PsfWindow; limit: Cardinal); cdecl;
  sfWindow_SetJoystickThreshold: procedure(window: PsfWindow; threshold: Single); cdecl;
  sfWindow_SetActive: function(window: PsfWindow; active: Boolean): Boolean; cdecl;
  sfWindow_RequestFocus: procedure(window: PsfWindow); cdecl;
  sfWindow_HasFocus: function(const window: PsfWindow): Boolean; cdecl;
  sfWindow_Display: procedure(window: PsfWindow); cdecl;
  sfWindow_GetNativeHandle: function(const window: PsfWindow): sfWindowHandle; cdecl;
  sfWindow_CreateVulkanSurface: function(window: PsfWindow; const instance: PVkInstance; surface: PVkSurfaceKHR; const allocator: PVkAllocationCallbacks): Boolean; cdecl;

//=== RENDERTEXTURE =========================================================
var
  sfRenderTexture_Create: function(size: sfVector2u; const settings: PsfContextSettings): PsfRenderTexture; cdecl;
  sfRenderTexture_Destroy: procedure(const renderTexture: PsfRenderTexture); cdecl;
  sfRenderTexture_GetSize: function(const renderTexture: PsfRenderTexture): sfVector2u; cdecl;
  sfRenderTexture_IsSrgb: function(const renderTexture: PsfRenderTexture): Boolean; cdecl;
  sfRenderTexture_SetActive: function(renderTexture: PsfRenderTexture; active: Boolean): Boolean; cdecl;
  sfRenderTexture_Display: procedure(renderTexture: PsfRenderTexture); cdecl;
  sfRenderTexture_Clear: procedure(renderTexture: PsfRenderTexture; color: sfColor); cdecl;
  sfRenderTexture_SetView: procedure(renderTexture: PsfRenderTexture; const view: PsfView); cdecl;
  sfRenderTexture_GetView: function(const renderTexture: PsfRenderTexture): PsfView; cdecl;
  sfRenderTexture_GetDefaultView: function(const renderTexture: PsfRenderTexture): PsfView; cdecl;
  sfRenderTexture_GetViewport: function(const renderTexture: PsfRenderTexture; const view: PsfView): sfIntRect; cdecl;
  sfRenderTexture_MapPixelToCoords: function(const renderTexture: PsfRenderTexture; point: sfVector2i; const view: PsfView): sfVector2f; cdecl;
  sfRenderTexture_MapCoordsToPixel: function(const renderTexture: PsfRenderTexture; point: sfVector2f; const view: PsfView): sfVector2i; cdecl;
  sfRenderTexture_DrawSprite: procedure(renderTexture: PsfRenderTexture; const &object: PsfSprite; const states: PsfRenderStates); cdecl;
  sfRenderTexture_DrawText: procedure(renderTexture: PsfRenderTexture; const &object: PsfText; const states: PsfRenderStates); cdecl;
  sfRenderTexture_DrawShape: procedure(renderTexture: PsfRenderTexture; const &object: PsfShape; const states: PsfRenderStates); cdecl;
  sfRenderTexture_DrawCircleShape: procedure(renderTexture: PsfRenderTexture; const &object: PsfCircleShape; const states: PsfRenderStates); cdecl;
  sfRenderTexture_DrawConvexShape: procedure(renderTexture: PsfRenderTexture; const &object: PsfConvexShape; const states: PsfRenderStates); cdecl;
  sfRenderTexture_DrawRectangleShape: procedure(renderTexture: PsfRenderTexture; const &object: PsfRectangleShape; const states: PsfRenderStates); cdecl;
  sfRenderTexture_DrawVertexArray: procedure(renderTexture: PsfRenderTexture; const &object: PsfVertexArray; const states: PsfRenderStates); cdecl;
  sfRenderTexture_DrawVertexBuffer: procedure(renderTexture: PsfRenderTexture; const &object: PsfVertexBuffer; const states: PsfRenderStates); cdecl;
  sfRenderTexture_DrawVertexBufferRange: procedure(renderTexture: PsfRenderTexture; const &object: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates); cdecl;
  sfRenderTexture_DrawPrimitives: procedure(renderTexture: PsfRenderTexture; const vertices: PsfVertex; vertexCount: NativeUInt; &type: sfPrimitiveType; const states: PsfRenderStates); cdecl;
  sfRenderTexture_PushGLStates: procedure(renderTexture: PsfRenderTexture); cdecl;
  sfRenderTexture_PopGLStates: procedure(renderTexture: PsfRenderTexture); cdecl;
  sfRenderTexture_ResetGLStates: procedure(renderTexture: PsfRenderTexture); cdecl;
  sfRenderTexture_GetTexture: function(const renderTexture: PsfRenderTexture): PsfTexture; cdecl;
  sfRenderTexture_GetMaximumAntiAliasingLevel: function(): Cardinal; cdecl;
  sfRenderTexture_SetSmooth: procedure(renderTexture: PsfRenderTexture; smooth: Boolean); cdecl;
  sfRenderTexture_IsSmooth: function(const renderTexture: PsfRenderTexture): Boolean; cdecl;
  sfRenderTexture_SetRepeated: procedure(renderTexture: PsfRenderTexture; repeated: Boolean); cdecl;
  sfRenderTexture_IsRepeated: function(const renderTexture: PsfRenderTexture): Boolean; cdecl;
  sfRenderTexture_GenerateMipmap: function(renderTexture: PsfRenderTexture): Boolean; cdecl;
  
//=== RENDERWINDOW ==========================================================
var
  sfRenderWindow_Create: function(mode: sfVideoMode; const title: PUTF8Char; style: UInt32; state: sfWindowState; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  sfRenderWindow_CreateUnicode: function(mode: sfVideoMode; const title: PsfChar32; style: UInt32; state: sfWindowState; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  sfRenderWindow_CreateFromHandle: function(handle: sfWindowHandle; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  sfRenderWindow_Destroy: procedure(var renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_Close: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_IsOpen: function(const renderWindow: PsfRenderWindow): Boolean; cdecl;
  sfRenderWindow_GetSettings: function(const renderWindow: PsfRenderWindow): sfContextSettings; cdecl;
  sfRenderWindow_PollEvent: function(renderWindow: PsfRenderWindow; event: PsfEvent): Boolean; cdecl;
  sfRenderWindow_WaitEvent: function(renderWindow: PsfRenderWindow; event: PsfEvent): Boolean; cdecl;
  sfRenderWindow_GetPosition: function(const renderWindow: PsfRenderWindow): sfVector2i; cdecl;
  sfRenderWindow_SetPosition: procedure(renderWindow: PsfRenderWindow; position: sfVector2i); cdecl;
  sfRenderWindow_GetSize: function(const renderWindow: PsfRenderWindow): sfVector2u; cdecl;
  sfRenderWindow_IsSrgb: function(const renderWindow: PsfRenderWindow): Boolean; cdecl;
  sfRenderWindow_SetSize: procedure(renderWindow: PsfRenderWindow; size: sfVector2u); cdecl;
  sfRenderWindow_SetTitle: procedure(renderWindow: PsfRenderWindow; const title: PUTF8Char); cdecl;
  sfRenderWindow_SetUnicodeTitle: procedure(renderWindow: PsfRenderWindow; const title: PsfChar32); cdecl;
  sfRenderWindow_SetIcon: procedure(renderWindow: PsfRenderWindow; size: sfVector2u; const pixels: PUInt8); cdecl;
  sfRenderWindow_SetVisible: procedure(renderWindow: PsfRenderWindow; visible: Boolean); cdecl;
  sfRenderWindow_SetVerticalSyncEnabled: procedure(renderWindow: PsfRenderWindow; enabled: Boolean); cdecl;
  sfRenderWindow_SetMouseCursorVisible: procedure(renderWindow: PsfRenderWindow; show: Boolean); cdecl;
  sfRenderWindow_SetMouseCursorGrabbed: procedure(renderWindow: PsfRenderWindow; grabbed: Boolean); cdecl;
  sfRenderWindow_SetMouseCursor: procedure(renderWindow: PsfRenderWindow; const cursor: PsfCursor); cdecl;
  sfRenderWindow_SetKeyRepeatEnabled: procedure(renderWindow: PsfRenderWindow; enabled: Boolean); cdecl;
  sfRenderWindow_SetFramerateLimit: procedure(renderWindow: PsfRenderWindow; limit: Cardinal); cdecl;
  sfRenderWindow_SetJoystickThreshold: procedure(renderWindow: PsfRenderWindow; threshold: Single); cdecl;
  sfRenderWindow_SetActive: function(renderWindow: PsfRenderWindow; active: Boolean): Boolean; cdecl;
  sfRenderWindow_RequestFocus: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_HasFocus: function(const renderWindow: PsfRenderWindow): Boolean; cdecl;
  sfRenderWindow_Display: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_GetNativeHandle: function(const renderWindow: PsfRenderWindow): sfWindowHandle; cdecl;
  sfRenderWindow_Clear: procedure(renderWindow: PsfRenderWindow; color: sfColor); cdecl;
  sfRenderWindow_SetView: procedure(renderWindow: PsfRenderWindow; const view: PsfView); cdecl;
  sfRenderWindow_GetView: function(const renderWindow: PsfRenderWindow): PsfView; cdecl;
  sfRenderWindow_GetDefaultView: function(const renderWindow: PsfRenderWindow): PsfView; cdecl;
  sfRenderWindow_GetViewport: function(const renderWindow: PsfRenderWindow; const view: PsfView): sfIntRect; cdecl;
  sfRenderWindow_MapPixelToCoords: function(const renderWindow: PsfRenderWindow; point: sfVector2i; const view: PsfView): sfVector2f; cdecl;
  sfRenderWindow_MapCoordsToPixel: function(const renderWindow: PsfRenderWindow; point: sfVector2f; const view: PsfView): sfVector2i; cdecl;
  sfRenderWindow_DrawSprite: procedure(renderWindow: PsfRenderWindow; const &object: PsfSprite; const states: PsfRenderStates); cdecl;
  sfRenderWindow_DrawText: procedure(renderWindow: PsfRenderWindow; const &object: PsfText; const states: PsfRenderStates); cdecl;
  sfRenderWindow_DrawShape: procedure(renderWindow: PsfRenderWindow; const &object: PsfShape; const states: PsfRenderStates); cdecl;
  sfRenderWindow_DrawCircleShape: procedure(renderWindow: PsfRenderWindow; const &object: PsfCircleShape; const states: PsfRenderStates); cdecl;
  sfRenderWindow_DrawConvexShape: procedure(renderWindow: PsfRenderWindow; const &object: PsfConvexShape; const states: PsfRenderStates); cdecl;
  sfRenderWindow_DrawRectangleShape: procedure(renderWindow: PsfRenderWindow; const &object: PsfRectangleShape; const states: PsfRenderStates); cdecl;
  sfRenderWindow_DrawVertexArray: procedure(renderWindow: PsfRenderWindow; const &object: PsfVertexArray; const states: PsfRenderStates); cdecl;
  sfRenderWindow_DrawVertexBuffer: procedure(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; const states: PsfRenderStates); cdecl;
  sfRenderWindow_DrawVertexBufferRange: procedure(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates); cdecl;
  sfRenderWindow_DrawPrimitives: procedure(renderWindow: PsfRenderWindow; const vertices: PsfVertex; vertexCount: NativeUInt; &type: sfPrimitiveType; const states: PsfRenderStates); cdecl;
  sfRenderWindow_PushGLStates: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_PopGLStates: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_ResetGLStates: procedure(renderWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_CreateVulkanSurface: function(renderWindow: PsfRenderWindow; const instance: PVkInstance; surface: PVkSurfaceKHR; const allocator: PVkAllocationCallbacks): Boolean; cdecl;

//=== TOUCH =================================================================
var
  sfTouch_GetPositionRenderWindow: function(finger: Cardinal; const relativeTo: PsfRenderWindow): sfVector2i; cdecl;
  
//=== SHADER ================================================================
  sfShader_CreateFromFile: function(const vertexShaderFilename: PUTF8Char; const geometryShaderFilename: PUTF8Char; const fragmentShaderFilename: PUTF8Char): PsfShader; cdecl;
  sfShader_CreateFromMemory: function(const vertexShader: PUTF8Char; const geometryShader: PUTF8Char; const fragmentShader: PUTF8Char): PsfShader; cdecl;
  sfShader_CreateFromStream: function(vertexShaderStream: PsfInputStream; geometryShaderStream: PsfInputStream; fragmentShaderStream: PsfInputStream): PsfShader; cdecl;
  sfShader_Destroy: procedure(const shader: PsfShader); cdecl;
  sfShader_SetFloatUniform: procedure(shader: PsfShader; const name: PUTF8Char; x: Single); cdecl;
  sfShader_SetVec2Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec2); cdecl;
  sfShader_SetVec3Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec3); cdecl;
  sfShader_SetVec4Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec4); cdecl;
  sfShader_SetColorUniform: procedure(shader: PsfShader; const name: PUTF8Char; color: sfColor); cdecl;
  sfShader_SetIntUniform: procedure(shader: PsfShader; const name: PUTF8Char; x: Integer); cdecl;
  sfShader_SetIvec2Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec2); cdecl;
  sfShader_SetIvec3Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec3); cdecl;
  sfShader_SetIvec4Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec4); cdecl;
  sfShader_SetIntColorUniform: procedure(shader: PsfShader; const name: PUTF8Char; color: sfColor); cdecl;
  sfShader_SetBoolUniform: procedure(shader: PsfShader; const name: PUTF8Char; x: Boolean); cdecl;
  sfShader_SetBvec2Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec2); cdecl;
  sfShader_SetBvec3Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec3); cdecl;
  sfShader_SetBvec4Uniform: procedure(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec4); cdecl;
  sfShader_SetMat3Uniform: procedure(shader: PsfShader; const name: PUTF8Char; const matrix: PsfGlslMat3); cdecl;
  sfShader_SetMat4Uniform: procedure(shader: PsfShader; const name: PUTF8Char; const matrix: PsfGlslMat4); cdecl;
  sfShader_SetTextureUniform: procedure(shader: PsfShader; const name: PUTF8Char; const texture: PsfTexture); cdecl;
  sfShader_SetCurrentTextureUniform: procedure(shader: PsfShader; const name: PUTF8Char); cdecl;
  sfShader_SetFloatUniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const scalarArray: PSingle; length: NativeUInt); cdecl;
  sfShader_SetVec2UniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec2; length: NativeUInt); cdecl;
  sfShader_SetVec3UniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec3; length: NativeUInt); cdecl;
  sfShader_SetVec4UniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec4; length: NativeUInt); cdecl;
  sfShader_SetMat3UniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const matrixArray: PsfGlslMat3; length: NativeUInt); cdecl;
  sfShader_SetMat4UniformArray: procedure(shader: PsfShader; const name: PUTF8Char; const matrixArray: PsfGlslMat4; length: NativeUInt); cdecl;
  sfShader_GetNativeHandle: function(const shader: PsfShader): Cardinal; cdecl;
  sfShader_Bind: procedure(const shader: PsfShader); cdecl;
  sfShader_IsAvailable: function(): Boolean; cdecl;
  sfShader_IsGeometryAvailable: function(): Boolean; cdecl;

//=== SHAPE =================================================================
var
  sfShape_Create: function(getPointCount: sfShapeGetPointCountCallback; getPoint: sfShapeGetPointCallback; userData: Pointer): PsfShape; cdecl;
  sfShape_Destroy: procedure(const shape: PsfShape); cdecl;
  sfShape_SetPosition: procedure(shape: PsfShape; position: sfVector2f); cdecl;
  sfShape_SetRotation: procedure(shape: PsfShape; angle: Single); cdecl;
  sfShape_SetScale: procedure(shape: PsfShape; scale: sfVector2f); cdecl;
  sfShape_SetOrigin: procedure(shape: PsfShape; origin: sfVector2f); cdecl;
  sfShape_GetPosition: function(const shape: PsfShape): sfVector2f; cdecl;
  sfShape_GetRotation: function(const shape: PsfShape): Single; cdecl;
  sfShape_GetScale: function(const shape: PsfShape): sfVector2f; cdecl;
  sfShape_GetOrigin: function(const shape: PsfShape): sfVector2f; cdecl;
  sfShape_Move: procedure(shape: PsfShape; offset: sfVector2f); cdecl;
  sfShape_Rotate: procedure(shape: PsfShape; angle: Single); cdecl;
  sfShape_Scale: procedure(shape: PsfShape; factors: sfVector2f); cdecl;
  sfShape_GetTransform: function(const shape: PsfShape): sfTransform; cdecl;
  sfShape_GetInverseTransform: function(const shape: PsfShape): sfTransform; cdecl;
  sfShape_SetTexture: procedure(shape: PsfShape; const texture: PsfTexture; resetRect: Boolean); cdecl;
  sfShape_SetTextureRect: procedure(shape: PsfShape; rect: sfIntRect); cdecl;
  sfShape_SetFillColor: procedure(shape: PsfShape; color: sfColor); cdecl;
  sfShape_SetOutlineColor: procedure(shape: PsfShape; color: sfColor); cdecl;
  sfShape_SetOutlineThickness: procedure(shape: PsfShape; thickness: Single); cdecl;
  sfShape_GetTexture: function(const shape: PsfShape): PsfTexture; cdecl;
  sfShape_GetTextureRect: function(const shape: PsfShape): sfIntRect; cdecl;
  sfShape_GetFillColor: function(const shape: PsfShape): sfColor; cdecl;
  sfShape_GetOutlineColor: function(const shape: PsfShape): sfColor; cdecl;
  sfShape_GetOutlineThickness: function(const shape: PsfShape): Single; cdecl;
  sfShape_GetPointCount: function(const shape: PsfShape): NativeUInt; cdecl;
  sfShape_GetPoint: function(const shape: PsfShape; index: NativeUInt): sfVector2f; cdecl;
  sfShape_GetLocalBounds: function(const shape: PsfShape): sfFloatRect; cdecl;
  sfShape_GetGlobalBounds: function(const shape: PsfShape): sfFloatRect; cdecl;
  sfShape_Update: procedure(shape: PsfShape); cdecl;

//=== SPRITE ================================================================
var
  sfSprite_Create: function(const texture: PsfTexture): PsfSprite; cdecl;
  sfSprite_Copy: function(const sprite: PsfSprite): PsfSprite; cdecl;
  sfSprite_Destroy: procedure(const sprite: PsfSprite); cdecl;
  sfSprite_SetPosition: procedure(sprite: PsfSprite; position: sfVector2f); cdecl;
  sfSprite_SetRotation: procedure(sprite: PsfSprite; angle: Single); cdecl;
  sfSprite_SetScale: procedure(sprite: PsfSprite; scale: sfVector2f); cdecl;
  sfSprite_SetOrigin: procedure(sprite: PsfSprite; origin: sfVector2f); cdecl;
  sfSprite_GetPosition: function(const sprite: PsfSprite): sfVector2f; cdecl;
  sfSprite_GetRotation: function(const sprite: PsfSprite): Single; cdecl;
  sfSprite_GetScale: function(const sprite: PsfSprite): sfVector2f; cdecl;
  sfSprite_GetOrigin: function(const sprite: PsfSprite): sfVector2f; cdecl;
  sfSprite_Move: procedure(sprite: PsfSprite; offset: sfVector2f); cdecl;
  sfSprite_Rotate: procedure(sprite: PsfSprite; angle: Single); cdecl;
  sfSprite_Scale: procedure(sprite: PsfSprite; factors: sfVector2f); cdecl;
  sfSprite_GetTransform: function(const sprite: PsfSprite): sfTransform; cdecl;
  sfSprite_GetInverseTransform: function(const sprite: PsfSprite): sfTransform; cdecl;
  sfSprite_SetTexture: procedure(sprite: PsfSprite; const texture: PsfTexture; resetRect: Boolean); cdecl;
  sfSprite_SetTextureRect: procedure(sprite: PsfSprite; rectangle: sfIntRect); cdecl;
  sfSprite_SetColor: procedure(sprite: PsfSprite; color: sfColor); cdecl;
  sfSprite_GetTexture: function(const sprite: PsfSprite): PsfTexture; cdecl;
  sfSprite_GetTextureRect: function(const sprite: PsfSprite): sfIntRect; cdecl;
  sfSprite_GetColor: function(const sprite: PsfSprite): sfColor; cdecl;
  sfSprite_GetLocalBounds: function(const sprite: PsfSprite): sfFloatRect; cdecl;
  sfSprite_GetGlobalBounds: function(const sprite: PsfSprite): sfFloatRect; cdecl;
  
//=== TEXT ==================================================================
var
  sfText_Create: function(const font: PsfFont): PsfText; cdecl;
  sfText_Copy: function(const text: PsfText): PsfText; cdecl;
  sfText_Destroy: procedure(const text: PsfText); cdecl;
  sfText_SetPosition: procedure(text: PsfText; position: sfVector2f); cdecl;
  sfText_SetRotation: procedure(text: PsfText; angle: Single); cdecl;
  sfText_SetScale: procedure(text: PsfText; scale: sfVector2f); cdecl;
  sfText_SetOrigin: procedure(text: PsfText; origin: sfVector2f); cdecl;
  sfText_GetPosition: function(const text: PsfText): sfVector2f; cdecl;
  sfText_GetRotation: function(const text: PsfText): Single; cdecl;
  sfText_GetScale: function(const text: PsfText): sfVector2f; cdecl;
  sfText_GetOrigin: function(const text: PsfText): sfVector2f; cdecl;
  sfText_Move: procedure(text: PsfText; offset: sfVector2f); cdecl;
  sfText_Rotate: procedure(text: PsfText; angle: Single); cdecl;
  sfText_Scale: procedure(text: PsfText; factors: sfVector2f); cdecl;
  sfText_GetTransform: function(const text: PsfText): sfTransform; cdecl;
  sfText_GetInverseTransform: function(const text: PsfText): sfTransform; cdecl;
  sfText_SetString: procedure(text: PsfText; const &string: PUTF8Char); cdecl;
  sfText_SetUnicodeString: procedure(text: PsfText; const &string: PsfChar32); cdecl;
  sfText_SetFont: procedure(text: PsfText; const font: PsfFont); cdecl;
  sfText_SetCharacterSize: procedure(text: PsfText; size: Cardinal); cdecl;
  sfText_SetLineSpacing: procedure(text: PsfText; spacingFactor: Single); cdecl;
  sfText_SetLetterSpacing: procedure(text: PsfText; spacingFactor: Single); cdecl;
  sfText_SetStyle: procedure(text: PsfText; style: UInt32); cdecl;
  sfText_SetFillColor: procedure(text: PsfText; color: sfColor); cdecl;
  sfText_SetOutlineColor: procedure(text: PsfText; color: sfColor); cdecl;
  sfText_SetOutlineThickness: procedure(text: PsfText; thickness: Single); cdecl;
  sfText_GetString: function(const text: PsfText): PUTF8Char; cdecl;
  sfText_GetUnicodeString: function(const text: PsfText): PsfChar32; cdecl;
  sfText_GetFont: function(const text: PsfText): PsfFont; cdecl;
  sfText_GetCharacterSize: function(const text: PsfText): Cardinal; cdecl;
  sfText_GetLetterSpacing: function(const text: PsfText): Single; cdecl;
  sfText_GetLineSpacing: function(const text: PsfText): Single; cdecl;
  sfText_GetStyle: function(const text: PsfText): UInt32; cdecl;
  sfText_GetFillColor: function(const text: PsfText): sfColor; cdecl;
  sfText_GetOutlineColor: function(const text: PsfText): sfColor; cdecl;
  sfText_GetOutlineThickness: function(const text: PsfText): Single; cdecl;
  sfText_FindCharacterPos: function(const text: PsfText; index: NativeUInt): sfVector2f; cdecl;
  sfText_GetLocalBounds: function(const text: PsfText): sfFloatRect; cdecl;
  sfText_GetGlobalBounds: function(const text: PsfText): sfFloatRect; cdecl;

//=== TEXTURE ===============================================================
var
  sfTexture_Create: function(size: sfVector2u): PsfTexture; cdecl;
  sfTexture_CreateFromFile: function(const filename: PUTF8Char; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_CreateSrgbFromFile: function(const filename: PUTF8Char; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_CreateFromMemory: function(const data: Pointer; sizeInBytes: NativeUInt; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_CreateSrgbFromMemory: function(const data: Pointer; sizeInBytes: NativeUInt; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_CreateFromStream: function(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_CreateSrgbFromStream: function(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_CreateFromImage: function(const image: PsfImage; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_CreateSrgbFromImage: function(const image: PsfImage; const area: PsfIntRect): PsfTexture; cdecl;
  sfTexture_Copy: function(const texture: PsfTexture): PsfTexture; cdecl;
  sfTexture_Destroy: procedure(const texture: PsfTexture); cdecl;
  sfTexture_GetSize: function(const texture: PsfTexture): sfVector2u; cdecl;
  sfTexture_CopyToImage: function(const texture: PsfTexture): PsfImage; cdecl;
  sfTexture_UpdateFromPixels: procedure(texture: PsfTexture; const pixels: PUInt8; size: sfVector2u; offset: sfVector2u); cdecl;
  sfTexture_UpdateFromTexture: procedure(destination: PsfTexture; const source: PsfTexture; offset: sfVector2u); cdecl;
  sfTexture_UpdateFromImage: procedure(texture: PsfTexture; const image: PsfImage; offset: sfVector2u); cdecl;
  sfTexture_UpdateFromWindow: procedure(texture: PsfTexture; const window: PsfWindow; offset: sfVector2u); cdecl;
  sfTexture_UpdateFromRenderWindow: procedure(texture: PsfTexture; const renderWindow: PsfRenderWindow; offset: sfVector2u); cdecl;
  sfTexture_SetSmooth: procedure(texture: PsfTexture; smooth: Boolean); cdecl;
  sfTexture_IsSmooth: function(const texture: PsfTexture): Boolean; cdecl;
  sfTexture_IsSrgb: function(const texture: PsfTexture): Boolean; cdecl;
  sfTexture_SetRepeated: procedure(texture: PsfTexture; repeated: Boolean); cdecl;
  sfTexture_IsRepeated: function(const texture: PsfTexture): Boolean; cdecl;
  sfTexture_GenerateMipmap: function(texture: PsfTexture): Boolean; cdecl;
  sfTexture_Swap: procedure(left: PsfTexture; right: PsfTexture); cdecl;
  sfTexture_GetNativeHandle: function(const texture: PsfTexture): Cardinal; cdecl;
  sfTexture_Bind: procedure(const texture: PsfTexture; &type: sfTextureCoordinateType); cdecl;
  sfTexture_GetMaximumSize: function(): Cardinal; cdecl;

//=== TRANSFORMABLE =========================================================
var
  sfTransformable_Create: function(): PsfTransformable; cdecl;
  sfTransformable_Copy: function(const transformable: PsfTransformable): PsfTransformable; cdecl;
  sfTransformable_Destroy: procedure(const transformable: PsfTransformable); cdecl;
  sfTransformable_SetPosition: procedure(transformable: PsfTransformable; position: sfVector2f); cdecl;
  sfTransformable_SetRotation: procedure(transformable: PsfTransformable; angle: Single); cdecl;
  sfTransformable_SetScale: procedure(transformable: PsfTransformable; scale: sfVector2f); cdecl;
  sfTransformable_SetOrigin: procedure(transformable: PsfTransformable; origin: sfVector2f); cdecl;
  sfTransformable_GetPosition: function(const transformable: PsfTransformable): sfVector2f; cdecl;
  sfTransformable_GetRotation: function(const transformable: PsfTransformable): Single; cdecl;
  sfTransformable_GetScale: function(const transformable: PsfTransformable): sfVector2f; cdecl;
  sfTransformable_GetOrigin: function(const transformable: PsfTransformable): sfVector2f; cdecl;
  sfTransformable_Move: procedure(transformable: PsfTransformable; offset: sfVector2f); cdecl;
  sfTransformable_Rotate: procedure(transformable: PsfTransformable; angle: Single); cdecl;
  sfTransformable_Scale: procedure(transformable: PsfTransformable; factors: sfVector2f); cdecl;
  sfTransformable_GetTransform: function(const transformable: PsfTransformable): sfTransform; cdecl;
  sfTransformable_GetInverseTransform: function(const transformable: PsfTransformable): sfTransform; cdecl;
  
//=== VERTEXARRAY ===========================================================
var
  sfVertexArray_Create: function(): PsfVertexArray; cdecl;
  sfVertexArray_Copy: function(const vertexArray: PsfVertexArray): PsfVertexArray; cdecl;
  sfVertexArray_Destroy: procedure(const vertexArray: PsfVertexArray); cdecl;
  sfVertexArray_GetVertexCount: function(const vertexArray: PsfVertexArray): NativeUInt; cdecl;
  sfVertexArray_GetVertex: function(vertexArray: PsfVertexArray; index: NativeUInt): PsfVertex; cdecl;
  sfVertexArray_Clear: procedure(vertexArray: PsfVertexArray); cdecl;
  sfVertexArray_Resize: procedure(vertexArray: PsfVertexArray; vertexCount: NativeUInt); cdecl;
  sfVertexArray_Append: procedure(vertexArray: PsfVertexArray; vertex: sfVertex); cdecl;
  sfVertexArray_SetPrimitiveType: procedure(vertexArray: PsfVertexArray; &type: sfPrimitiveType); cdecl;
  sfVertexArray_GetPrimitiveType: function(vertexArray: PsfVertexArray): sfPrimitiveType; cdecl;
  sfVertexArray_GetBounds: function(vertexArray: PsfVertexArray): sfFloatRect; cdecl;

//=== VERTEXBUFFER ==========================================================
  sfVertexBuffer_Create: function(vertexCount: Cardinal; &type: sfPrimitiveType; usage: sfVertexBufferUsage): PsfVertexBuffer; cdecl;
  sfVertexBuffer_Copy: function(const vertexBuffer: PsfVertexBuffer): PsfVertexBuffer; cdecl;
  sfVertexBuffer_Destroy: procedure(const vertexBuffer: PsfVertexBuffer); cdecl;
  sfVertexBuffer_GetVertexCount: function(const vertexBuffer: PsfVertexBuffer): NativeUInt; cdecl;
  sfVertexBuffer_Update: function(vertexBuffer: PsfVertexBuffer; const vertices: PsfVertex; vertexCount: Cardinal; offset: Cardinal): Boolean; cdecl;
  sfVertexBuffer_UpdateFromVertexBuffer: function(vertexBuffer: PsfVertexBuffer; const other: PsfVertexBuffer): Boolean; cdecl;
  sfVertexBuffer_Swap: procedure(left: PsfVertexBuffer; right: PsfVertexBuffer); cdecl;
  sfVertexBuffer_GetNativeHandle: function(vertexBuffer: PsfVertexBuffer): Cardinal; cdecl;
  sfVertexBuffer_SetPrimitiveType: procedure(vertexBuffer: PsfVertexBuffer; &type: sfPrimitiveType); cdecl;
  sfVertexBuffer_GetPrimitiveType: function(const vertexBuffer: PsfVertexBuffer): sfPrimitiveType; cdecl;
  sfVertexBuffer_SetUsage: procedure(vertexBuffer: PsfVertexBuffer; usage: sfVertexBufferUsage); cdecl;
  sfVertexBuffer_GetUsage: function(const vertexBuffer: PsfVertexBuffer): sfVertexBufferUsage; cdecl;
  sfVertexBuffer_Bind: procedure(const vertexBuffer: PsfVertexBuffer); cdecl;
  sfVertexBuffer_IsAvailable: function(): Boolean; cdecl;
  
//=== VIEW ==================================================================
  sfView_Create: function(): PsfView; cdecl;
  sfView_CreateFromRect: function(rectangle: sfFloatRect): PsfView; cdecl;
  sfView_Copy: function(const view: PsfView): PsfView; cdecl;
  sfView_Destroy: procedure(const view: PsfView); cdecl;
  sfView_SetCenter: procedure(view: PsfView; center: sfVector2f); cdecl;
  sfView_SetSize: procedure(view: PsfView; size: sfVector2f); cdecl;
  sfView_SetRotation: procedure(view: PsfView; angle: Single); cdecl;
  sfView_SetViewport: procedure(view: PsfView; viewport: sfFloatRect); cdecl;
  sfView_GetCenter: function(const view: PsfView): sfVector2f; cdecl;
  sfView_GetSize: function(const view: PsfView): sfVector2f; cdecl;
  sfView_GetRotation: function(const view: PsfView): Single; cdecl;
  sfView_GetViewport: function(const view: PsfView): sfFloatRect; cdecl;
  sfView_Move: procedure(view: PsfView; offset: sfVector2f); cdecl;
  sfView_Rotate: procedure(view: PsfView; angle: Single); cdecl;
  sfView_Zoom: procedure(view: PsfView; factor: Single); cdecl;

//=== CLIPBOARD =============================================================
var
  sfClipboard_GetString: function(): PUTF8Char; cdecl;
  sfClipboard_GetUnicodeString: function(): PsfChar32; cdecl;
  sfClipboard_SetString: procedure(const text: PUTF8Char); cdecl;
  sfClipboard_SetUnicodeString: procedure(const text: PsfChar32); cdecl;
  
//=== CONTEXT ==============================================================
var
  sfContext_Create: function(): PsfContext; cdecl;
  sfContext_Destroy: procedure(const context: PsfContext); cdecl;
  sfContext_IsExtensionAvailable: function(const name: PUTF8Char): Boolean; cdecl;
  sfContext_SetActive: function(context: PsfContext; active: Boolean): Boolean; cdecl;
  sfContext_GetFunction: function(const name: PUTF8Char): sfGlFunctionPointer; cdecl;
  sfContext_GetSettings: function(const context: PsfContext): sfContextSettings; cdecl;
  sfContext_GetActiveContextId: function(): UInt64; cdecl;
  
// === CURSOR ===============================================================
var
  sfCursor_CreateFromPixels: function(const pixels: PUInt8; size: sfVector2u; hotspot: sfVector2u): PsfCursor; cdecl;
  sfCursor_CreateFromSystem: function(&type: sfCursorType): PsfCursor; cdecl;
  sfCursor_Destroy: procedure(const cursor: PsfCursor); cdecl;
  
// === TOUCH ================================================================
var
  sfTouch_IsDown: function(finger: Cardinal): Boolean; cdecl;
  sfTouch_GetPosition: function(finger: Cardinal; const relativeTo: PsfWindow): sfVector2i; cdecl;
  sfTouch_GetPositionWindowBase: function(finger: Cardinal; const relativeTo: PsfWindowBase): sfVector2i; cdecl;

//=== IPADDRESS =============================================================
var
  sfIpAddress_FromString: function(const address: PUTF8Char): sfIpAddress; cdecl;
  sfIpAddress_FromBytes: function(byte0: UInt8; byte1: UInt8; byte2: UInt8; byte3: UInt8): sfIpAddress; cdecl;
  sfIpAddress_FromInteger: function(address: UInt32): sfIpAddress; cdecl;
  sfIpAddress_ToString: procedure(address: sfIpAddress; &string: PUTF8Char); cdecl;
  sfIpAddress_ToInteger: function(address: sfIpAddress): UInt32; cdecl;
  sfIpAddress_GetLocalAddress: function(): sfIpAddress; cdecl;
  sfIpAddress_GetPublicAddress: function(timeout: sfTime): sfIpAddress; cdecl;

//=== FTPLISTINGRESPONSE ====================================================
var
  sfFtpListingResponse_Destroy: procedure(const ftpListingResponse: PsfFtpListingResponse); cdecl;
  sfFtpListingResponse_IsOk: function(const ftpListingResponse: PsfFtpListingResponse): Boolean; cdecl;
  sfFtpListingResponse_GetStatus: function(const ftpListingResponse: PsfFtpListingResponse): sfFtpStatus; cdecl;
  sfFtpListingResponse_GetMessage: function(const ftpListingResponse: PsfFtpListingResponse): PUTF8Char; cdecl;
  sfFtpListingResponse_GetCount: function(const ftpListingResponse: PsfFtpListingResponse): NativeUInt; cdecl;
  sfFtpListingResponse_GetName: function(const ftpListingResponse: PsfFtpListingResponse; index: NativeUInt): PUTF8Char; cdecl;

//=== FTPDIRECTORYRESPONSE ==================================================
var
  sfFtpDirectoryResponse_Destroy: procedure(const ftpDirectoryResponse: PsfFtpDirectoryResponse); cdecl;
  sfFtpDirectoryResponse_IsOk: function(const ftpDirectoryResponse: PsfFtpDirectoryResponse): Boolean; cdecl;
  sfFtpDirectoryResponse_GetStatus: function(const ftpDirectoryResponse: PsfFtpDirectoryResponse): sfFtpStatus; cdecl;
  sfFtpDirectoryResponse_GetMessage: function(const ftpDirectoryResponse: PsfFtpDirectoryResponse): PUTF8Char; cdecl;
  sfFtpDirectoryResponse_GetDirectory: function(const ftpDirectoryResponse: PsfFtpDirectoryResponse): PUTF8Char; cdecl;
  sfFtpDirectoryResponse_GetDirectoryUnicode: function(const ftpDirectoryResponse: PsfFtpDirectoryResponse): PsfChar32; cdecl;
  
//=== FTPRESPONSE ===========================================================
var
  sfFtpResponse_Destroy: procedure(const ftpResponse: PsfFtpResponse); cdecl;
  sfFtpResponse_IsOk: function(const ftpResponse: PsfFtpResponse): Boolean; cdecl;
  sfFtpResponse_GetStatus: function(const ftpResponse: PsfFtpResponse): sfFtpStatus; cdecl;
  sfFtpResponse_GetMessage: function(const ftpResponse: PsfFtpResponse): PUTF8Char; cdecl;

//=== FTP ===================================================================
var
  sfFtp_Create: function(): PsfFtp; cdecl;
  sfFtp_Destroy: procedure(const ftp: PsfFtp); cdecl;
  sfFtp_Connect: function(ftp: PsfFtp; server: sfIpAddress; port: Word; timeout: sfTime): PsfFtpResponse; cdecl;
  sfFtp_LoginAnonymous: function(ftp: PsfFtp): PsfFtpResponse; cdecl;
  sfFtp_Login: function(ftp: PsfFtp; const name: PUTF8Char; const password: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_Disconnect: function(ftp: PsfFtp): PsfFtpResponse; cdecl;
  sfFtp_KeepAlive: function(ftp: PsfFtp): PsfFtpResponse; cdecl;
  sfFtp_GetWorkingDirectory: function(ftp: PsfFtp): PsfFtpDirectoryResponse; cdecl;
  sfFtp_GetDirectoryListing: function(ftp: PsfFtp; const directory: PUTF8Char): PsfFtpListingResponse; cdecl;
  sfFtp_ChangeDirectory: function(ftp: PsfFtp; const directory: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_ParentDirectory: function(ftp: PsfFtp): PsfFtpResponse; cdecl;
  sfFtp_CreateDirectory: function(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_DeleteDirectory: function(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_RenameFile: function(ftp: PsfFtp; const &file: PUTF8Char; const newName: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_DeleteFile: function(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  sfFtp_Download: function(ftp: PsfFtp; const remoteFile: PUTF8Char; const localPath: PUTF8Char; mode: sfFtpTransferMode): PsfFtpResponse; cdecl;
  sfFtp_Upload: function(ftp: PsfFtp; const localFile: PUTF8Char; const remotePath: PUTF8Char; mode: sfFtpTransferMode; append: Boolean): PsfFtpResponse; cdecl;
  sfFtp_SendCommand: function(ftp: PsfFtp; const command: PUTF8Char; const parameter: PUTF8Char): PsfFtpResponse; cdecl;

//=== HTTPREQUEST ===========================================================
var
  sfHttpRequest_Create: function(): PsfHttpRequest; cdecl;
  sfHttpRequest_Destroy: procedure(const httpRequest: PsfHttpRequest); cdecl;
  sfHttpRequest_SetField: procedure(httpRequest: PsfHttpRequest; const field: PUTF8Char; const value: PUTF8Char); cdecl;
  sfHttpRequest_SetMethod: procedure(httpRequest: PsfHttpRequest; method: sfHttpMethod); cdecl;
  sfHttpRequest_SetUri: procedure(httpRequest: PsfHttpRequest; const uri: PUTF8Char); cdecl;
  sfHttpRequest_SetHttpVersion: procedure(httpRequest: PsfHttpRequest; major: Cardinal; minor: Cardinal); cdecl;
  sfHttpRequest_SetBody: procedure(httpRequest: PsfHttpRequest; const body: PUTF8Char); cdecl;

//=== HTTPRESPONSE ==========================================================
var
  sfHttpResponse_Destroy: procedure(const httpResponse: PsfHttpResponse); cdecl;
  sfHttpResponse_GetField: function(const httpResponse: PsfHttpResponse; const field: PUTF8Char): PUTF8Char; cdecl;
  sfHttpResponse_GetStatus: function(const httpResponse: PsfHttpResponse): sfHttpStatus; cdecl;
  sfHttpResponse_GetMajorVersion: function(const httpResponse: PsfHttpResponse): Cardinal; cdecl;
  sfHttpResponse_GetMinorVersion: function(const httpResponse: PsfHttpResponse): Cardinal; cdecl;
  sfHttpResponse_GetBody: function(const httpResponse: PsfHttpResponse): PUTF8Char; cdecl;
  
//=== HTTP ==================================================================
var
  sfHttp_Create: function(): PsfHttp; cdecl;
  sfHttp_Destroy: procedure(const http: PsfHttp); cdecl;
  sfHttp_SetHost: procedure(http: PsfHttp; const host: PUTF8Char; port: Word); cdecl;
  sfHttp_SendRequest: function(http: PsfHttp; const request: PsfHttpRequest; timeout: sfTime): PsfHttpResponse; cdecl;

//=== PACKET ================================================================
var
  sfPacket_Create: function(): PsfPacket; cdecl;
  sfPacket_Copy: function(const packet: PsfPacket): PsfPacket; cdecl;
  sfPacket_Destroy: procedure(const packet: PsfPacket); cdecl;
  sfPacket_Append: procedure(packet: PsfPacket; const data: Pointer; sizeInBytes: NativeUInt); cdecl;
  sfPacket_GetReadPosition: function(const packet: PsfPacket): NativeUInt; cdecl;
  sfPacket_Clear: procedure(packet: PsfPacket); cdecl;
  sfPacket_GetData: function(const packet: PsfPacket): Pointer; cdecl;
  sfPacket_GetDataSize: function(const packet: PsfPacket): NativeUInt; cdecl;
  sfPacket_EndOfPacket: function(const packet: PsfPacket): Boolean; cdecl;
  sfPacket_CanRead: function(const packet: PsfPacket): Boolean; cdecl;
  sfPacket_ReadBool: function(packet: PsfPacket): Boolean; cdecl;
  sfPacket_ReadInt8: function(packet: PsfPacket): Int8; cdecl;
  sfPacket_ReadUint8: function(packet: PsfPacket): UInt8; cdecl;
  sfPacket_ReadInt16: function(packet: PsfPacket): Int16; cdecl;
  sfPacket_ReadUint16: function(packet: PsfPacket): UInt16; cdecl;
  sfPacket_ReadInt32: function(packet: PsfPacket): Int32; cdecl;
  sfPacket_ReadUint32: function(packet: PsfPacket): UInt32; cdecl;
  sfPacket_ReadFloat: function(packet: PsfPacket): Single; cdecl;
  sfPacket_ReadDouble: function(packet: PsfPacket): Double; cdecl;
  sfPacket_ReadString: procedure(packet: PsfPacket; &string: PUTF8Char); cdecl;
  sfPacket_ReadWideString: procedure(packet: PsfPacket; &string: PWideChar); cdecl;
  sfPacket_WriteBool: procedure(packet: PsfPacket; p2: Boolean); cdecl;
  sfPacket_WriteInt8: procedure(packet: PsfPacket; p2: Int8); cdecl;
  sfPacket_WriteUint8: procedure(packet: PsfPacket; p2: UInt8); cdecl;
  sfPacket_WriteInt16: procedure(packet: PsfPacket; p2: Int16); cdecl;
  sfPacket_WriteUint16: procedure(packet: PsfPacket; p2: UInt16); cdecl;
  sfPacket_WriteInt32: procedure(packet: PsfPacket; p2: Int32); cdecl;
  sfPacket_WriteUint32: procedure(packet: PsfPacket; p2: UInt32); cdecl;
  sfPacket_WriteFloat: procedure(packet: PsfPacket; p2: Single); cdecl;
  sfPacket_WriteDouble: procedure(packet: PsfPacket; p2: Double); cdecl;
  sfPacket_WriteString: procedure(packet: PsfPacket; const &string: PUTF8Char); cdecl;
  sfPacket_WriteWideString: procedure(packet: PsfPacket; const &string: PWideChar); cdecl;
  
//=== SOCKETSELECTOR ========================================================
  sfSocketSelector_Create: function(): PsfSocketSelector; cdecl;
  sfSocketSelector_Copy: function(const selector: PsfSocketSelector): PsfSocketSelector; cdecl;
  sfSocketSelector_Destroy: procedure(const selector: PsfSocketSelector); cdecl;
  sfSocketSelector_AddTcpListener: procedure(selector: PsfSocketSelector; socket: PsfTcpListener); cdecl;
  sfSocketSelector_AddTcpSocket: procedure(selector: PsfSocketSelector; socket: PsfTcpSocket); cdecl;
  sfSocketSelector_AddUdpSocket: procedure(selector: PsfSocketSelector; socket: PsfUdpSocket); cdecl;
  sfSocketSelector_RemoveTcpListener: procedure(selector: PsfSocketSelector; socket: PsfTcpListener); cdecl;
  sfSocketSelector_RemoveTcpSocket: procedure(selector: PsfSocketSelector; socket: PsfTcpSocket); cdecl;
  sfSocketSelector_RemoveUdpSocket: procedure(selector: PsfSocketSelector; socket: PsfUdpSocket); cdecl;
  sfSocketSelector_Clear: procedure(selector: PsfSocketSelector); cdecl;
  sfSocketSelector_Wait: function(selector: PsfSocketSelector; timeout: sfTime): Boolean; cdecl;
  sfSocketSelector_IsTcpListenerReady: function(const selector: PsfSocketSelector; socket: PsfTcpListener): Boolean; cdecl;
  sfSocketSelector_IsTcpSocketReady: function(const selector: PsfSocketSelector; socket: PsfTcpSocket): Boolean; cdecl;
  sfSocketSelector_IsUdpSocketReady: function(const selector: PsfSocketSelector; socket: PsfUdpSocket): Boolean; cdecl;
  
//=== TCPLISTENER ===========================================================
var
  sfTcpListener_Create: function(): PsfTcpListener; cdecl;
  sfTcpListener_Destroy: procedure(const listener: PsfTcpListener); cdecl;
  sfTcpListener_SetBlocking: procedure(listener: PsfTcpListener; blocking: Boolean); cdecl;
  sfTcpListener_IsBlocking: function(const listener: PsfTcpListener): Boolean; cdecl;
  sfTcpListener_GetLocalPort: function(const listener: PsfTcpListener): Word; cdecl;
  sfTcpListener_Listen: function(listener: PsfTcpListener; port: Word; address: sfIpAddress): sfSocketStatus; cdecl;
  sfTcpListener_Accept: function(listener: PsfTcpListener; connected: PPsfTcpSocket): sfSocketStatus; cdecl;
  
//=== TCPSOCKET ==============================================================
var
  sfTcpSocket_Create: function(): PsfTcpSocket; cdecl;
  sfTcpSocket_Destroy: procedure(const socket: PsfTcpSocket); cdecl;
  sfTcpSocket_SetBlocking: procedure(socket: PsfTcpSocket; blocking: Boolean); cdecl;
  sfTcpSocket_IsBlocking: function(const socket: PsfTcpSocket): Boolean; cdecl;
  sfTcpSocket_GetLocalPort: function(const socket: PsfTcpSocket): Word; cdecl;
  sfTcpSocket_GetRemoteAddress: function(const socket: PsfTcpSocket): sfIpAddress; cdecl;
  sfTcpSocket_GetRemotePort: function(const socket: PsfTcpSocket): Word; cdecl;
  sfTcpSocket_Connect: function(socket: PsfTcpSocket; remoteAddress: sfIpAddress; remotePort: Word; timeout: sfTime): sfSocketStatus; cdecl;
  sfTcpSocket_Disconnect: procedure(socket: PsfTcpSocket); cdecl;
  sfTcpSocket_Send: function(socket: PsfTcpSocket; const data: Pointer; size: NativeUInt): sfSocketStatus; cdecl;
  sfTcpSocket_SendPartial: function(socket: PsfTcpSocket; const data: Pointer; size: NativeUInt; sent: PNativeUInt): sfSocketStatus; cdecl;
  sfTcpSocket_Receive: function(socket: PsfTcpSocket; data: Pointer; size: NativeUInt; received: PNativeUInt): sfSocketStatus; cdecl;
  sfTcpSocket_SendPacket: function(socket: PsfTcpSocket; packet: PsfPacket): sfSocketStatus; cdecl;
  sfTcpSocket_ReceivePacket: function(socket: PsfTcpSocket; packet: PsfPacket): sfSocketStatus; cdecl;
  
//=== UDPSOCKET =============================================================
var
  sfUdpSocket_Create: function(): PsfUdpSocket; cdecl;
  sfUdpSocket_Destroy: procedure(const socket: PsfUdpSocket); cdecl;
  sfUdpSocket_SetBlocking: procedure(socket: PsfUdpSocket; blocking: Boolean); cdecl;
  sfUdpSocket_IsBlocking: function(const socket: PsfUdpSocket): Boolean; cdecl;
  sfUdpSocket_GetLocalPort: function(const socket: PsfUdpSocket): Word; cdecl;
  sfUdpSocket_Bind: function(socket: PsfUdpSocket; port: Word; address: sfIpAddress): sfSocketStatus; cdecl;
  sfUdpSocket_Unbind: procedure(socket: PsfUdpSocket); cdecl;
  sfUdpSocket_Send: function(socket: PsfUdpSocket; const data: Pointer; size: NativeUInt; remoteAddress: sfIpAddress; remotePort: Word): sfSocketStatus; cdecl;
  sfUdpSocket_Receive: function(socket: PsfUdpSocket; data: Pointer; size: NativeUInt; received: PNativeUInt; remoteAddress: PsfIpAddress; remotePort: PWord): sfSocketStatus; cdecl;
  sfUdpSocket_SendPacket: function(socket: PsfUdpSocket; packet: PsfPacket; remoteAddress: sfIpAddress; remotePort: Word): sfSocketStatus; cdecl;
  sfUdpSocket_ReceivePacket: function(socket: PsfUdpSocket; packet: PsfPacket; remoteAddress: PsfIpAddress; remotePort: PWord): sfSocketStatus; cdecl;
  sfUdpSocket_MaxDatagramSize: function(): Cardinal; cdecl;

//=== VECTOR ================================================================
var
  sfVector2i_Create: function(const X, Y: Integer): sfVector2i; cdecl;
  sfVector2u_Create: function(const X, Y: Cardinal): sfVector2u; cdecl;
  sfVector2f_Create: function(const X, Y: Single): sfVector2f; cdecl;
  sfVector3f_Create: function(const X, Y, Z: Single): sfVector3f; cdecl;

//=== RECT ==================================================================
var
  sfFloatRect_Create: function(const ALeft, ATop, AWidth, AHeight: Single): sfFloatRect; cdecl;
  sfIntRect_Create: function(const ALeft, ATop, AWidth, AHeight: Integer): sfIntRect; cdecl;

//=== RENDERWINDOW ==========================================================
var
  sfRenderWindow_SetDefaultIcon: procedure(const AWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_GetFrameRate: function(const AWindow: PsfRenderWindow): Cardinal; cdecl;
  sfRenderWindow_ResetTiming: procedure(const AWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_GetDPI: function(const AWindow: PsfRenderWindow): Cardinal; cdecl;
  sfRenderWindow_ScaleToDPI: function(const AWindow: PsfRenderWindow; const ABaseWidth, ABaseHeight: Cardinal; const ACenter: Boolean; const ADefaultDPI: Integer=96): Boolean; cdecl;
  sfRenderWindow_ScaleOnDPIChange: procedure(const AWindow: PsfRenderWindow); cdecl;
  sfRenderWindow_DrawLine: procedure(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2: Single; const AColor: sfColor; const AThickness: Single); cdecl;
  sfRenderWindow_DrawRect: procedure(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight, AThickness: Single; const AColor: sfColor); cdecl;
  sfRenderWindow_DrawFilledRect: procedure(const ARenderWindow: PsfRenderWindow; const X, Y, AWidth, AHeight: Single; const AColor: sfColor); cdecl;
  sfRenderWindow_DrawTextEx: procedure(const AWindow: PsfRenderWindow; const AText: PsfText; const X, Y: Single; const AColor: sfColor; const AMsg: WideString); cdecl;
  sfRenderWindow_DrawCircle: procedure(const AWindow: PsfRenderWindow; const X, Y, ARadius, AThickness: Single; const AColor: sfColor); cdecl;
  sfRenderWindow_DrawFilledCircle: procedure(const AWindow: PsfRenderWindow; const X, Y, ARadius: Single; const AColor: sfColor); cdecl;
  sfRenderWindow_DrawTriangle: procedure(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2, X3, Y3, AThickness: Single; const AColor, AOutlineColor: sfColor); cdecl;
  sfRenderWindow_DrawFilledTriangle: procedure(const AWindow: PsfRenderWindow; const X1, Y1, X2, Y2, X3, Y3: Single; const AColor: sfColor); cdecl;
  sfRenderWindow_DrawPolygon: procedure(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AThickness: Single; const AColor, AOutlineColor: sfColor); cdecl;
  sfRenderWindow_DrawFilledPolygon: procedure(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AColor: sfColor); cdecl;
  sfRenderWindow_DrawPolyline: procedure(const AWindow: PsfRenderWindow; const APoints: array of sfVector2f; const AThickness: Single; const AColor: sfColor); cdecl;
  sfRenderWindow_DrawEllipse: procedure(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight, AThickness: Single; const AColor: sfColor); cdecl;
  sfRenderWindow_DrawFilledEllipse: procedure(const AWindow: PsfRenderWindow; const X, Y, AWidth, AHeight: Single; const AColor: sfColor); cdecl;
  
procedure sfRenderWindow_DrawTextXY(const AWindow: PsfRenderWindow; const AText: PsfText; const X, Y: Single; const AColor: sfColor; const AMsg: WideString; const AArgs: array of const); cdecl;
procedure sfRenderWindow_DrawTextXVarY(const AWindow: PsfRenderWindow; const AText: PsfText; const X: Single; var Y: Single; const AColor: sfColor; const AMsg: WideString; const AArgs: array of const); cdecl;

//=== VIEW ==================================================================
var
  sfView_SetLetterBox: procedure(const AView: PsfView; const AWindowWidth, AWindowHeight: Integer); cdecl;
  sfView_CreateLetterBox: function(const AWindowWidth, AWindowHeight: Integer): PsfView; cdecl;

//=== FONT ==================================================================
var
  sfFont_CreateFromRes: function(const AInstance: HINST; const AResName: WideString): PsfFont; cdecl;
  sfFont_CreateDefaultFont: function(): PsfFont; cdecl;

//=== TEXT ==================================================================
var
  sfText_SetCharacterSizeDPI: procedure(const AWindow: PsfRenderWindow; const AText: PsfText; const ASize: Cardinal); cdecl;
  sfText_SetUnicodeStringEx: procedure(const AText: PsfText; const AString: WideString); cdecl;

//=== TEXTURE ===============================================================
var
  sfTexture_CreateFromRes: function(const AInstance: HINST; const AResName: WideString; const AArea: PsfIntRect): PsfTexture; cdecl;

//=== ZIPFILE ===============================================================
const
  { sfZipFile_DefaultPassword }
  sfZipFile_DefaultPassword = 'Q.<g%zw[k6T,7:4N2DWC>Y]+n;(r3yj@JcF?Ru=s5LbM`paPf!';

type
  { sfZipFile_BuildProgressCallback }
  sfZipFile_BuildProgressCallback = procedure(const ASender: Pointer; const AFilename: WideString; const AProgress: Integer; const ANewFile: Boolean); cdecl;

var
  sfZipFile_Build: function(const AArchive, ADirectory: WideString; const APassword: WideString=sfZipFile_DefaultPassword; const ASender: Pointer=nil; const AHandler: sfZipFile_BuildProgressCallback=nil): Boolean; cdecl;

//=== INPUTSTREAM ===========================================================
var
  sfInputStream_Read: function(const AInputStream: PsfInputStream; const AData: Pointer; const ASize: Int64): Int64; cdecl;
  sfInputStream_Seek: function(const AInputStream: PsfInputStream; const APosition: Int64): Int64; cdecl;
  sfInputStream_Tell: function(const AInputStream: PsfInputStream): Int64; cdecl;
  sfInputStream_GetSize: function(const AInputStream: PsfInputStream): Int64; cdecl;
  sfInputStream_EOF: function(const AInputStream: PsfInputStream): Boolean; cdecl;
  sfInputStream_Close: function(var AInputStream: PsfInputStream): Boolean; cdecl;
  sfInputStream_CreateFromFile: function(const AFilename: WideString): PsfInputStream; cdecl;
  sfInputStream_CreateFromMemory: function(const ABuffer: Pointer; const ASize: Int64): PsfInputStream; cdecl;
  sfInputStream_CreateFromZipFile: function(const AZipFilename, AFilename: WideString; const APassword: WideString=sfZipFile_DefaultPassword): PsfInputStream; cdecl;

//=== VIDEO =================================================================
type
  sfVideo_Status = (vsPlaying, vsStopped, vsPaused);
  sfVideo_StatusCallback = procedure(const ASender: Pointer; const AStatus: sfVideo_Status; const AFilename: WideString); cdecl;

var
  sfVideo_PlayFromStream: function(const AStream: PsfInputStream; const AVolume: Single; const ALoop: Boolean; const AName: WideString; const ASender: Pointer; const AHandler: sfVideo_StatusCallback): Boolean; cdecl;
  sfVideo_PlayFromFile: function(const AFilename: WideString; const AVolume: Single; const ALoop: Boolean; const ASender: Pointer=nil; const AHandler: sfVideo_StatusCallback=nil): Boolean; cdecl;
  sfVideo_PlayFromZipFile: function(const AZipFilename, AFilename: WideString; const AVolume: Single; const ALoop: Boolean; const ASender: Pointer=nil; const AHandler: sfVideo_StatusCallback=nil; const APassword: WideString=sfZipFile_DefaultPassword): Boolean; cdecl;
  sfVideo_Destroy: procedure(); cdecl;
  sfVideo_Update: function(const AWindow: PsfRenderWindow): sfVideo_Status; cdecl;
  sfVideo_Render: procedure(const AWindow: PsfRenderWindow; const X, Y, AScale: Single); cdecl;
  sfVideo_GetStatus: function(): sfVideo_Status; cdecl;
  sfVideo_IsLooping: function(): Boolean; cdecl;
  sfVideo_SetLooping: procedure(const ALoop: Boolean); cdecl;
  sfVideo_GetVolume: function(): Single; cdecl;
  sfVideo_SetVolume: procedure(const AVolume: Single); cdecl;

implementation

uses
  Windows,
  SysUtils,
  Classes,
  Math;

// === UTILS ================================================================
function Format(const AMsg: string; const AArgs: array of const): string;
begin
  {$IFDEF FPC}
  Result := SysUtils.UnicodeFormat(AMsg, AArgs);
  {$ELSE}
  Result := SysUtils.Format(AMsg, AArgs);
  {$ENDIF}
end;

//=== RENDERWINDOWS =========================================================
procedure sfRenderWindow_DrawTextXY(const AWindow: PsfRenderWindow; const AText: PsfText; const X, Y: Single; const AColor: sfColor; const AMsg: WideString; const AArgs: array of const); cdecl;
var
  LMsg: string;
begin
  LMsg := Format(AMsg, AArgs);

  sfRenderWindow_DrawTextEx(AWindow, AText, X, Y, AColor, LMsg);
end;

procedure sfRenderWindow_DrawTextXVarY(const AWindow: PsfRenderWindow; const AText: PsfText; const X: Single; var Y: Single; const AColor: sfColor; const AMsg: WideString; const AArgs: array of const); cdecl;
var
  LFont: PsfFont;
  LSize: Cardinal;
begin
  sfRenderWindow_DrawTextXY(AWindow, AText, X, Y, AColor, AMsg, AArgs);

  LFont := sfText_GetFont(AText);
  LSize := sfText_GetCharacterSize(AText);

  Y := Y + sfFont_GetLineSpacing(LFont, LSize);
end;


{$REGION ' DLL LOADER '}

{$R PSFML.res}

var
  DLLHandle: THandle = 0;
  DLLFilename: string = '';

function GetTempPathStr: string;
var
  LBuffer: string;
begin
  SetLength(LBuffer, 1024);
  GetTempPath(1024, PChar(LBuffer));
  Result := PChar(LBuffer);
end;

function GetGUIDFileName: string;
var
  LGUID: TGUID;
begin
  CreateGUID(LGUID);
  Result := GUIDToString(LGUID);
  Result := StringReplace(Result, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;

procedure GetExports(const aDLLHandle: THandle);
begin
  if aDllHandle = 0 then Exit;
  sfBuffer_create := GetProcAddress(aDLLHandle, 'sfBuffer_create');
  sfBuffer_destroy := GetProcAddress(aDLLHandle, 'sfBuffer_destroy');
  sfBuffer_getData := GetProcAddress(aDLLHandle, 'sfBuffer_getData');
  sfBuffer_getSize := GetProcAddress(aDLLHandle, 'sfBuffer_getSize');
  sfCircleShape_copy := GetProcAddress(aDLLHandle, 'sfCircleShape_copy');
  sfCircleShape_create := GetProcAddress(aDLLHandle, 'sfCircleShape_create');
  sfCircleShape_destroy := GetProcAddress(aDLLHandle, 'sfCircleShape_destroy');
  sfCircleShape_getFillColor := GetProcAddress(aDLLHandle, 'sfCircleShape_getFillColor');
  sfCircleShape_getGlobalBounds := GetProcAddress(aDLLHandle, 'sfCircleShape_getGlobalBounds');
  sfCircleShape_getInverseTransform := GetProcAddress(aDLLHandle, 'sfCircleShape_getInverseTransform');
  sfCircleShape_getLocalBounds := GetProcAddress(aDLLHandle, 'sfCircleShape_getLocalBounds');
  sfCircleShape_getOrigin := GetProcAddress(aDLLHandle, 'sfCircleShape_getOrigin');
  sfCircleShape_getOutlineColor := GetProcAddress(aDLLHandle, 'sfCircleShape_getOutlineColor');
  sfCircleShape_getOutlineThickness := GetProcAddress(aDLLHandle, 'sfCircleShape_getOutlineThickness');
  sfCircleShape_getPoint := GetProcAddress(aDLLHandle, 'sfCircleShape_getPoint');
  sfCircleShape_getPointCount := GetProcAddress(aDLLHandle, 'sfCircleShape_getPointCount');
  sfCircleShape_getPosition := GetProcAddress(aDLLHandle, 'sfCircleShape_getPosition');
  sfCircleShape_getRadius := GetProcAddress(aDLLHandle, 'sfCircleShape_getRadius');
  sfCircleShape_getRotation := GetProcAddress(aDLLHandle, 'sfCircleShape_getRotation');
  sfCircleShape_getScale := GetProcAddress(aDLLHandle, 'sfCircleShape_getScale');
  sfCircleShape_getTexture := GetProcAddress(aDLLHandle, 'sfCircleShape_getTexture');
  sfCircleShape_getTextureRect := GetProcAddress(aDLLHandle, 'sfCircleShape_getTextureRect');
  sfCircleShape_getTransform := GetProcAddress(aDLLHandle, 'sfCircleShape_getTransform');
  sfCircleShape_move := GetProcAddress(aDLLHandle, 'sfCircleShape_move');
  sfCircleShape_rotate := GetProcAddress(aDLLHandle, 'sfCircleShape_rotate');
  sfCircleShape_scale := GetProcAddress(aDLLHandle, 'sfCircleShape_scale');
  sfCircleShape_setFillColor := GetProcAddress(aDLLHandle, 'sfCircleShape_setFillColor');
  sfCircleShape_setOrigin := GetProcAddress(aDLLHandle, 'sfCircleShape_setOrigin');
  sfCircleShape_setOutlineColor := GetProcAddress(aDLLHandle, 'sfCircleShape_setOutlineColor');
  sfCircleShape_setOutlineThickness := GetProcAddress(aDLLHandle, 'sfCircleShape_setOutlineThickness');
  sfCircleShape_setPointCount := GetProcAddress(aDLLHandle, 'sfCircleShape_setPointCount');
  sfCircleShape_setPosition := GetProcAddress(aDLLHandle, 'sfCircleShape_setPosition');
  sfCircleShape_setRadius := GetProcAddress(aDLLHandle, 'sfCircleShape_setRadius');
  sfCircleShape_setRotation := GetProcAddress(aDLLHandle, 'sfCircleShape_setRotation');
  sfCircleShape_setScale := GetProcAddress(aDLLHandle, 'sfCircleShape_setScale');
  sfCircleShape_setTexture := GetProcAddress(aDLLHandle, 'sfCircleShape_setTexture');
  sfCircleShape_setTextureRect := GetProcAddress(aDLLHandle, 'sfCircleShape_setTextureRect');
  sfClipboard_getString := GetProcAddress(aDLLHandle, 'sfClipboard_getString');
  sfClipboard_getUnicodeString := GetProcAddress(aDLLHandle, 'sfClipboard_getUnicodeString');
  sfClipboard_setString := GetProcAddress(aDLLHandle, 'sfClipboard_setString');
  sfClipboard_setUnicodeString := GetProcAddress(aDLLHandle, 'sfClipboard_setUnicodeString');
  sfClock_copy := GetProcAddress(aDLLHandle, 'sfClock_copy');
  sfClock_create := GetProcAddress(aDLLHandle, 'sfClock_create');
  sfClock_destroy := GetProcAddress(aDLLHandle, 'sfClock_destroy');
  sfClock_getElapsedTime := GetProcAddress(aDLLHandle, 'sfClock_getElapsedTime');
  sfClock_restart := GetProcAddress(aDLLHandle, 'sfClock_restart');
  sfColor_add := GetProcAddress(aDLLHandle, 'sfColor_add');
  sfColor_fromInteger := GetProcAddress(aDLLHandle, 'sfColor_fromInteger');
  sfColor_fromRGB := GetProcAddress(aDLLHandle, 'sfColor_fromRGB');
  sfColor_fromRGBA := GetProcAddress(aDLLHandle, 'sfColor_fromRGBA');
  sfColor_modulate := GetProcAddress(aDLLHandle, 'sfColor_modulate');
  sfColor_subtract := GetProcAddress(aDLLHandle, 'sfColor_subtract');
  sfColor_toInteger := GetProcAddress(aDLLHandle, 'sfColor_toInteger');
  sfContext_create := GetProcAddress(aDLLHandle, 'sfContext_create');
  sfContext_destroy := GetProcAddress(aDLLHandle, 'sfContext_destroy');
  sfContext_getActiveContextId := GetProcAddress(aDLLHandle, 'sfContext_getActiveContextId');
  sfContext_getFunction := GetProcAddress(aDLLHandle, 'sfContext_getFunction');
  sfContext_getSettings := GetProcAddress(aDLLHandle, 'sfContext_getSettings');
  sfContext_isExtensionAvailable := GetProcAddress(aDLLHandle, 'sfContext_isExtensionAvailable');
  sfContext_setActive := GetProcAddress(aDLLHandle, 'sfContext_setActive');
  sfConvexShape_copy := GetProcAddress(aDLLHandle, 'sfConvexShape_copy');
  sfConvexShape_create := GetProcAddress(aDLLHandle, 'sfConvexShape_create');
  sfConvexShape_destroy := GetProcAddress(aDLLHandle, 'sfConvexShape_destroy');
  sfConvexShape_getFillColor := GetProcAddress(aDLLHandle, 'sfConvexShape_getFillColor');
  sfConvexShape_getGlobalBounds := GetProcAddress(aDLLHandle, 'sfConvexShape_getGlobalBounds');
  sfConvexShape_getInverseTransform := GetProcAddress(aDLLHandle, 'sfConvexShape_getInverseTransform');
  sfConvexShape_getLocalBounds := GetProcAddress(aDLLHandle, 'sfConvexShape_getLocalBounds');
  sfConvexShape_getOrigin := GetProcAddress(aDLLHandle, 'sfConvexShape_getOrigin');
  sfConvexShape_getOutlineColor := GetProcAddress(aDLLHandle, 'sfConvexShape_getOutlineColor');
  sfConvexShape_getOutlineThickness := GetProcAddress(aDLLHandle, 'sfConvexShape_getOutlineThickness');
  sfConvexShape_getPoint := GetProcAddress(aDLLHandle, 'sfConvexShape_getPoint');
  sfConvexShape_getPointCount := GetProcAddress(aDLLHandle, 'sfConvexShape_getPointCount');
  sfConvexShape_getPosition := GetProcAddress(aDLLHandle, 'sfConvexShape_getPosition');
  sfConvexShape_getRotation := GetProcAddress(aDLLHandle, 'sfConvexShape_getRotation');
  sfConvexShape_getScale := GetProcAddress(aDLLHandle, 'sfConvexShape_getScale');
  sfConvexShape_getTexture := GetProcAddress(aDLLHandle, 'sfConvexShape_getTexture');
  sfConvexShape_getTextureRect := GetProcAddress(aDLLHandle, 'sfConvexShape_getTextureRect');
  sfConvexShape_getTransform := GetProcAddress(aDLLHandle, 'sfConvexShape_getTransform');
  sfConvexShape_move := GetProcAddress(aDLLHandle, 'sfConvexShape_move');
  sfConvexShape_rotate := GetProcAddress(aDLLHandle, 'sfConvexShape_rotate');
  sfConvexShape_scale := GetProcAddress(aDLLHandle, 'sfConvexShape_scale');
  sfConvexShape_setFillColor := GetProcAddress(aDLLHandle, 'sfConvexShape_setFillColor');
  sfConvexShape_setOrigin := GetProcAddress(aDLLHandle, 'sfConvexShape_setOrigin');
  sfConvexShape_setOutlineColor := GetProcAddress(aDLLHandle, 'sfConvexShape_setOutlineColor');
  sfConvexShape_setOutlineThickness := GetProcAddress(aDLLHandle, 'sfConvexShape_setOutlineThickness');
  sfConvexShape_setPoint := GetProcAddress(aDLLHandle, 'sfConvexShape_setPoint');
  sfConvexShape_setPointCount := GetProcAddress(aDLLHandle, 'sfConvexShape_setPointCount');
  sfConvexShape_setPosition := GetProcAddress(aDLLHandle, 'sfConvexShape_setPosition');
  sfConvexShape_setRotation := GetProcAddress(aDLLHandle, 'sfConvexShape_setRotation');
  sfConvexShape_setScale := GetProcAddress(aDLLHandle, 'sfConvexShape_setScale');
  sfConvexShape_setTexture := GetProcAddress(aDLLHandle, 'sfConvexShape_setTexture');
  sfConvexShape_setTextureRect := GetProcAddress(aDLLHandle, 'sfConvexShape_setTextureRect');
  sfCursor_createFromPixels := GetProcAddress(aDLLHandle, 'sfCursor_createFromPixels');
  sfCursor_createFromSystem := GetProcAddress(aDLLHandle, 'sfCursor_createFromSystem');
  sfCursor_destroy := GetProcAddress(aDLLHandle, 'sfCursor_destroy');
  sfFloatRect_contains := GetProcAddress(aDLLHandle, 'sfFloatRect_contains');
  sfFloatRect_intersects := GetProcAddress(aDLLHandle, 'sfFloatRect_intersects');
  sfFont_copy := GetProcAddress(aDLLHandle, 'sfFont_copy');
  sfFont_createFromFile := GetProcAddress(aDLLHandle, 'sfFont_createFromFile');
  sfFont_createFromMemory := GetProcAddress(aDLLHandle, 'sfFont_createFromMemory');
  sfFont_createFromStream := GetProcAddress(aDLLHandle, 'sfFont_createFromStream');
  sfFont_destroy := GetProcAddress(aDLLHandle, 'sfFont_destroy');
  sfFont_getBoldKerning := GetProcAddress(aDLLHandle, 'sfFont_getBoldKerning');
  sfFont_getGlyph := GetProcAddress(aDLLHandle, 'sfFont_getGlyph');
  sfFont_getInfo := GetProcAddress(aDLLHandle, 'sfFont_getInfo');
  sfFont_getKerning := GetProcAddress(aDLLHandle, 'sfFont_getKerning');
  sfFont_getLineSpacing := GetProcAddress(aDLLHandle, 'sfFont_getLineSpacing');
  sfFont_getTexture := GetProcAddress(aDLLHandle, 'sfFont_getTexture');
  sfFont_getUnderlinePosition := GetProcAddress(aDLLHandle, 'sfFont_getUnderlinePosition');
  sfFont_getUnderlineThickness := GetProcAddress(aDLLHandle, 'sfFont_getUnderlineThickness');
  sfFont_hasGlyph := GetProcAddress(aDLLHandle, 'sfFont_hasGlyph');
  sfFont_isSmooth := GetProcAddress(aDLLHandle, 'sfFont_isSmooth');
  sfFont_setSmooth := GetProcAddress(aDLLHandle, 'sfFont_setSmooth');
  sfFtp_changeDirectory := GetProcAddress(aDLLHandle, 'sfFtp_changeDirectory');
  sfFtp_connect := GetProcAddress(aDLLHandle, 'sfFtp_connect');
  sfFtp_create := GetProcAddress(aDLLHandle, 'sfFtp_create');
  sfFtp_createDirectory := GetProcAddress(aDLLHandle, 'sfFtp_createDirectory');
  sfFtp_deleteDirectory := GetProcAddress(aDLLHandle, 'sfFtp_deleteDirectory');
  sfFtp_deleteFile := GetProcAddress(aDLLHandle, 'sfFtp_deleteFile');
  sfFtp_destroy := GetProcAddress(aDLLHandle, 'sfFtp_destroy');
  sfFtp_disconnect := GetProcAddress(aDLLHandle, 'sfFtp_disconnect');
  sfFtp_download := GetProcAddress(aDLLHandle, 'sfFtp_download');
  sfFtp_getDirectoryListing := GetProcAddress(aDLLHandle, 'sfFtp_getDirectoryListing');
  sfFtp_getWorkingDirectory := GetProcAddress(aDLLHandle, 'sfFtp_getWorkingDirectory');
  sfFtp_keepAlive := GetProcAddress(aDLLHandle, 'sfFtp_keepAlive');
  sfFtp_login := GetProcAddress(aDLLHandle, 'sfFtp_login');
  sfFtp_loginAnonymous := GetProcAddress(aDLLHandle, 'sfFtp_loginAnonymous');
  sfFtp_parentDirectory := GetProcAddress(aDLLHandle, 'sfFtp_parentDirectory');
  sfFtp_renameFile := GetProcAddress(aDLLHandle, 'sfFtp_renameFile');
  sfFtp_sendCommand := GetProcAddress(aDLLHandle, 'sfFtp_sendCommand');
  sfFtp_upload := GetProcAddress(aDLLHandle, 'sfFtp_upload');
  sfFtpDirectoryResponse_destroy := GetProcAddress(aDLLHandle, 'sfFtpDirectoryResponse_destroy');
  sfFtpDirectoryResponse_getDirectory := GetProcAddress(aDLLHandle, 'sfFtpDirectoryResponse_getDirectory');
  sfFtpDirectoryResponse_getDirectoryUnicode := GetProcAddress(aDLLHandle, 'sfFtpDirectoryResponse_getDirectoryUnicode');
  sfFtpDirectoryResponse_getMessage := GetProcAddress(aDLLHandle, 'sfFtpDirectoryResponse_getMessage');
  sfFtpDirectoryResponse_getStatus := GetProcAddress(aDLLHandle, 'sfFtpDirectoryResponse_getStatus');
  sfFtpDirectoryResponse_isOk := GetProcAddress(aDLLHandle, 'sfFtpDirectoryResponse_isOk');
  sfFtpListingResponse_destroy := GetProcAddress(aDLLHandle, 'sfFtpListingResponse_destroy');
  sfFtpListingResponse_getCount := GetProcAddress(aDLLHandle, 'sfFtpListingResponse_getCount');
  sfFtpListingResponse_getMessage := GetProcAddress(aDLLHandle, 'sfFtpListingResponse_getMessage');
  sfFtpListingResponse_getName := GetProcAddress(aDLLHandle, 'sfFtpListingResponse_getName');
  sfFtpListingResponse_getStatus := GetProcAddress(aDLLHandle, 'sfFtpListingResponse_getStatus');
  sfFtpListingResponse_isOk := GetProcAddress(aDLLHandle, 'sfFtpListingResponse_isOk');
  sfFtpResponse_destroy := GetProcAddress(aDLLHandle, 'sfFtpResponse_destroy');
  sfFtpResponse_getMessage := GetProcAddress(aDLLHandle, 'sfFtpResponse_getMessage');
  sfFtpResponse_getStatus := GetProcAddress(aDLLHandle, 'sfFtpResponse_getStatus');
  sfFtpResponse_isOk := GetProcAddress(aDLLHandle, 'sfFtpResponse_isOk');
  sfHttp_create := GetProcAddress(aDLLHandle, 'sfHttp_create');
  sfHttp_destroy := GetProcAddress(aDLLHandle, 'sfHttp_destroy');
  sfHttp_sendRequest := GetProcAddress(aDLLHandle, 'sfHttp_sendRequest');
  sfHttp_setHost := GetProcAddress(aDLLHandle, 'sfHttp_setHost');
  sfHttpRequest_create := GetProcAddress(aDLLHandle, 'sfHttpRequest_create');
  sfHttpRequest_destroy := GetProcAddress(aDLLHandle, 'sfHttpRequest_destroy');
  sfHttpRequest_setBody := GetProcAddress(aDLLHandle, 'sfHttpRequest_setBody');
  sfHttpRequest_setField := GetProcAddress(aDLLHandle, 'sfHttpRequest_setField');
  sfHttpRequest_setHttpVersion := GetProcAddress(aDLLHandle, 'sfHttpRequest_setHttpVersion');
  sfHttpRequest_setMethod := GetProcAddress(aDLLHandle, 'sfHttpRequest_setMethod');
  sfHttpRequest_setUri := GetProcAddress(aDLLHandle, 'sfHttpRequest_setUri');
  sfHttpResponse_destroy := GetProcAddress(aDLLHandle, 'sfHttpResponse_destroy');
  sfHttpResponse_getBody := GetProcAddress(aDLLHandle, 'sfHttpResponse_getBody');
  sfHttpResponse_getField := GetProcAddress(aDLLHandle, 'sfHttpResponse_getField');
  sfHttpResponse_getMajorVersion := GetProcAddress(aDLLHandle, 'sfHttpResponse_getMajorVersion');
  sfHttpResponse_getMinorVersion := GetProcAddress(aDLLHandle, 'sfHttpResponse_getMinorVersion');
  sfHttpResponse_getStatus := GetProcAddress(aDLLHandle, 'sfHttpResponse_getStatus');
  sfImage_copy := GetProcAddress(aDLLHandle, 'sfImage_copy');
  sfImage_copyImage := GetProcAddress(aDLLHandle, 'sfImage_copyImage');
  sfImage_create := GetProcAddress(aDLLHandle, 'sfImage_create');
  sfImage_createFromColor := GetProcAddress(aDLLHandle, 'sfImage_createFromColor');
  sfImage_createFromFile := GetProcAddress(aDLLHandle, 'sfImage_createFromFile');
  sfImage_createFromMemory := GetProcAddress(aDLLHandle, 'sfImage_createFromMemory');
  sfImage_createFromPixels := GetProcAddress(aDLLHandle, 'sfImage_createFromPixels');
  sfImage_createFromStream := GetProcAddress(aDLLHandle, 'sfImage_createFromStream');
  sfImage_createMaskFromColor := GetProcAddress(aDLLHandle, 'sfImage_createMaskFromColor');
  sfImage_destroy := GetProcAddress(aDLLHandle, 'sfImage_destroy');
  sfImage_flipHorizontally := GetProcAddress(aDLLHandle, 'sfImage_flipHorizontally');
  sfImage_flipVertically := GetProcAddress(aDLLHandle, 'sfImage_flipVertically');
  sfImage_getPixel := GetProcAddress(aDLLHandle, 'sfImage_getPixel');
  sfImage_getPixelsPtr := GetProcAddress(aDLLHandle, 'sfImage_getPixelsPtr');
  sfImage_getSize := GetProcAddress(aDLLHandle, 'sfImage_getSize');
  sfImage_saveToFile := GetProcAddress(aDLLHandle, 'sfImage_saveToFile');
  sfImage_saveToMemory := GetProcAddress(aDLLHandle, 'sfImage_saveToMemory');
  sfImage_setPixel := GetProcAddress(aDLLHandle, 'sfImage_setPixel');
  sfIntRect_contains := GetProcAddress(aDLLHandle, 'sfIntRect_contains');
  sfIntRect_intersects := GetProcAddress(aDLLHandle, 'sfIntRect_intersects');
  sfIpAddress_fromBytes := GetProcAddress(aDLLHandle, 'sfIpAddress_fromBytes');
  sfIpAddress_fromInteger := GetProcAddress(aDLLHandle, 'sfIpAddress_fromInteger');
  sfIpAddress_fromString := GetProcAddress(aDLLHandle, 'sfIpAddress_fromString');
  sfIpAddress_getLocalAddress := GetProcAddress(aDLLHandle, 'sfIpAddress_getLocalAddress');
  sfIpAddress_getPublicAddress := GetProcAddress(aDLLHandle, 'sfIpAddress_getPublicAddress');
  sfIpAddress_toInteger := GetProcAddress(aDLLHandle, 'sfIpAddress_toInteger');
  sfIpAddress_toString := GetProcAddress(aDLLHandle, 'sfIpAddress_toString');
  sfJoystick_getAxisPosition := GetProcAddress(aDLLHandle, 'sfJoystick_getAxisPosition');
  sfJoystick_getButtonCount := GetProcAddress(aDLLHandle, 'sfJoystick_getButtonCount');
  sfJoystick_getIdentification := GetProcAddress(aDLLHandle, 'sfJoystick_getIdentification');
  sfJoystick_hasAxis := GetProcAddress(aDLLHandle, 'sfJoystick_hasAxis');
  sfJoystick_isButtonPressed := GetProcAddress(aDLLHandle, 'sfJoystick_isButtonPressed');
  sfJoystick_isConnected := GetProcAddress(aDLLHandle, 'sfJoystick_isConnected');
  sfJoystick_update := GetProcAddress(aDLLHandle, 'sfJoystick_update');
  sfKeyboard_delocalize := GetProcAddress(aDLLHandle, 'sfKeyboard_delocalize');
  sfKeyboard_getDescription := GetProcAddress(aDLLHandle, 'sfKeyboard_getDescription');
  sfKeyboard_isKeyPressed := GetProcAddress(aDLLHandle, 'sfKeyboard_isKeyPressed');
  sfKeyboard_isScancodePressed := GetProcAddress(aDLLHandle, 'sfKeyboard_isScancodePressed');
  sfKeyboard_localize := GetProcAddress(aDLLHandle, 'sfKeyboard_localize');
  sfKeyboard_setVirtualKeyboardVisible := GetProcAddress(aDLLHandle, 'sfKeyboard_setVirtualKeyboardVisible');
  sfListener_GetDirection := GetProcAddress(aDLLHandle, 'sfListener_getDirection');
  sfListener_GetGlobalVolume := GetProcAddress(aDLLHandle, 'sfListener_getGlobalVolume');
  sfListener_GetPosition := GetProcAddress(aDLLHandle, 'sfListener_getPosition');
  sfListener_GetUpVector := GetProcAddress(aDLLHandle, 'sfListener_getUpVector');
  sfListener_SetDirection := GetProcAddress(aDLLHandle, 'sfListener_setDirection');
  sfListener_SetGlobalVolume := GetProcAddress(aDLLHandle, 'sfListener_setGlobalVolume');
  sfListener_SetPosition := GetProcAddress(aDLLHandle, 'sfListener_setPosition');
  sfListener_SetUpVector := GetProcAddress(aDLLHandle, 'sfListener_setUpVector');
  sfMicroseconds := GetProcAddress(aDLLHandle, 'sfMicroseconds');
  sfMilliseconds := GetProcAddress(aDLLHandle, 'sfMilliseconds');
  sfMouse_getPosition := GetProcAddress(aDLLHandle, 'sfMouse_getPosition');
  sfMouse_getPositionRenderWindow := GetProcAddress(aDLLHandle, 'sfMouse_getPositionRenderWindow');
  sfMouse_getPositionWindowBase := GetProcAddress(aDLLHandle, 'sfMouse_getPositionWindowBase');
  sfMouse_isButtonPressed := GetProcAddress(aDLLHandle, 'sfMouse_isButtonPressed');
  sfMouse_setPosition := GetProcAddress(aDLLHandle, 'sfMouse_setPosition');
  sfMouse_setPositionRenderWindow := GetProcAddress(aDLLHandle, 'sfMouse_setPositionRenderWindow');
  sfMouse_setPositionWindowBase := GetProcAddress(aDLLHandle, 'sfMouse_setPositionWindowBase');
  sfMusic_CreateFromFile := GetProcAddress(aDLLHandle, 'sfMusic_createFromFile');
  sfMusic_CreateFromMemory := GetProcAddress(aDLLHandle, 'sfMusic_createFromMemory');
  sfMusic_CreateFromStream := GetProcAddress(aDLLHandle, 'sfMusic_createFromStream');
  sfMusic_Destroy := GetProcAddress(aDLLHandle, 'sfMusic_destroy');
  sfMusic_getAttenuation := GetProcAddress(aDLLHandle, 'sfMusic_getAttenuation');
  sfMusic_getChannelCount := GetProcAddress(aDLLHandle, 'sfMusic_getChannelCount');
  sfMusic_getDuration := GetProcAddress(aDLLHandle, 'sfMusic_getDuration');
  sfMusic_getLoopPoints := GetProcAddress(aDLLHandle, 'sfMusic_getLoopPoints');
  sfMusic_getMinDistance := GetProcAddress(aDLLHandle, 'sfMusic_getMinDistance');
  sfMusic_getPitch := GetProcAddress(aDLLHandle, 'sfMusic_getPitch');
  sfMusic_getPlayingOffset := GetProcAddress(aDLLHandle, 'sfMusic_getPlayingOffset');
  sfMusic_getPosition := GetProcAddress(aDLLHandle, 'sfMusic_getPosition');
  sfMusic_getSampleRate := GetProcAddress(aDLLHandle, 'sfMusic_getSampleRate');
  sfMusic_getStatus := GetProcAddress(aDLLHandle, 'sfMusic_getStatus');
  sfMusic_getVolume := GetProcAddress(aDLLHandle, 'sfMusic_getVolume');
  sfMusic_IsLooping := GetProcAddress(aDLLHandle, 'sfMusic_isLooping');
  sfMusic_isRelativeToListener := GetProcAddress(aDLLHandle, 'sfMusic_isRelativeToListener');
  sfMusic_pause := GetProcAddress(aDLLHandle, 'sfMusic_pause');
  sfMusic_play := GetProcAddress(aDLLHandle, 'sfMusic_play');
  sfMusic_setAttenuation := GetProcAddress(aDLLHandle, 'sfMusic_setAttenuation');
  sfMusic_SetLooping := GetProcAddress(aDLLHandle, 'sfMusic_setLooping');
  sfMusic_setLoopPoints := GetProcAddress(aDLLHandle, 'sfMusic_setLoopPoints');
  sfMusic_setMinDistance := GetProcAddress(aDLLHandle, 'sfMusic_setMinDistance');
  sfMusic_setPitch := GetProcAddress(aDLLHandle, 'sfMusic_setPitch');
  sfMusic_setPlayingOffset := GetProcAddress(aDLLHandle, 'sfMusic_setPlayingOffset');
  sfMusic_setPosition := GetProcAddress(aDLLHandle, 'sfMusic_setPosition');
  sfMusic_setRelativeToListener := GetProcAddress(aDLLHandle, 'sfMusic_setRelativeToListener');
  sfMusic_setVolume := GetProcAddress(aDLLHandle, 'sfMusic_setVolume');
  sfMusic_stop := GetProcAddress(aDLLHandle, 'sfMusic_stop');
  sfPacket_append := GetProcAddress(aDLLHandle, 'sfPacket_append');
  sfPacket_canRead := GetProcAddress(aDLLHandle, 'sfPacket_canRead');
  sfPacket_clear := GetProcAddress(aDLLHandle, 'sfPacket_clear');
  sfPacket_copy := GetProcAddress(aDLLHandle, 'sfPacket_copy');
  sfPacket_create := GetProcAddress(aDLLHandle, 'sfPacket_create');
  sfPacket_destroy := GetProcAddress(aDLLHandle, 'sfPacket_destroy');
  sfPacket_endOfPacket := GetProcAddress(aDLLHandle, 'sfPacket_endOfPacket');
  sfPacket_getData := GetProcAddress(aDLLHandle, 'sfPacket_getData');
  sfPacket_getDataSize := GetProcAddress(aDLLHandle, 'sfPacket_getDataSize');
  sfPacket_getReadPosition := GetProcAddress(aDLLHandle, 'sfPacket_getReadPosition');
  sfPacket_readBool := GetProcAddress(aDLLHandle, 'sfPacket_readBool');
  sfPacket_readDouble := GetProcAddress(aDLLHandle, 'sfPacket_readDouble');
  sfPacket_readFloat := GetProcAddress(aDLLHandle, 'sfPacket_readFloat');
  sfPacket_readInt16 := GetProcAddress(aDLLHandle, 'sfPacket_readInt16');
  sfPacket_readInt32 := GetProcAddress(aDLLHandle, 'sfPacket_readInt32');
  sfPacket_readInt8 := GetProcAddress(aDLLHandle, 'sfPacket_readInt8');
  sfPacket_readString := GetProcAddress(aDLLHandle, 'sfPacket_readString');
  sfPacket_readUint16 := GetProcAddress(aDLLHandle, 'sfPacket_readUint16');
  sfPacket_readUint32 := GetProcAddress(aDLLHandle, 'sfPacket_readUint32');
  sfPacket_readUint8 := GetProcAddress(aDLLHandle, 'sfPacket_readUint8');
  sfPacket_readWideString := GetProcAddress(aDLLHandle, 'sfPacket_readWideString');
  sfPacket_writeBool := GetProcAddress(aDLLHandle, 'sfPacket_writeBool');
  sfPacket_writeDouble := GetProcAddress(aDLLHandle, 'sfPacket_writeDouble');
  sfPacket_writeFloat := GetProcAddress(aDLLHandle, 'sfPacket_writeFloat');
  sfPacket_writeInt16 := GetProcAddress(aDLLHandle, 'sfPacket_writeInt16');
  sfPacket_writeInt32 := GetProcAddress(aDLLHandle, 'sfPacket_writeInt32');
  sfPacket_writeInt8 := GetProcAddress(aDLLHandle, 'sfPacket_writeInt8');
  sfPacket_writeString := GetProcAddress(aDLLHandle, 'sfPacket_writeString');
  sfPacket_writeUint16 := GetProcAddress(aDLLHandle, 'sfPacket_writeUint16');
  sfPacket_writeUint32 := GetProcAddress(aDLLHandle, 'sfPacket_writeUint32');
  sfPacket_writeUint8 := GetProcAddress(aDLLHandle, 'sfPacket_writeUint8');
  sfPacket_writeWideString := GetProcAddress(aDLLHandle, 'sfPacket_writeWideString');
  sfRectangleShape_copy := GetProcAddress(aDLLHandle, 'sfRectangleShape_copy');
  sfRectangleShape_create := GetProcAddress(aDLLHandle, 'sfRectangleShape_create');
  sfRectangleShape_destroy := GetProcAddress(aDLLHandle, 'sfRectangleShape_destroy');
  sfRectangleShape_getFillColor := GetProcAddress(aDLLHandle, 'sfRectangleShape_getFillColor');
  sfRectangleShape_getGlobalBounds := GetProcAddress(aDLLHandle, 'sfRectangleShape_getGlobalBounds');
  sfRectangleShape_getInverseTransform := GetProcAddress(aDLLHandle, 'sfRectangleShape_getInverseTransform');
  sfRectangleShape_getLocalBounds := GetProcAddress(aDLLHandle, 'sfRectangleShape_getLocalBounds');
  sfRectangleShape_getOrigin := GetProcAddress(aDLLHandle, 'sfRectangleShape_getOrigin');
  sfRectangleShape_getOutlineColor := GetProcAddress(aDLLHandle, 'sfRectangleShape_getOutlineColor');
  sfRectangleShape_getOutlineThickness := GetProcAddress(aDLLHandle, 'sfRectangleShape_getOutlineThickness');
  sfRectangleShape_getPoint := GetProcAddress(aDLLHandle, 'sfRectangleShape_getPoint');
  sfRectangleShape_getPointCount := GetProcAddress(aDLLHandle, 'sfRectangleShape_getPointCount');
  sfRectangleShape_getPosition := GetProcAddress(aDLLHandle, 'sfRectangleShape_getPosition');
  sfRectangleShape_getRotation := GetProcAddress(aDLLHandle, 'sfRectangleShape_getRotation');
  sfRectangleShape_getScale := GetProcAddress(aDLLHandle, 'sfRectangleShape_getScale');
  sfRectangleShape_getSize := GetProcAddress(aDLLHandle, 'sfRectangleShape_getSize');
  sfRectangleShape_getTexture := GetProcAddress(aDLLHandle, 'sfRectangleShape_getTexture');
  sfRectangleShape_getTextureRect := GetProcAddress(aDLLHandle, 'sfRectangleShape_getTextureRect');
  sfRectangleShape_getTransform := GetProcAddress(aDLLHandle, 'sfRectangleShape_getTransform');
  sfRectangleShape_move := GetProcAddress(aDLLHandle, 'sfRectangleShape_move');
  sfRectangleShape_rotate := GetProcAddress(aDLLHandle, 'sfRectangleShape_rotate');
  sfRectangleShape_scale := GetProcAddress(aDLLHandle, 'sfRectangleShape_scale');
  sfRectangleShape_setFillColor := GetProcAddress(aDLLHandle, 'sfRectangleShape_setFillColor');
  sfRectangleShape_setOrigin := GetProcAddress(aDLLHandle, 'sfRectangleShape_setOrigin');
  sfRectangleShape_setOutlineColor := GetProcAddress(aDLLHandle, 'sfRectangleShape_setOutlineColor');
  sfRectangleShape_setOutlineThickness := GetProcAddress(aDLLHandle, 'sfRectangleShape_setOutlineThickness');
  sfRectangleShape_setPosition := GetProcAddress(aDLLHandle, 'sfRectangleShape_setPosition');
  sfRectangleShape_setRotation := GetProcAddress(aDLLHandle, 'sfRectangleShape_setRotation');
  sfRectangleShape_setScale := GetProcAddress(aDLLHandle, 'sfRectangleShape_setScale');
  sfRectangleShape_setSize := GetProcAddress(aDLLHandle, 'sfRectangleShape_setSize');
  sfRectangleShape_setTexture := GetProcAddress(aDLLHandle, 'sfRectangleShape_setTexture');
  sfRectangleShape_setTextureRect := GetProcAddress(aDLLHandle, 'sfRectangleShape_setTextureRect');
  sfRenderStates_default := GetProcAddress(aDLLHandle, 'sfRenderStates_default');
  sfRenderTexture_clear := GetProcAddress(aDLLHandle, 'sfRenderTexture_clear');
  sfRenderTexture_create := GetProcAddress(aDLLHandle, 'sfRenderTexture_create');
  sfRenderTexture_destroy := GetProcAddress(aDLLHandle, 'sfRenderTexture_destroy');
  sfRenderTexture_display := GetProcAddress(aDLLHandle, 'sfRenderTexture_display');
  sfRenderTexture_drawCircleShape := GetProcAddress(aDLLHandle, 'sfRenderTexture_drawCircleShape');
  sfRenderTexture_drawConvexShape := GetProcAddress(aDLLHandle, 'sfRenderTexture_drawConvexShape');
  sfRenderTexture_drawPrimitives := GetProcAddress(aDLLHandle, 'sfRenderTexture_drawPrimitives');
  sfRenderTexture_drawRectangleShape := GetProcAddress(aDLLHandle, 'sfRenderTexture_drawRectangleShape');
  sfRenderTexture_drawShape := GetProcAddress(aDLLHandle, 'sfRenderTexture_drawShape');
  sfRenderTexture_drawSprite := GetProcAddress(aDLLHandle, 'sfRenderTexture_drawSprite');
  sfRenderTexture_drawText := GetProcAddress(aDLLHandle, 'sfRenderTexture_drawText');
  sfRenderTexture_drawVertexArray := GetProcAddress(aDLLHandle, 'sfRenderTexture_drawVertexArray');
  sfRenderTexture_drawVertexBuffer := GetProcAddress(aDLLHandle, 'sfRenderTexture_drawVertexBuffer');
  sfRenderTexture_drawVertexBufferRange := GetProcAddress(aDLLHandle, 'sfRenderTexture_drawVertexBufferRange');
  sfRenderTexture_generateMipmap := GetProcAddress(aDLLHandle, 'sfRenderTexture_generateMipmap');
  sfRenderTexture_getDefaultView := GetProcAddress(aDLLHandle, 'sfRenderTexture_getDefaultView');
  sfRenderTexture_getMaximumAntiAliasingLevel := GetProcAddress(aDLLHandle, 'sfRenderTexture_getMaximumAntiAliasingLevel');
  sfRenderTexture_getSize := GetProcAddress(aDLLHandle, 'sfRenderTexture_getSize');
  sfRenderTexture_getTexture := GetProcAddress(aDLLHandle, 'sfRenderTexture_getTexture');
  sfRenderTexture_getView := GetProcAddress(aDLLHandle, 'sfRenderTexture_getView');
  sfRenderTexture_getViewport := GetProcAddress(aDLLHandle, 'sfRenderTexture_getViewport');
  sfRenderTexture_isRepeated := GetProcAddress(aDLLHandle, 'sfRenderTexture_isRepeated');
  sfRenderTexture_isSmooth := GetProcAddress(aDLLHandle, 'sfRenderTexture_isSmooth');
  sfRenderTexture_isSrgb := GetProcAddress(aDLLHandle, 'sfRenderTexture_isSrgb');
  sfRenderTexture_mapCoordsToPixel := GetProcAddress(aDLLHandle, 'sfRenderTexture_mapCoordsToPixel');
  sfRenderTexture_mapPixelToCoords := GetProcAddress(aDLLHandle, 'sfRenderTexture_mapPixelToCoords');
  sfRenderTexture_popGLStates := GetProcAddress(aDLLHandle, 'sfRenderTexture_popGLStates');
  sfRenderTexture_pushGLStates := GetProcAddress(aDLLHandle, 'sfRenderTexture_pushGLStates');
  sfRenderTexture_resetGLStates := GetProcAddress(aDLLHandle, 'sfRenderTexture_resetGLStates');
  sfRenderTexture_setActive := GetProcAddress(aDLLHandle, 'sfRenderTexture_setActive');
  sfRenderTexture_setRepeated := GetProcAddress(aDLLHandle, 'sfRenderTexture_setRepeated');
  sfRenderTexture_setSmooth := GetProcAddress(aDLLHandle, 'sfRenderTexture_setSmooth');
  sfRenderTexture_setView := GetProcAddress(aDLLHandle, 'sfRenderTexture_setView');
  sfRenderWindow_clear := GetProcAddress(aDLLHandle, 'sfRenderWindow_clear');
  sfRenderWindow_close := GetProcAddress(aDLLHandle, 'sfRenderWindow_close');
  sfRenderWindow_create := GetProcAddress(aDLLHandle, 'sfRenderWindow_create');
  sfRenderWindow_createFromHandle := GetProcAddress(aDLLHandle, 'sfRenderWindow_createFromHandle');
  sfRenderWindow_createUnicode := GetProcAddress(aDLLHandle, 'sfRenderWindow_createUnicode');
  sfRenderWindow_createVulkanSurface := GetProcAddress(aDLLHandle, 'sfRenderWindow_createVulkanSurface');
  sfRenderWindow_destroy := GetProcAddress(aDLLHandle, 'sfRenderWindow_destroy');
  sfRenderWindow_display := GetProcAddress(aDLLHandle, 'sfRenderWindow_display');
  sfRenderWindow_drawCircleShape := GetProcAddress(aDLLHandle, 'sfRenderWindow_drawCircleShape');
  sfRenderWindow_drawConvexShape := GetProcAddress(aDLLHandle, 'sfRenderWindow_drawConvexShape');
  sfRenderWindow_drawPrimitives := GetProcAddress(aDLLHandle, 'sfRenderWindow_drawPrimitives');
  sfRenderWindow_drawRectangleShape := GetProcAddress(aDLLHandle, 'sfRenderWindow_drawRectangleShape');
  sfRenderWindow_drawShape := GetProcAddress(aDLLHandle, 'sfRenderWindow_drawShape');
  sfRenderWindow_drawSprite := GetProcAddress(aDLLHandle, 'sfRenderWindow_drawSprite');
  sfRenderWindow_drawText := GetProcAddress(aDLLHandle, 'sfRenderWindow_drawText');
  sfRenderWindow_drawVertexArray := GetProcAddress(aDLLHandle, 'sfRenderWindow_drawVertexArray');
  sfRenderWindow_drawVertexBuffer := GetProcAddress(aDLLHandle, 'sfRenderWindow_drawVertexBuffer');
  sfRenderWindow_drawVertexBufferRange := GetProcAddress(aDLLHandle, 'sfRenderWindow_drawVertexBufferRange');
  sfRenderWindow_getDefaultView := GetProcAddress(aDLLHandle, 'sfRenderWindow_getDefaultView');
  sfRenderWindow_getNativeHandle := GetProcAddress(aDLLHandle, 'sfRenderWindow_getNativeHandle');
  sfRenderWindow_getPosition := GetProcAddress(aDLLHandle, 'sfRenderWindow_getPosition');
  sfRenderWindow_getSettings := GetProcAddress(aDLLHandle, 'sfRenderWindow_getSettings');
  sfRenderWindow_getSize := GetProcAddress(aDLLHandle, 'sfRenderWindow_getSize');
  sfRenderWindow_getView := GetProcAddress(aDLLHandle, 'sfRenderWindow_getView');
  sfRenderWindow_getViewport := GetProcAddress(aDLLHandle, 'sfRenderWindow_getViewport');
  sfRenderWindow_hasFocus := GetProcAddress(aDLLHandle, 'sfRenderWindow_hasFocus');
  sfRenderWindow_isOpen := GetProcAddress(aDLLHandle, 'sfRenderWindow_isOpen');
  sfRenderWindow_isSrgb := GetProcAddress(aDLLHandle, 'sfRenderWindow_isSrgb');
  sfRenderWindow_mapCoordsToPixel := GetProcAddress(aDLLHandle, 'sfRenderWindow_mapCoordsToPixel');
  sfRenderWindow_mapPixelToCoords := GetProcAddress(aDLLHandle, 'sfRenderWindow_mapPixelToCoords');
  sfRenderWindow_pollEvent := GetProcAddress(aDLLHandle, 'sfRenderWindow_pollEvent');
  sfRenderWindow_popGLStates := GetProcAddress(aDLLHandle, 'sfRenderWindow_popGLStates');
  sfRenderWindow_pushGLStates := GetProcAddress(aDLLHandle, 'sfRenderWindow_pushGLStates');
  sfRenderWindow_requestFocus := GetProcAddress(aDLLHandle, 'sfRenderWindow_requestFocus');
  sfRenderWindow_resetGLStates := GetProcAddress(aDLLHandle, 'sfRenderWindow_resetGLStates');
  sfRenderWindow_setActive := GetProcAddress(aDLLHandle, 'sfRenderWindow_setActive');
  sfRenderWindow_setFramerateLimit := GetProcAddress(aDLLHandle, 'sfRenderWindow_setFramerateLimit');
  sfRenderWindow_setIcon := GetProcAddress(aDLLHandle, 'sfRenderWindow_setIcon');
  sfRenderWindow_setJoystickThreshold := GetProcAddress(aDLLHandle, 'sfRenderWindow_setJoystickThreshold');
  sfRenderWindow_setKeyRepeatEnabled := GetProcAddress(aDLLHandle, 'sfRenderWindow_setKeyRepeatEnabled');
  sfRenderWindow_setMouseCursor := GetProcAddress(aDLLHandle, 'sfRenderWindow_setMouseCursor');
  sfRenderWindow_setMouseCursorGrabbed := GetProcAddress(aDLLHandle, 'sfRenderWindow_setMouseCursorGrabbed');
  sfRenderWindow_setMouseCursorVisible := GetProcAddress(aDLLHandle, 'sfRenderWindow_setMouseCursorVisible');
  sfRenderWindow_setPosition := GetProcAddress(aDLLHandle, 'sfRenderWindow_setPosition');
  sfRenderWindow_setSize := GetProcAddress(aDLLHandle, 'sfRenderWindow_setSize');
  sfRenderWindow_setTitle := GetProcAddress(aDLLHandle, 'sfRenderWindow_setTitle');
  sfRenderWindow_setUnicodeTitle := GetProcAddress(aDLLHandle, 'sfRenderWindow_setUnicodeTitle');
  sfRenderWindow_setVerticalSyncEnabled := GetProcAddress(aDLLHandle, 'sfRenderWindow_setVerticalSyncEnabled');
  sfRenderWindow_setView := GetProcAddress(aDLLHandle, 'sfRenderWindow_setView');
  sfRenderWindow_setVisible := GetProcAddress(aDLLHandle, 'sfRenderWindow_setVisible');
  sfRenderWindow_waitEvent := GetProcAddress(aDLLHandle, 'sfRenderWindow_waitEvent');
  sfSeconds := GetProcAddress(aDLLHandle, 'sfSeconds');
  sfSensor_getValue := GetProcAddress(aDLLHandle, 'sfSensor_getValue');
  sfSensor_isAvailable := GetProcAddress(aDLLHandle, 'sfSensor_isAvailable');
  sfSensor_setEnabled := GetProcAddress(aDLLHandle, 'sfSensor_setEnabled');
  sfShader_bind := GetProcAddress(aDLLHandle, 'sfShader_bind');
  sfShader_createFromFile := GetProcAddress(aDLLHandle, 'sfShader_createFromFile');
  sfShader_createFromMemory := GetProcAddress(aDLLHandle, 'sfShader_createFromMemory');
  sfShader_createFromStream := GetProcAddress(aDLLHandle, 'sfShader_createFromStream');
  sfShader_destroy := GetProcAddress(aDLLHandle, 'sfShader_destroy');
  sfShader_getNativeHandle := GetProcAddress(aDLLHandle, 'sfShader_getNativeHandle');
  sfShader_isAvailable := GetProcAddress(aDLLHandle, 'sfShader_isAvailable');
  sfShader_isGeometryAvailable := GetProcAddress(aDLLHandle, 'sfShader_isGeometryAvailable');
  sfShader_setBoolUniform := GetProcAddress(aDLLHandle, 'sfShader_setBoolUniform');
  sfShader_setBvec2Uniform := GetProcAddress(aDLLHandle, 'sfShader_setBvec2Uniform');
  sfShader_setBvec3Uniform := GetProcAddress(aDLLHandle, 'sfShader_setBvec3Uniform');
  sfShader_setBvec4Uniform := GetProcAddress(aDLLHandle, 'sfShader_setBvec4Uniform');
  sfShader_setColorUniform := GetProcAddress(aDLLHandle, 'sfShader_setColorUniform');
  sfShader_setCurrentTextureUniform := GetProcAddress(aDLLHandle, 'sfShader_setCurrentTextureUniform');
  sfShader_setFloatUniform := GetProcAddress(aDLLHandle, 'sfShader_setFloatUniform');
  sfShader_setFloatUniformArray := GetProcAddress(aDLLHandle, 'sfShader_setFloatUniformArray');
  sfShader_setIntColorUniform := GetProcAddress(aDLLHandle, 'sfShader_setIntColorUniform');
  sfShader_setIntUniform := GetProcAddress(aDLLHandle, 'sfShader_setIntUniform');
  sfShader_setIvec2Uniform := GetProcAddress(aDLLHandle, 'sfShader_setIvec2Uniform');
  sfShader_setIvec3Uniform := GetProcAddress(aDLLHandle, 'sfShader_setIvec3Uniform');
  sfShader_setIvec4Uniform := GetProcAddress(aDLLHandle, 'sfShader_setIvec4Uniform');
  sfShader_setMat3Uniform := GetProcAddress(aDLLHandle, 'sfShader_setMat3Uniform');
  sfShader_setMat3UniformArray := GetProcAddress(aDLLHandle, 'sfShader_setMat3UniformArray');
  sfShader_setMat4Uniform := GetProcAddress(aDLLHandle, 'sfShader_setMat4Uniform');
  sfShader_setMat4UniformArray := GetProcAddress(aDLLHandle, 'sfShader_setMat4UniformArray');
  sfShader_setTextureUniform := GetProcAddress(aDLLHandle, 'sfShader_setTextureUniform');
  sfShader_setVec2Uniform := GetProcAddress(aDLLHandle, 'sfShader_setVec2Uniform');
  sfShader_setVec2UniformArray := GetProcAddress(aDLLHandle, 'sfShader_setVec2UniformArray');
  sfShader_setVec3Uniform := GetProcAddress(aDLLHandle, 'sfShader_setVec3Uniform');
  sfShader_setVec3UniformArray := GetProcAddress(aDLLHandle, 'sfShader_setVec3UniformArray');
  sfShader_setVec4Uniform := GetProcAddress(aDLLHandle, 'sfShader_setVec4Uniform');
  sfShader_setVec4UniformArray := GetProcAddress(aDLLHandle, 'sfShader_setVec4UniformArray');
  sfShape_create := GetProcAddress(aDLLHandle, 'sfShape_create');
  sfShape_destroy := GetProcAddress(aDLLHandle, 'sfShape_destroy');
  sfShape_getFillColor := GetProcAddress(aDLLHandle, 'sfShape_getFillColor');
  sfShape_getGlobalBounds := GetProcAddress(aDLLHandle, 'sfShape_getGlobalBounds');
  sfShape_getInverseTransform := GetProcAddress(aDLLHandle, 'sfShape_getInverseTransform');
  sfShape_getLocalBounds := GetProcAddress(aDLLHandle, 'sfShape_getLocalBounds');
  sfShape_getOrigin := GetProcAddress(aDLLHandle, 'sfShape_getOrigin');
  sfShape_getOutlineColor := GetProcAddress(aDLLHandle, 'sfShape_getOutlineColor');
  sfShape_getOutlineThickness := GetProcAddress(aDLLHandle, 'sfShape_getOutlineThickness');
  sfShape_getPoint := GetProcAddress(aDLLHandle, 'sfShape_getPoint');
  sfShape_getPointCount := GetProcAddress(aDLLHandle, 'sfShape_getPointCount');
  sfShape_getPosition := GetProcAddress(aDLLHandle, 'sfShape_getPosition');
  sfShape_getRotation := GetProcAddress(aDLLHandle, 'sfShape_getRotation');
  sfShape_getScale := GetProcAddress(aDLLHandle, 'sfShape_getScale');
  sfShape_getTexture := GetProcAddress(aDLLHandle, 'sfShape_getTexture');
  sfShape_getTextureRect := GetProcAddress(aDLLHandle, 'sfShape_getTextureRect');
  sfShape_getTransform := GetProcAddress(aDLLHandle, 'sfShape_getTransform');
  sfShape_move := GetProcAddress(aDLLHandle, 'sfShape_move');
  sfShape_rotate := GetProcAddress(aDLLHandle, 'sfShape_rotate');
  sfShape_scale := GetProcAddress(aDLLHandle, 'sfShape_scale');
  sfShape_setFillColor := GetProcAddress(aDLLHandle, 'sfShape_setFillColor');
  sfShape_setOrigin := GetProcAddress(aDLLHandle, 'sfShape_setOrigin');
  sfShape_setOutlineColor := GetProcAddress(aDLLHandle, 'sfShape_setOutlineColor');
  sfShape_setOutlineThickness := GetProcAddress(aDLLHandle, 'sfShape_setOutlineThickness');
  sfShape_setPosition := GetProcAddress(aDLLHandle, 'sfShape_setPosition');
  sfShape_setRotation := GetProcAddress(aDLLHandle, 'sfShape_setRotation');
  sfShape_setScale := GetProcAddress(aDLLHandle, 'sfShape_setScale');
  sfShape_setTexture := GetProcAddress(aDLLHandle, 'sfShape_setTexture');
  sfShape_setTextureRect := GetProcAddress(aDLLHandle, 'sfShape_setTextureRect');
  sfShape_update := GetProcAddress(aDLLHandle, 'sfShape_update');
  sfSleep := GetProcAddress(aDLLHandle, 'sfSleep');
  sfSocketSelector_addTcpListener := GetProcAddress(aDLLHandle, 'sfSocketSelector_addTcpListener');
  sfSocketSelector_addTcpSocket := GetProcAddress(aDLLHandle, 'sfSocketSelector_addTcpSocket');
  sfSocketSelector_addUdpSocket := GetProcAddress(aDLLHandle, 'sfSocketSelector_addUdpSocket');
  sfSocketSelector_clear := GetProcAddress(aDLLHandle, 'sfSocketSelector_clear');
  sfSocketSelector_copy := GetProcAddress(aDLLHandle, 'sfSocketSelector_copy');
  sfSocketSelector_create := GetProcAddress(aDLLHandle, 'sfSocketSelector_create');
  sfSocketSelector_destroy := GetProcAddress(aDLLHandle, 'sfSocketSelector_destroy');
  sfSocketSelector_isTcpListenerReady := GetProcAddress(aDLLHandle, 'sfSocketSelector_isTcpListenerReady');
  sfSocketSelector_isTcpSocketReady := GetProcAddress(aDLLHandle, 'sfSocketSelector_isTcpSocketReady');
  sfSocketSelector_isUdpSocketReady := GetProcAddress(aDLLHandle, 'sfSocketSelector_isUdpSocketReady');
  sfSocketSelector_removeTcpListener := GetProcAddress(aDLLHandle, 'sfSocketSelector_removeTcpListener');
  sfSocketSelector_removeTcpSocket := GetProcAddress(aDLLHandle, 'sfSocketSelector_removeTcpSocket');
  sfSocketSelector_removeUdpSocket := GetProcAddress(aDLLHandle, 'sfSocketSelector_removeUdpSocket');
  sfSocketSelector_wait := GetProcAddress(aDLLHandle, 'sfSocketSelector_wait');
  sfSound_copy := GetProcAddress(aDLLHandle, 'sfSound_copy');
  sfSound_create := GetProcAddress(aDLLHandle, 'sfSound_create');
  sfSound_destroy := GetProcAddress(aDLLHandle, 'sfSound_destroy');
  sfSound_getAttenuation := GetProcAddress(aDLLHandle, 'sfSound_getAttenuation');
  sfSound_getBuffer := GetProcAddress(aDLLHandle, 'sfSound_getBuffer');
  sfSound_getMinDistance := GetProcAddress(aDLLHandle, 'sfSound_getMinDistance');
  sfSound_getPitch := GetProcAddress(aDLLHandle, 'sfSound_getPitch');
  sfSound_getPlayingOffset := GetProcAddress(aDLLHandle, 'sfSound_getPlayingOffset');
  sfSound_getPosition := GetProcAddress(aDLLHandle, 'sfSound_getPosition');
  sfSound_getStatus := GetProcAddress(aDLLHandle, 'sfSound_getStatus');
  sfSound_getVolume := GetProcAddress(aDLLHandle, 'sfSound_getVolume');
  sfSound_isLooping := GetProcAddress(aDLLHandle, 'sfSound_isLooping');
  sfSound_isRelativeToListener := GetProcAddress(aDLLHandle, 'sfSound_isRelativeToListener');
  sfSound_pause := GetProcAddress(aDLLHandle, 'sfSound_pause');
  sfSound_play := GetProcAddress(aDLLHandle, 'sfSound_play');
  sfSound_setAttenuation := GetProcAddress(aDLLHandle, 'sfSound_setAttenuation');
  sfSound_setBuffer := GetProcAddress(aDLLHandle, 'sfSound_setBuffer');
  sfSound_setLooping := GetProcAddress(aDLLHandle, 'sfSound_setLooping');
  sfSound_setMinDistance := GetProcAddress(aDLLHandle, 'sfSound_setMinDistance');
  sfSound_setPitch := GetProcAddress(aDLLHandle, 'sfSound_setPitch');
  sfSound_setPlayingOffset := GetProcAddress(aDLLHandle, 'sfSound_setPlayingOffset');
  sfSound_setPosition := GetProcAddress(aDLLHandle, 'sfSound_setPosition');
  sfSound_setRelativeToListener := GetProcAddress(aDLLHandle, 'sfSound_setRelativeToListener');
  sfSound_setVolume := GetProcAddress(aDLLHandle, 'sfSound_setVolume');
  sfSound_stop := GetProcAddress(aDLLHandle, 'sfSound_stop');
  sfSoundBuffer_copy := GetProcAddress(aDLLHandle, 'sfSoundBuffer_copy');
  sfSoundBuffer_createFromFile := GetProcAddress(aDLLHandle, 'sfSoundBuffer_createFromFile');
  sfSoundBuffer_createFromMemory := GetProcAddress(aDLLHandle, 'sfSoundBuffer_createFromMemory');
  sfSoundBuffer_createFromSamples := GetProcAddress(aDLLHandle, 'sfSoundBuffer_createFromSamples');
  sfSoundBuffer_createFromStream := GetProcAddress(aDLLHandle, 'sfSoundBuffer_createFromStream');
  sfSoundBuffer_destroy := GetProcAddress(aDLLHandle, 'sfSoundBuffer_destroy');
  sfSoundBuffer_getChannelCount := GetProcAddress(aDLLHandle, 'sfSoundBuffer_getChannelCount');
  sfSoundBuffer_getDuration := GetProcAddress(aDLLHandle, 'sfSoundBuffer_getDuration');
  sfSoundBuffer_getSampleCount := GetProcAddress(aDLLHandle, 'sfSoundBuffer_getSampleCount');
  sfSoundBuffer_getSampleRate := GetProcAddress(aDLLHandle, 'sfSoundBuffer_getSampleRate');
  sfSoundBuffer_getSamples := GetProcAddress(aDLLHandle, 'sfSoundBuffer_getSamples');
  sfSoundBuffer_saveToFile := GetProcAddress(aDLLHandle, 'sfSoundBuffer_saveToFile');
  sfSoundBufferRecorder_create := GetProcAddress(aDLLHandle, 'sfSoundBufferRecorder_create');
  sfSoundBufferRecorder_destroy := GetProcAddress(aDLLHandle, 'sfSoundBufferRecorder_destroy');
  sfSoundBufferRecorder_getBuffer := GetProcAddress(aDLLHandle, 'sfSoundBufferRecorder_getBuffer');
  sfSoundBufferRecorder_getChannelCount := GetProcAddress(aDLLHandle, 'sfSoundBufferRecorder_getChannelCount');
  sfSoundBufferRecorder_getDevice := GetProcAddress(aDLLHandle, 'sfSoundBufferRecorder_getDevice');
  sfSoundBufferRecorder_getSampleRate := GetProcAddress(aDLLHandle, 'sfSoundBufferRecorder_getSampleRate');
  sfSoundBufferRecorder_setChannelCount := GetProcAddress(aDLLHandle, 'sfSoundBufferRecorder_setChannelCount');
  sfSoundBufferRecorder_setDevice := GetProcAddress(aDLLHandle, 'sfSoundBufferRecorder_setDevice');
  sfSoundBufferRecorder_start := GetProcAddress(aDLLHandle, 'sfSoundBufferRecorder_start');
  sfSoundBufferRecorder_stop := GetProcAddress(aDLLHandle, 'sfSoundBufferRecorder_stop');
  sfSoundRecorder_create := GetProcAddress(aDLLHandle, 'sfSoundRecorder_create');
  sfSoundRecorder_destroy := GetProcAddress(aDLLHandle, 'sfSoundRecorder_destroy');
  sfSoundRecorder_getAvailableDevices := GetProcAddress(aDLLHandle, 'sfSoundRecorder_getAvailableDevices');
  sfSoundRecorder_getChannelCount := GetProcAddress(aDLLHandle, 'sfSoundRecorder_getChannelCount');
  sfSoundRecorder_getDefaultDevice := GetProcAddress(aDLLHandle, 'sfSoundRecorder_getDefaultDevice');
  sfSoundRecorder_getDevice := GetProcAddress(aDLLHandle, 'sfSoundRecorder_getDevice');
  sfSoundRecorder_getSampleRate := GetProcAddress(aDLLHandle, 'sfSoundRecorder_getSampleRate');
  sfSoundRecorder_isAvailable := GetProcAddress(aDLLHandle, 'sfSoundRecorder_isAvailable');
  sfSoundRecorder_setChannelCount := GetProcAddress(aDLLHandle, 'sfSoundRecorder_setChannelCount');
  sfSoundRecorder_setDevice := GetProcAddress(aDLLHandle, 'sfSoundRecorder_setDevice');
  sfSoundRecorder_start := GetProcAddress(aDLLHandle, 'sfSoundRecorder_start');
  sfSoundRecorder_stop := GetProcAddress(aDLLHandle, 'sfSoundRecorder_stop');
  sfSoundStream_create := GetProcAddress(aDLLHandle, 'sfSoundStream_create');
  sfSoundStream_destroy := GetProcAddress(aDLLHandle, 'sfSoundStream_destroy');
  sfSoundStream_getAttenuation := GetProcAddress(aDLLHandle, 'sfSoundStream_getAttenuation');
  sfSoundStream_getChannelCount := GetProcAddress(aDLLHandle, 'sfSoundStream_getChannelCount');
  sfSoundStream_getMinDistance := GetProcAddress(aDLLHandle, 'sfSoundStream_getMinDistance');
  sfSoundStream_getPitch := GetProcAddress(aDLLHandle, 'sfSoundStream_getPitch');
  sfSoundStream_getPlayingOffset := GetProcAddress(aDLLHandle, 'sfSoundStream_getPlayingOffset');
  sfSoundStream_getPosition := GetProcAddress(aDLLHandle, 'sfSoundStream_getPosition');
  sfSoundStream_getSampleRate := GetProcAddress(aDLLHandle, 'sfSoundStream_getSampleRate');
  sfSoundStream_getStatus := GetProcAddress(aDLLHandle, 'sfSoundStream_getStatus');
  sfSoundStream_getVolume := GetProcAddress(aDLLHandle, 'sfSoundStream_getVolume');
  sfSoundStream_isLooping := GetProcAddress(aDLLHandle, 'sfSoundStream_isLooping');
  sfSoundStream_isRelativeToListener := GetProcAddress(aDLLHandle, 'sfSoundStream_isRelativeToListener');
  sfSoundStream_pause := GetProcAddress(aDLLHandle, 'sfSoundStream_pause');
  sfSoundStream_play := GetProcAddress(aDLLHandle, 'sfSoundStream_play');
  sfSoundStream_setAttenuation := GetProcAddress(aDLLHandle, 'sfSoundStream_setAttenuation');
  sfSoundStream_setLooping := GetProcAddress(aDLLHandle, 'sfSoundStream_setLooping');
  sfSoundStream_setMinDistance := GetProcAddress(aDLLHandle, 'sfSoundStream_setMinDistance');
  sfSoundStream_setPitch := GetProcAddress(aDLLHandle, 'sfSoundStream_setPitch');
  sfSoundStream_setPlayingOffset := GetProcAddress(aDLLHandle, 'sfSoundStream_setPlayingOffset');
  sfSoundStream_setPosition := GetProcAddress(aDLLHandle, 'sfSoundStream_setPosition');
  sfSoundStream_setRelativeToListener := GetProcAddress(aDLLHandle, 'sfSoundStream_setRelativeToListener');
  sfSoundStream_setVolume := GetProcAddress(aDLLHandle, 'sfSoundStream_setVolume');
  sfSoundStream_stop := GetProcAddress(aDLLHandle, 'sfSoundStream_stop');
  sfSprite_copy := GetProcAddress(aDLLHandle, 'sfSprite_copy');
  sfSprite_create := GetProcAddress(aDLLHandle, 'sfSprite_create');
  sfSprite_destroy := GetProcAddress(aDLLHandle, 'sfSprite_destroy');
  sfSprite_getColor := GetProcAddress(aDLLHandle, 'sfSprite_getColor');
  sfSprite_getGlobalBounds := GetProcAddress(aDLLHandle, 'sfSprite_getGlobalBounds');
  sfSprite_getInverseTransform := GetProcAddress(aDLLHandle, 'sfSprite_getInverseTransform');
  sfSprite_getLocalBounds := GetProcAddress(aDLLHandle, 'sfSprite_getLocalBounds');
  sfSprite_getOrigin := GetProcAddress(aDLLHandle, 'sfSprite_getOrigin');
  sfSprite_getPosition := GetProcAddress(aDLLHandle, 'sfSprite_getPosition');
  sfSprite_getRotation := GetProcAddress(aDLLHandle, 'sfSprite_getRotation');
  sfSprite_getScale := GetProcAddress(aDLLHandle, 'sfSprite_getScale');
  sfSprite_getTexture := GetProcAddress(aDLLHandle, 'sfSprite_getTexture');
  sfSprite_getTextureRect := GetProcAddress(aDLLHandle, 'sfSprite_getTextureRect');
  sfSprite_getTransform := GetProcAddress(aDLLHandle, 'sfSprite_getTransform');
  sfSprite_move := GetProcAddress(aDLLHandle, 'sfSprite_move');
  sfSprite_rotate := GetProcAddress(aDLLHandle, 'sfSprite_rotate');
  sfSprite_scale := GetProcAddress(aDLLHandle, 'sfSprite_scale');
  sfSprite_setColor := GetProcAddress(aDLLHandle, 'sfSprite_setColor');
  sfSprite_setOrigin := GetProcAddress(aDLLHandle, 'sfSprite_setOrigin');
  sfSprite_setPosition := GetProcAddress(aDLLHandle, 'sfSprite_setPosition');
  sfSprite_setRotation := GetProcAddress(aDLLHandle, 'sfSprite_setRotation');
  sfSprite_setScale := GetProcAddress(aDLLHandle, 'sfSprite_setScale');
  sfSprite_setTexture := GetProcAddress(aDLLHandle, 'sfSprite_setTexture');
  sfSprite_setTextureRect := GetProcAddress(aDLLHandle, 'sfSprite_setTextureRect');
  sfTcpListener_accept := GetProcAddress(aDLLHandle, 'sfTcpListener_accept');
  sfTcpListener_create := GetProcAddress(aDLLHandle, 'sfTcpListener_create');
  sfTcpListener_destroy := GetProcAddress(aDLLHandle, 'sfTcpListener_destroy');
  sfTcpListener_getLocalPort := GetProcAddress(aDLLHandle, 'sfTcpListener_getLocalPort');
  sfTcpListener_isBlocking := GetProcAddress(aDLLHandle, 'sfTcpListener_isBlocking');
  sfTcpListener_listen := GetProcAddress(aDLLHandle, 'sfTcpListener_listen');
  sfTcpListener_setBlocking := GetProcAddress(aDLLHandle, 'sfTcpListener_setBlocking');
  sfTcpSocket_connect := GetProcAddress(aDLLHandle, 'sfTcpSocket_connect');
  sfTcpSocket_create := GetProcAddress(aDLLHandle, 'sfTcpSocket_create');
  sfTcpSocket_destroy := GetProcAddress(aDLLHandle, 'sfTcpSocket_destroy');
  sfTcpSocket_disconnect := GetProcAddress(aDLLHandle, 'sfTcpSocket_disconnect');
  sfTcpSocket_getLocalPort := GetProcAddress(aDLLHandle, 'sfTcpSocket_getLocalPort');
  sfTcpSocket_getRemoteAddress := GetProcAddress(aDLLHandle, 'sfTcpSocket_getRemoteAddress');
  sfTcpSocket_getRemotePort := GetProcAddress(aDLLHandle, 'sfTcpSocket_getRemotePort');
  sfTcpSocket_isBlocking := GetProcAddress(aDLLHandle, 'sfTcpSocket_isBlocking');
  sfTcpSocket_receive := GetProcAddress(aDLLHandle, 'sfTcpSocket_receive');
  sfTcpSocket_receivePacket := GetProcAddress(aDLLHandle, 'sfTcpSocket_receivePacket');
  sfTcpSocket_send := GetProcAddress(aDLLHandle, 'sfTcpSocket_send');
  sfTcpSocket_sendPacket := GetProcAddress(aDLLHandle, 'sfTcpSocket_sendPacket');
  sfTcpSocket_sendPartial := GetProcAddress(aDLLHandle, 'sfTcpSocket_sendPartial');
  sfTcpSocket_setBlocking := GetProcAddress(aDLLHandle, 'sfTcpSocket_setBlocking');
  sfText_copy := GetProcAddress(aDLLHandle, 'sfText_copy');
  sfText_create := GetProcAddress(aDLLHandle, 'sfText_create');
  sfText_destroy := GetProcAddress(aDLLHandle, 'sfText_destroy');
  sfText_findCharacterPos := GetProcAddress(aDLLHandle, 'sfText_findCharacterPos');
  sfText_getCharacterSize := GetProcAddress(aDLLHandle, 'sfText_getCharacterSize');
  sfText_getFillColor := GetProcAddress(aDLLHandle, 'sfText_getFillColor');
  sfText_getFont := GetProcAddress(aDLLHandle, 'sfText_getFont');
  sfText_getGlobalBounds := GetProcAddress(aDLLHandle, 'sfText_getGlobalBounds');
  sfText_getInverseTransform := GetProcAddress(aDLLHandle, 'sfText_getInverseTransform');
  sfText_getLetterSpacing := GetProcAddress(aDLLHandle, 'sfText_getLetterSpacing');
  sfText_getLineSpacing := GetProcAddress(aDLLHandle, 'sfText_getLineSpacing');
  sfText_getLocalBounds := GetProcAddress(aDLLHandle, 'sfText_getLocalBounds');
  sfText_getOrigin := GetProcAddress(aDLLHandle, 'sfText_getOrigin');
  sfText_getOutlineColor := GetProcAddress(aDLLHandle, 'sfText_getOutlineColor');
  sfText_getOutlineThickness := GetProcAddress(aDLLHandle, 'sfText_getOutlineThickness');
  sfText_getPosition := GetProcAddress(aDLLHandle, 'sfText_getPosition');
  sfText_getRotation := GetProcAddress(aDLLHandle, 'sfText_getRotation');
  sfText_getScale := GetProcAddress(aDLLHandle, 'sfText_getScale');
  sfText_getString := GetProcAddress(aDLLHandle, 'sfText_getString');
  sfText_getStyle := GetProcAddress(aDLLHandle, 'sfText_getStyle');
  sfText_getTransform := GetProcAddress(aDLLHandle, 'sfText_getTransform');
  sfText_getUnicodeString := GetProcAddress(aDLLHandle, 'sfText_getUnicodeString');
  sfText_move := GetProcAddress(aDLLHandle, 'sfText_move');
  sfText_rotate := GetProcAddress(aDLLHandle, 'sfText_rotate');
  sfText_scale := GetProcAddress(aDLLHandle, 'sfText_scale');
  sfText_setCharacterSize := GetProcAddress(aDLLHandle, 'sfText_setCharacterSize');
  sfText_setFillColor := GetProcAddress(aDLLHandle, 'sfText_setFillColor');
  sfText_setFont := GetProcAddress(aDLLHandle, 'sfText_setFont');
  sfText_setLetterSpacing := GetProcAddress(aDLLHandle, 'sfText_setLetterSpacing');
  sfText_setLineSpacing := GetProcAddress(aDLLHandle, 'sfText_setLineSpacing');
  sfText_setOrigin := GetProcAddress(aDLLHandle, 'sfText_setOrigin');
  sfText_setOutlineColor := GetProcAddress(aDLLHandle, 'sfText_setOutlineColor');
  sfText_setOutlineThickness := GetProcAddress(aDLLHandle, 'sfText_setOutlineThickness');
  sfText_setPosition := GetProcAddress(aDLLHandle, 'sfText_setPosition');
  sfText_setRotation := GetProcAddress(aDLLHandle, 'sfText_setRotation');
  sfText_setScale := GetProcAddress(aDLLHandle, 'sfText_setScale');
  sfText_setString := GetProcAddress(aDLLHandle, 'sfText_setString');
  sfText_setStyle := GetProcAddress(aDLLHandle, 'sfText_setStyle');
  sfText_setUnicodeString := GetProcAddress(aDLLHandle, 'sfText_setUnicodeString');
  sfTexture_bind := GetProcAddress(aDLLHandle, 'sfTexture_bind');
  sfTexture_copy := GetProcAddress(aDLLHandle, 'sfTexture_copy');
  sfTexture_copyToImage := GetProcAddress(aDLLHandle, 'sfTexture_copyToImage');
  sfTexture_create := GetProcAddress(aDLLHandle, 'sfTexture_create');
  sfTexture_createFromFile := GetProcAddress(aDLLHandle, 'sfTexture_createFromFile');
  sfTexture_createFromImage := GetProcAddress(aDLLHandle, 'sfTexture_createFromImage');
  sfTexture_createFromMemory := GetProcAddress(aDLLHandle, 'sfTexture_createFromMemory');
  sfTexture_createFromStream := GetProcAddress(aDLLHandle, 'sfTexture_createFromStream');
  sfTexture_createSrgbFromFile := GetProcAddress(aDLLHandle, 'sfTexture_createSrgbFromFile');
  sfTexture_createSrgbFromImage := GetProcAddress(aDLLHandle, 'sfTexture_createSrgbFromImage');
  sfTexture_createSrgbFromMemory := GetProcAddress(aDLLHandle, 'sfTexture_createSrgbFromMemory');
  sfTexture_createSrgbFromStream := GetProcAddress(aDLLHandle, 'sfTexture_createSrgbFromStream');
  sfTexture_destroy := GetProcAddress(aDLLHandle, 'sfTexture_destroy');
  sfTexture_generateMipmap := GetProcAddress(aDLLHandle, 'sfTexture_generateMipmap');
  sfTexture_getMaximumSize := GetProcAddress(aDLLHandle, 'sfTexture_getMaximumSize');
  sfTexture_getNativeHandle := GetProcAddress(aDLLHandle, 'sfTexture_getNativeHandle');
  sfTexture_getSize := GetProcAddress(aDLLHandle, 'sfTexture_getSize');
  sfTexture_isRepeated := GetProcAddress(aDLLHandle, 'sfTexture_isRepeated');
  sfTexture_isSmooth := GetProcAddress(aDLLHandle, 'sfTexture_isSmooth');
  sfTexture_isSrgb := GetProcAddress(aDLLHandle, 'sfTexture_isSrgb');
  sfTexture_setRepeated := GetProcAddress(aDLLHandle, 'sfTexture_setRepeated');
  sfTexture_setSmooth := GetProcAddress(aDLLHandle, 'sfTexture_setSmooth');
  sfTexture_swap := GetProcAddress(aDLLHandle, 'sfTexture_swap');
  sfTexture_updateFromImage := GetProcAddress(aDLLHandle, 'sfTexture_updateFromImage');
  sfTexture_updateFromPixels := GetProcAddress(aDLLHandle, 'sfTexture_updateFromPixels');
  sfTexture_updateFromRenderWindow := GetProcAddress(aDLLHandle, 'sfTexture_updateFromRenderWindow');
  sfTexture_updateFromTexture := GetProcAddress(aDLLHandle, 'sfTexture_updateFromTexture');
  sfTexture_updateFromWindow := GetProcAddress(aDLLHandle, 'sfTexture_updateFromWindow');
  sfTime_AsMicroseconds := GetProcAddress(aDLLHandle, 'sfTime_asMicroseconds');
  sfTime_AsMilliseconds := GetProcAddress(aDLLHandle, 'sfTime_asMilliseconds');
  sfTime_AsSeconds := GetProcAddress(aDLLHandle, 'sfTime_asSeconds');
  sfTouch_getPosition := GetProcAddress(aDLLHandle, 'sfTouch_getPosition');
  sfTouch_getPositionRenderWindow := GetProcAddress(aDLLHandle, 'sfTouch_getPositionRenderWindow');
  sfTouch_getPositionWindowBase := GetProcAddress(aDLLHandle, 'sfTouch_getPositionWindowBase');
  sfTouch_isDown := GetProcAddress(aDLLHandle, 'sfTouch_isDown');
  sfTransform_combine := GetProcAddress(aDLLHandle, 'sfTransform_combine');
  sfTransform_equal := GetProcAddress(aDLLHandle, 'sfTransform_equal');
  sfTransform_fromMatrix := GetProcAddress(aDLLHandle, 'sfTransform_fromMatrix');
  sfTransform_getInverse := GetProcAddress(aDLLHandle, 'sfTransform_getInverse');
  sfTransform_getMatrix := GetProcAddress(aDLLHandle, 'sfTransform_getMatrix');
  sfTransform_rotate := GetProcAddress(aDLLHandle, 'sfTransform_rotate');
  sfTransform_rotateWithCenter := GetProcAddress(aDLLHandle, 'sfTransform_rotateWithCenter');
  sfTransform_scale := GetProcAddress(aDLLHandle, 'sfTransform_scale');
  sfTransform_scaleWithCenter := GetProcAddress(aDLLHandle, 'sfTransform_scaleWithCenter');
  sfTransform_transformPoint := GetProcAddress(aDLLHandle, 'sfTransform_transformPoint');
  sfTransform_transformRect := GetProcAddress(aDLLHandle, 'sfTransform_transformRect');
  sfTransform_translate := GetProcAddress(aDLLHandle, 'sfTransform_translate');
  sfTransformable_copy := GetProcAddress(aDLLHandle, 'sfTransformable_copy');
  sfTransformable_create := GetProcAddress(aDLLHandle, 'sfTransformable_create');
  sfTransformable_destroy := GetProcAddress(aDLLHandle, 'sfTransformable_destroy');
  sfTransformable_getInverseTransform := GetProcAddress(aDLLHandle, 'sfTransformable_getInverseTransform');
  sfTransformable_getOrigin := GetProcAddress(aDLLHandle, 'sfTransformable_getOrigin');
  sfTransformable_getPosition := GetProcAddress(aDLLHandle, 'sfTransformable_getPosition');
  sfTransformable_getRotation := GetProcAddress(aDLLHandle, 'sfTransformable_getRotation');
  sfTransformable_getScale := GetProcAddress(aDLLHandle, 'sfTransformable_getScale');
  sfTransformable_getTransform := GetProcAddress(aDLLHandle, 'sfTransformable_getTransform');
  sfTransformable_move := GetProcAddress(aDLLHandle, 'sfTransformable_move');
  sfTransformable_rotate := GetProcAddress(aDLLHandle, 'sfTransformable_rotate');
  sfTransformable_scale := GetProcAddress(aDLLHandle, 'sfTransformable_scale');
  sfTransformable_setOrigin := GetProcAddress(aDLLHandle, 'sfTransformable_setOrigin');
  sfTransformable_setPosition := GetProcAddress(aDLLHandle, 'sfTransformable_setPosition');
  sfTransformable_setRotation := GetProcAddress(aDLLHandle, 'sfTransformable_setRotation');
  sfTransformable_setScale := GetProcAddress(aDLLHandle, 'sfTransformable_setScale');
  sfUdpSocket_bind := GetProcAddress(aDLLHandle, 'sfUdpSocket_bind');
  sfUdpSocket_create := GetProcAddress(aDLLHandle, 'sfUdpSocket_create');
  sfUdpSocket_destroy := GetProcAddress(aDLLHandle, 'sfUdpSocket_destroy');
  sfUdpSocket_getLocalPort := GetProcAddress(aDLLHandle, 'sfUdpSocket_getLocalPort');
  sfUdpSocket_isBlocking := GetProcAddress(aDLLHandle, 'sfUdpSocket_isBlocking');
  sfUdpSocket_maxDatagramSize := GetProcAddress(aDLLHandle, 'sfUdpSocket_maxDatagramSize');
  sfUdpSocket_receive := GetProcAddress(aDLLHandle, 'sfUdpSocket_receive');
  sfUdpSocket_receivePacket := GetProcAddress(aDLLHandle, 'sfUdpSocket_receivePacket');
  sfUdpSocket_send := GetProcAddress(aDLLHandle, 'sfUdpSocket_send');
  sfUdpSocket_sendPacket := GetProcAddress(aDLLHandle, 'sfUdpSocket_sendPacket');
  sfUdpSocket_setBlocking := GetProcAddress(aDLLHandle, 'sfUdpSocket_setBlocking');
  sfUdpSocket_unbind := GetProcAddress(aDLLHandle, 'sfUdpSocket_unbind');
  sfVertexArray_append := GetProcAddress(aDLLHandle, 'sfVertexArray_append');
  sfVertexArray_clear := GetProcAddress(aDLLHandle, 'sfVertexArray_clear');
  sfVertexArray_copy := GetProcAddress(aDLLHandle, 'sfVertexArray_copy');
  sfVertexArray_create := GetProcAddress(aDLLHandle, 'sfVertexArray_create');
  sfVertexArray_destroy := GetProcAddress(aDLLHandle, 'sfVertexArray_destroy');
  sfVertexArray_getBounds := GetProcAddress(aDLLHandle, 'sfVertexArray_getBounds');
  sfVertexArray_getPrimitiveType := GetProcAddress(aDLLHandle, 'sfVertexArray_getPrimitiveType');
  sfVertexArray_getVertex := GetProcAddress(aDLLHandle, 'sfVertexArray_getVertex');
  sfVertexArray_getVertexCount := GetProcAddress(aDLLHandle, 'sfVertexArray_getVertexCount');
  sfVertexArray_resize := GetProcAddress(aDLLHandle, 'sfVertexArray_resize');
  sfVertexArray_setPrimitiveType := GetProcAddress(aDLLHandle, 'sfVertexArray_setPrimitiveType');
  sfVertexBuffer_bind := GetProcAddress(aDLLHandle, 'sfVertexBuffer_bind');
  sfVertexBuffer_copy := GetProcAddress(aDLLHandle, 'sfVertexBuffer_copy');
  sfVertexBuffer_create := GetProcAddress(aDLLHandle, 'sfVertexBuffer_create');
  sfVertexBuffer_destroy := GetProcAddress(aDLLHandle, 'sfVertexBuffer_destroy');
  sfVertexBuffer_getNativeHandle := GetProcAddress(aDLLHandle, 'sfVertexBuffer_getNativeHandle');
  sfVertexBuffer_getPrimitiveType := GetProcAddress(aDLLHandle, 'sfVertexBuffer_getPrimitiveType');
  sfVertexBuffer_getUsage := GetProcAddress(aDLLHandle, 'sfVertexBuffer_getUsage');
  sfVertexBuffer_getVertexCount := GetProcAddress(aDLLHandle, 'sfVertexBuffer_getVertexCount');
  sfVertexBuffer_isAvailable := GetProcAddress(aDLLHandle, 'sfVertexBuffer_isAvailable');
  sfVertexBuffer_setPrimitiveType := GetProcAddress(aDLLHandle, 'sfVertexBuffer_setPrimitiveType');
  sfVertexBuffer_setUsage := GetProcAddress(aDLLHandle, 'sfVertexBuffer_setUsage');
  sfVertexBuffer_swap := GetProcAddress(aDLLHandle, 'sfVertexBuffer_swap');
  sfVertexBuffer_update := GetProcAddress(aDLLHandle, 'sfVertexBuffer_update');
  sfVertexBuffer_updateFromVertexBuffer := GetProcAddress(aDLLHandle, 'sfVertexBuffer_updateFromVertexBuffer');
  sfVideoMode_getDesktopMode := GetProcAddress(aDLLHandle, 'sfVideoMode_getDesktopMode');
  sfVideoMode_getFullscreenModes := GetProcAddress(aDLLHandle, 'sfVideoMode_getFullscreenModes');
  sfVideoMode_isValid := GetProcAddress(aDLLHandle, 'sfVideoMode_isValid');
  sfView_copy := GetProcAddress(aDLLHandle, 'sfView_copy');
  sfView_create := GetProcAddress(aDLLHandle, 'sfView_create');
  sfView_createFromRect := GetProcAddress(aDLLHandle, 'sfView_createFromRect');
  sfView_destroy := GetProcAddress(aDLLHandle, 'sfView_destroy');
  sfView_getCenter := GetProcAddress(aDLLHandle, 'sfView_getCenter');
  sfView_getRotation := GetProcAddress(aDLLHandle, 'sfView_getRotation');
  sfView_getSize := GetProcAddress(aDLLHandle, 'sfView_getSize');
  sfView_getViewport := GetProcAddress(aDLLHandle, 'sfView_getViewport');
  sfView_move := GetProcAddress(aDLLHandle, 'sfView_move');
  sfView_rotate := GetProcAddress(aDLLHandle, 'sfView_rotate');
  sfView_setCenter := GetProcAddress(aDLLHandle, 'sfView_setCenter');
  sfView_setRotation := GetProcAddress(aDLLHandle, 'sfView_setRotation');
  sfView_setSize := GetProcAddress(aDLLHandle, 'sfView_setSize');
  sfView_setViewport := GetProcAddress(aDLLHandle, 'sfView_setViewport');
  sfView_zoom := GetProcAddress(aDLLHandle, 'sfView_zoom');
  sfVulkan_getFunction := GetProcAddress(aDLLHandle, 'sfVulkan_getFunction');
  sfVulkan_getGraphicsRequiredInstanceExtensions := GetProcAddress(aDLLHandle, 'sfVulkan_getGraphicsRequiredInstanceExtensions');
  sfVulkan_isAvailable := GetProcAddress(aDLLHandle, 'sfVulkan_isAvailable');
  sfWindow_close := GetProcAddress(aDLLHandle, 'sfWindow_close');
  sfWindow_create := GetProcAddress(aDLLHandle, 'sfWindow_create');
  sfWindow_createFromHandle := GetProcAddress(aDLLHandle, 'sfWindow_createFromHandle');
  sfWindow_createUnicode := GetProcAddress(aDLLHandle, 'sfWindow_createUnicode');
  sfWindow_createVulkanSurface := GetProcAddress(aDLLHandle, 'sfWindow_createVulkanSurface');
  sfWindow_destroy := GetProcAddress(aDLLHandle, 'sfWindow_destroy');
  sfWindow_display := GetProcAddress(aDLLHandle, 'sfWindow_display');
  sfWindow_getNativeHandle := GetProcAddress(aDLLHandle, 'sfWindow_getNativeHandle');
  sfWindow_getPosition := GetProcAddress(aDLLHandle, 'sfWindow_getPosition');
  sfWindow_getSettings := GetProcAddress(aDLLHandle, 'sfWindow_getSettings');
  sfWindow_getSize := GetProcAddress(aDLLHandle, 'sfWindow_getSize');
  sfWindow_hasFocus := GetProcAddress(aDLLHandle, 'sfWindow_hasFocus');
  sfWindow_isOpen := GetProcAddress(aDLLHandle, 'sfWindow_isOpen');
  sfWindow_pollEvent := GetProcAddress(aDLLHandle, 'sfWindow_pollEvent');
  sfWindow_requestFocus := GetProcAddress(aDLLHandle, 'sfWindow_requestFocus');
  sfWindow_setActive := GetProcAddress(aDLLHandle, 'sfWindow_setActive');
  sfWindow_setFramerateLimit := GetProcAddress(aDLLHandle, 'sfWindow_setFramerateLimit');
  sfWindow_setIcon := GetProcAddress(aDLLHandle, 'sfWindow_setIcon');
  sfWindow_setJoystickThreshold := GetProcAddress(aDLLHandle, 'sfWindow_setJoystickThreshold');
  sfWindow_setKeyRepeatEnabled := GetProcAddress(aDLLHandle, 'sfWindow_setKeyRepeatEnabled');
  sfWindow_setMouseCursor := GetProcAddress(aDLLHandle, 'sfWindow_setMouseCursor');
  sfWindow_setMouseCursorGrabbed := GetProcAddress(aDLLHandle, 'sfWindow_setMouseCursorGrabbed');
  sfWindow_setMouseCursorVisible := GetProcAddress(aDLLHandle, 'sfWindow_setMouseCursorVisible');
  sfWindow_setPosition := GetProcAddress(aDLLHandle, 'sfWindow_setPosition');
  sfWindow_setSize := GetProcAddress(aDLLHandle, 'sfWindow_setSize');
  sfWindow_setTitle := GetProcAddress(aDLLHandle, 'sfWindow_setTitle');
  sfWindow_setUnicodeTitle := GetProcAddress(aDLLHandle, 'sfWindow_setUnicodeTitle');
  sfWindow_setVerticalSyncEnabled := GetProcAddress(aDLLHandle, 'sfWindow_setVerticalSyncEnabled');
  sfWindow_setVisible := GetProcAddress(aDLLHandle, 'sfWindow_setVisible');
  sfWindow_waitEvent := GetProcAddress(aDLLHandle, 'sfWindow_waitEvent');
  sfWindowBase_close := GetProcAddress(aDLLHandle, 'sfWindowBase_close');
  sfWindowBase_create := GetProcAddress(aDLLHandle, 'sfWindowBase_create');
  sfWindowBase_createFromHandle := GetProcAddress(aDLLHandle, 'sfWindowBase_createFromHandle');
  sfWindowBase_createUnicode := GetProcAddress(aDLLHandle, 'sfWindowBase_createUnicode');
  sfWindowBase_createVulkanSurface := GetProcAddress(aDLLHandle, 'sfWindowBase_createVulkanSurface');
  sfWindowBase_destroy := GetProcAddress(aDLLHandle, 'sfWindowBase_destroy');
  sfWindowBase_getNativeHandle := GetProcAddress(aDLLHandle, 'sfWindowBase_getNativeHandle');
  sfWindowBase_getPosition := GetProcAddress(aDLLHandle, 'sfWindowBase_getPosition');
  sfWindowBase_getSize := GetProcAddress(aDLLHandle, 'sfWindowBase_getSize');
  sfWindowBase_hasFocus := GetProcAddress(aDLLHandle, 'sfWindowBase_hasFocus');
  sfWindowBase_isOpen := GetProcAddress(aDLLHandle, 'sfWindowBase_isOpen');
  sfWindowBase_pollEvent := GetProcAddress(aDLLHandle, 'sfWindowBase_pollEvent');
  sfWindowBase_requestFocus := GetProcAddress(aDLLHandle, 'sfWindowBase_requestFocus');
  sfWindowBase_setIcon := GetProcAddress(aDLLHandle, 'sfWindowBase_setIcon');
  sfWindowBase_setJoystickThreshold := GetProcAddress(aDLLHandle, 'sfWindowBase_setJoystickThreshold');
  sfWindowBase_setKeyRepeatEnabled := GetProcAddress(aDLLHandle, 'sfWindowBase_setKeyRepeatEnabled');
  sfWindowBase_setMouseCursor := GetProcAddress(aDLLHandle, 'sfWindowBase_setMouseCursor');
  sfWindowBase_setMouseCursorGrabbed := GetProcAddress(aDLLHandle, 'sfWindowBase_setMouseCursorGrabbed');
  sfWindowBase_setMouseCursorVisible := GetProcAddress(aDLLHandle, 'sfWindowBase_setMouseCursorVisible');
  sfWindowBase_setPosition := GetProcAddress(aDLLHandle, 'sfWindowBase_setPosition');
  sfWindowBase_setSize := GetProcAddress(aDLLHandle, 'sfWindowBase_setSize');
  sfWindowBase_setTitle := GetProcAddress(aDLLHandle, 'sfWindowBase_setTitle');
  sfWindowBase_setUnicodeTitle := GetProcAddress(aDLLHandle, 'sfWindowBase_setUnicodeTitle');
  sfWindowBase_setVisible := GetProcAddress(aDLLHandle, 'sfWindowBase_setVisible');
  sfWindowBase_waitEvent := GetProcAddress(aDLLHandle, 'sfWindowBase_waitEvent');

  //=== VECTOR ==============================================================

  sfVector2i_Create := GetProcAddress(aDLLHandle, 'sfVector2i_Create');
  sfVector2u_Create := GetProcAddress(aDLLHandle, 'sfVector2u_Create');
  sfVector2f_Create := GetProcAddress(aDLLHandle, 'sfVector2f_Create');
  sfVector3f_Create := GetProcAddress(aDLLHandle, 'sfVector3f_Create');

  //=== RECT ================================================================

  sfFloatRect_Create := GetProcAddress(aDLLHandle, 'sfFloatRect_Create');
  sfIntRect_Create := GetProcAddress(aDLLHandle, 'sfIntRect_Create');

  //=== RENDERWINDOW ========================================================
  sfRenderWindow_SetDefaultIcon := GetProcAddress(aDLLHandle, 'sfRenderWindow_SetDefaultIcon');
  sfRenderWindow_GetFrameRate := GetProcAddress(aDLLHandle, 'sfRenderWindow_GetFrameRate');
  sfRenderWindow_ResetTiming := GetProcAddress(aDLLHandle, 'sfRenderWindow_ResetTiming');
  sfRenderWindow_GetDPI := GetProcAddress(aDLLHandle, 'sfRenderWindow_GetDPI');
  sfRenderWindow_ScaleToDPI := GetProcAddress(aDLLHandle, 'sfRenderWindow_ScaleToDPI');
  sfRenderWindow_ScaleOnDPIChange := GetProcAddress(aDLLHandle, 'sfRenderWindow_ScaleOnDPIChange');
  sfRenderWindow_DrawLine := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawLine');
  sfRenderWindow_DrawRect := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawRect');
  sfRenderWindow_DrawFilledRect := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawFilledRect');
  sfRenderWindow_DrawTextEx := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawTextEx');
  sfRenderWindow_DrawCircle := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawCircle');
  sfRenderWindow_DrawFilledCircle := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawFilledCircle');
  sfRenderWindow_DrawTriangle := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawTriangle');
  sfRenderWindow_DrawFilledTriangle := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawFilledTriangle');
  sfRenderWindow_DrawPolygon := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawPolygon');
  sfRenderWindow_DrawFilledPolygon := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawFilledPolygon');
  sfRenderWindow_DrawPolyline := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawPolyline');
  sfRenderWindow_DrawEllipse := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawEllipse');
  sfRenderWindow_DrawFilledEllipse := GetProcAddress(aDLLHandle, 'sfRenderWindow_DrawFilledEllipse');

  //=== VIEW ================================================================
  sfView_SetLetterBox := GetProcAddress(aDLLHandle, 'sfView_SetLetterBox');
  sfView_CreateLetterBox := GetProcAddress(aDLLHandle, 'sfView_CreateLetterBox');

  //=== FONT ================================================================

  sfFont_CreateFromRes := GetProcAddress(aDLLHandle, 'sfFont_CreateFromRes');
  sfFont_CreateDefaultFont := GetProcAddress(aDLLHandle, 'sfFont_CreateDefaultFont');

  //=== TEXT ================================================================
  sfText_SetCharacterSizeDPI := GetProcAddress(aDLLHandle, 'sfText_SetCharacterSizeDPI');
  sfText_SetUnicodeStringEx := GetProcAddress(aDLLHandle, 'sfText_SetUnicodeStringEx');

  //=== TEXTURE =============================================================
  sfTexture_CreateFromRes := GetProcAddress(aDLLHandle, 'sfTexture_CreateFromRes');

  //=== ZIPFILE =============================================================
  sfZipFile_Build := GetProcAddress(aDLLHandle, 'sfZipFile_Build');

  //=== INPUTSTREAM =========================================================
  sfInputStream_Read := GetProcAddress(aDLLHandle, 'sfInputStream_Read');
  sfInputStream_Seek := GetProcAddress(aDLLHandle, 'sfInputStream_Seek');
  sfInputStream_Tell := GetProcAddress(aDLLHandle, 'sfInputStream_Tell');
  sfInputStream_GetSize := GetProcAddress(aDLLHandle, 'sfInputStream_GetSize');
  sfInputStream_EOF := GetProcAddress(aDLLHandle, 'sfInputStream_EOF');
  sfInputStream_Close := GetProcAddress(aDLLHandle, 'sfInputStream_Close');
  sfInputStream_CreateFromFile := GetProcAddress(aDLLHandle, 'sfInputStream_CreateFromFile');
  sfInputStream_CreateFromMemory := GetProcAddress(aDLLHandle, 'sfInputStream_CreateFromMemory');
  sfInputStream_CreateFromZipFile := GetProcAddress(aDLLHandle, 'sfInputStream_CreateFromZipFile');

  //=== VIDEO ===============================================================
  sfVideo_PlayFromStream := GetProcAddress(aDLLHandle, 'sfVideo_PlayFromStream');
  sfVideo_PlayFromFile := GetProcAddress(aDLLHandle, 'sfVideo_PlayFromFile');
  sfVideo_PlayFromZipFile := GetProcAddress(aDLLHandle, 'sfVideo_PlayFromZipFile');
  sfVideo_Destroy := GetProcAddress(aDLLHandle, 'sfVideo_Destroy');
  sfVideo_Update := GetProcAddress(aDLLHandle, 'sfVideo_Update');
  sfVideo_Render := GetProcAddress(aDLLHandle, 'sfVideo_Render');
  sfVideo_GetStatus := GetProcAddress(aDLLHandle, 'sfVideo_GetStatus');
  sfVideo_IsLooping := GetProcAddress(aDLLHandle, 'sfVideo_IsLooping');
  sfVideo_SetLooping := GetProcAddress(aDLLHandle, 'sfVideo_SetLooping');
  sfVideo_GetVolume := GetProcAddress(aDLLHandle, 'sfVideo_GetVolume');
  sfVideo_SetVolume := GetProcAddress(aDLLHandle, 'sfVideo_SetVolume');

end;

procedure LoadDLL();
var
  LResStream: TResourceStream;

  function c9e319d2dedd4d30b7d95beb607db99d(): string;
  const
    CValue = 'b674a0a53b304d72b9f2eb7a765192fc';
  begin
    Result := CValue;
  end;

  procedure AbortDLL();
  begin
    Halt;
  end;

begin
  // load deps DLL
  if DLLHandle <> 0 then Exit;
  if not Boolean((FindResource(HInstance, PChar(c9e319d2dedd4d30b7d95beb607db99d()), RT_RCDATA) <> 0)) then AbortDLL();

  LResStream := TResourceStream.Create(HInstance, c9e319d2dedd4d30b7d95beb607db99d(), RT_RCDATA);
  try
    LResStream.Position := 0;
    {$IFDEF DEVMODE}
    DllFilename := 'C:\Dev\Delphi\Projects\PSFML\src\bin\PSFML.dll';
    {$ELSE}
    DLLFilename := GetTempPathStr + GetGUIDFileName + '.dat';
    {$ENDIF}

    LResStream.SaveToFile(DLLFilename);
    if not FileExists(DLLFilename) then AbortDLL();
    DLLHandle := LoadLibrary(PChar(DLLFilename));
    if DLLHandle = 0 then AbortDLL();
  finally
    LResStream.Free();
  end;
  GetExports(DLLHandle);
end;

procedure UnloadDLL();
begin
  // unload deps DLL
  if DLLHandle <> 0 then
  begin
    FreeLibrary(DLLHandle);
    DeleteFile(DLLFilename);
    DLLHandle := 0;
    DLLFilename := '';
  end;
end;

initialization
begin
  // Turn off floating point exceptions
  SetExceptionMask(GetExceptionMask + [exOverflow, exInvalidOp]);

  {$IFNDEF FPC}
  // turn on memory leak detection
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  // load DLL
  LoadDLL();
end;

finalization
begin
  // unload DLL
  UnloadDLL();
end;
{$ENDREGION}

end.
