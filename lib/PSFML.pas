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

unit PSFML;

{$I PSFML.inc}

interface

const
  {$IF Defined(WIN64)}
  PSFML_DLL = 'PSFML.dll';
  _PU = '';
  {$ELSE}
    {$MESSAGE Error 'Unsupported platform'}
  {$ENDIF}

const
  CSFML_VERSION_MAJOR = 3;
  CSFML_VERSION_MINOR = 0;
  CSFML_VERSION_PATCH = 0;
  Z_ERRNO = -1;
  Z_OK = 0;
  Z_DEFLATED = 8;
  Z_DEFAULT_STRATEGY = 0;
  ZIP_OK = (0);
  ZIP_EOF = (0);
  ZIP_ERRNO = (Z_ERRNO);
  ZIP_PARAMERROR = (-102);
  ZIP_BADZIPFILE = (-103);
  ZIP_INTERNALERROR = (-104);
  UNZ_OK = (0);
  UNZ_END_OF_LIST_OF_FILE = (-100);
  UNZ_ERRNO = (Z_ERRNO);
  UNZ_EOF = (0);
  UNZ_PARAMERROR = (-102);
  UNZ_BADZIPFILE = (-103);
  UNZ_INTERNALERROR = (-104);
  UNZ_CRCERROR = (-105);
  APPEND_STATUS_CREATE = (0);
  APPEND_STATUS_CREATEAFTER = (1);
  APPEND_STATUS_ADDINZIP = (2);
  PLM_PACKET_INVALID_TS = -1;
  PLM_AUDIO_SAMPLES_PER_FRAME = 1152;
  PLM_BUFFER_DEFAULT_SIZE = (128*1024);

type
  sfSoundChannel = Integer;
  PsfSoundChannel = ^sfSoundChannel;

const
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

type
  sfSoundStatus = Integer;
  PsfSoundStatus = ^sfSoundStatus;

const
  sfStopped = 0;
  sfPaused = 1;
  sfPlaying = 2;

type
  sfBlendFactor = Integer;
  PsfBlendFactor = ^sfBlendFactor;

const
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

type
  sfBlendEquation = Integer;
  PsfBlendEquation = ^sfBlendEquation;

const
  sfBlendEquationAdd = 0;
  sfBlendEquationSubtract = 1;
  sfBlendEquationReverseSubtract = 2;
  sfBlendEquationMin = 3;
  sfBlendEquationMax = 4;

type
  sfPrimitiveType = Integer;
  PsfPrimitiveType = ^sfPrimitiveType;

const
  sfPoints = 0;
  sfLines = 1;
  sfLineStrip = 2;
  sfTriangles = 3;
  sfTriangleStrip = 4;
  sfTriangleFan = 5;

type
  sfCoordinateType = Integer;
  PsfCoordinateType = ^sfCoordinateType;

const
  sfCoordinateTypeNormalized = 0;
  sfCoordinateTypePixels = 1;

type
  sfStencilComparison = Integer;
  PsfStencilComparison = ^sfStencilComparison;

const
  sfStencilComparisonNever = 0;
  sfStencilComparisonLess = 1;
  sfStencilComparisonLessEqual = 2;
  sfStencilComparisonGreater = 3;
  sfStencilComparisonGreaterEqual = 4;
  sfStencilComparisonEqual = 5;
  sfStencilComparisonNotEqual = 6;
  sfStencilComparisonAlways = 7;

type
  sfStencilUpdateOperation = Integer;
  PsfStencilUpdateOperation = ^sfStencilUpdateOperation;

const
  sfStencilUpdateOperationKeep = 0;
  sfStencilUpdateOperationZero = 1;
  sfStencilUpdateOperationReplace = 2;
  sfStencilUpdateOperationIncrement = 3;
  sfStencilUpdateOperationDecrement = 4;
  sfStencilUpdateOperationInvert = 5;

const
  sfJoystickCount = 8;
  sfJoystickButtonCount = 32;
  sfJoystickAxisCount = 8;

type
  sfJoystickAxis = Integer;
  PsfJoystickAxis = ^sfJoystickAxis;

const
  sfJoystickX = 0;
  sfJoystickY = 1;
  sfJoystickZ = 2;
  sfJoystickR = 3;
  sfJoystickU = 4;
  sfJoystickV = 5;
  sfJoystickPovX = 6;
  sfJoystickPovY = 7;

type
  sfKeyCode = Integer;
  PsfKeyCode = ^sfKeyCode;

const
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

const
  sfKeyCount = 101;

type
  sfScancode = Integer;
  PsfScancode = ^sfScancode;

const
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

const
  sfScancodeCount = 146;

type
  sfMouseButton = Integer;
  PsfMouseButton = ^sfMouseButton;

const
  sfMouseLeft = 0;
  sfMouseRight = 1;
  sfMouseMiddle = 2;
  sfMouseButtonExtra1 = 3;
  sfMouseButtonExtra2 = 4;

const
  sfMouseButtonCount = 5;

type
  sfMouseWheel = Integer;
  PsfMouseWheel = ^sfMouseWheel;

const
  sfMouseVerticalWheel = 0;
  sfMouseHorizontalWheel = 1;

type
  sfSensorType = Integer;
  PsfSensorType = ^sfSensorType;

const
  sfSensorAccelerometer = 0;
  sfSensorGyroscope = 1;
  sfSensorMagnetometer = 2;
  sfSensorGravity = 3;
  sfSensorUserAcceleration = 4;
  sfSensorOrientation = 5;

const
  sfSensorCount = 6;

type
  sfEventType = Integer;
  PsfEventType = ^sfEventType;

const
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
  sfEvtMouseMovedRaw = 11;
  sfEvtMouseEntered = 12;
  sfEvtMouseLeft = 13;
  sfEvtJoystickButtonPressed = 14;
  sfEvtJoystickButtonReleased = 15;
  sfEvtJoystickMoved = 16;
  sfEvtJoystickConnected = 17;
  sfEvtJoystickDisconnected = 18;
  sfEvtTouchBegan = 19;
  sfEvtTouchMoved = 20;
  sfEvtTouchEnded = 21;
  sfEvtSensorChanged = 22;
  sfEvtCount = 23;

type
  sfWindowStyle = Integer;
  PsfWindowStyle = ^sfWindowStyle;

const
  sfNone = 0;
  sfTitlebar = 1;
  sfResize = 2;
  sfClose = 4;
  sfDefaultStyle = 7;

type
  sfWindowState = Integer;
  PsfWindowState = ^sfWindowState;

const
  sfWindowed = 0;
  sfFullscreen = 1;

type
  sfContextAttribute = Integer;
  PsfContextAttribute = ^sfContextAttribute;

const
  sfContextDefault = 0;
  sfContextCore = 1;
  sfContextDebug = 4;

type
  sfTextStyle = Integer;
  PsfTextStyle = ^sfTextStyle;

const
  sfTextRegular = 0;
  sfTextBold = 1;
  sfTextItalic = 2;
  sfTextUnderlined = 4;
  sfTextStrikeThrough = 8;

type
  sfVertexBufferUsage = Integer;
  PsfVertexBufferUsage = ^sfVertexBufferUsage;

const
  sfVertexBufferStream = 0;
  sfVertexBufferDynamic = 1;
  sfVertexBufferStatic = 2;

type
  sfCursorType = Integer;
  PsfCursorType = ^sfCursorType;

const
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

type
  sfFtpTransferMode = Integer;
  PsfFtpTransferMode = ^sfFtpTransferMode;

const
  sfFtpBinary = 0;
  sfFtpAscii = 1;
  sfFtpEbcdic = 2;

type
  sfFtpStatus = Integer;
  PsfFtpStatus = ^sfFtpStatus;

const
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

type
  sfHttpMethod = Integer;
  PsfHttpMethod = ^sfHttpMethod;

const
  sfHttpGet = 0;
  sfHttpPost = 1;
  sfHttpHead = 2;
  sfHttpPut = 3;
  sfHttpDelete = 4;

type
  sfHttpStatus = Integer;
  PsfHttpStatus = ^sfHttpStatus;

const
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

type
  sfSocketStatus = Integer;
  PsfSocketStatus = ^sfSocketStatus;

const
  sfSocketDone = 0;
  sfSocketNotReady = 1;
  sfSocketPartial = 2;
  sfSocketDisconnected = 3;
  sfSocketError = 4;

type
  // Forward declarations
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
  PsfListenerCone = ^sfListenerCone;
  PsfSoundSourceCone = ^sfSoundSourceCone;
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
  PsfStencilValue = ^sfStencilValue;
  PsfStencilMode = ^sfStencilMode;
  PsfRenderStates = ^sfRenderStates;
  PsfVertex = ^sfVertex;
  PsfJoystickIdentification = ^sfJoystickIdentification;
  PsfKeyEvent = ^sfKeyEvent;
  PsfTextEvent = ^sfTextEvent;
  PsfMouseMoveEvent = ^sfMouseMoveEvent;
  PsfMouseMoveRawEvent = ^sfMouseMoveRawEvent;
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
  Ptm_zip_s = ^tm_zip_s;
  Pzip_fileinfo = ^zip_fileinfo;
  Ptm_unz_s = ^tm_unz_s;
  Punz_file_info64_s = ^unz_file_info64_s;
  Pplm_packet_t = ^plm_packet_t;
  Pplm_plane_t = ^plm_plane_t;
  Pplm_frame_t = ^plm_frame_t;
  Pplm_samples_t = ^plm_samples_t;

  sfChar32 = UInt32;
  PsfChar32 = ^sfChar32;

  sfVector3f = record
    x: Single;
    y: Single;
    z: Single;
  end;

  sfListenerCone = record
    innerAngle: Single;
    outerAngle: Single;
    outerGain: Single;
  end;

  sfEffectProcessor = procedure(const inputFrames: PSingle; inputFrameCount: PCardinal; outputFrames: PSingle; outputFrameCount: PCardinal; frameChannelCount: Cardinal); cdecl;

  sfSoundSourceCone = record
    innerAngle: Single;
    outerAngle: Single;
    outerGain: Single;
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

  sfStencilValue = record
    value: Cardinal;
  end;

  sfStencilMode = record
    stencilComparison: sfStencilComparison;
    stencilUpdateOperation: sfStencilUpdateOperation;
    stencilReference: sfStencilValue;
    stencilMask: sfStencilValue;
    stencilOnly: Boolean;
  end;

  sfRenderStates = record
    blendMode: sfBlendMode;
    stencilMode: sfStencilMode;
    transform: sfTransform;
    coordinateType: sfCoordinateType;
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
    position: sfVector2i;
  end;

  sfMouseMoveRawEvent = record
    &type: sfEventType;
    delta: sfVector2i;
  end;

  sfMouseButtonEvent = record
    &type: sfEventType;
    button: sfMouseButton;
    position: sfVector2i;
  end;

  sfMouseWheelScrollEvent = record
    &type: sfEventType;
    wheel: sfMouseWheel;
    delta: Single;
    position: sfVector2i;
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
    size: sfVector2u;
  end;

  sfTouchEvent = record
    &type: sfEventType;
    finger: Cardinal;
    position: sfVector2i;
  end;

  sfSensorEvent = record
    &type: sfEventType;
    sensorType: sfSensorType;
    value: sfVector3f;
  end;

  PsfEvent = ^sfEvent;
  sfEvent = record
    case Integer of
      0: (&type: sfEventType);
      1: (size: sfSizeEvent);
      2: (key: sfKeyEvent);
      3: (text: sfTextEvent);
      4: (mouseMove: sfMouseMoveEvent);
      5: (mouseMoveRaw: sfMouseMoveRawEvent);
      6: (mouseButton: sfMouseButtonEvent);
      7: (mouseWheelScroll: sfMouseWheelScrollEvent);
      8: (joystickMove: sfJoystickMoveEvent);
      9: (joystickButton: sfJoystickButtonEvent);
      10: (joystickConnect: sfJoystickConnectEvent);
      11: (touch: sfTouchEvent);
      12: (sensor: sfSensorEvent);
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
  voidp = Pointer;
  unzFile = voidp;
  zipFile = voidp;
  uInt = Cardinal;
  uLong = Longword;
  Bytef = &Byte;
  PBytef = ^Bytef;

  tm_zip_s = record
    tm_sec: Integer;
    tm_min: Integer;
    tm_hour: Integer;
    tm_mday: Integer;
    tm_mon: Integer;
    tm_year: Integer;
  end;

  tm_zip = tm_zip_s;

  zip_fileinfo = record
    tmz_date: tm_zip;
    dosDate: uLong;
    internal_fa: uLong;
    external_fa: uLong;
  end;

  tm_unz_s = record
    tm_sec: Integer;
    tm_min: Integer;
    tm_hour: Integer;
    tm_mday: Integer;
    tm_mon: Integer;
    tm_year: Integer;
  end;

  tm_unz = tm_unz_s;

  unz_file_info64_s = record
    version: uLong;
    version_needed: uLong;
    flag: uLong;
    compression_method: uLong;
    dosDate: uLong;
    crc: uLong;
    compressed_size: UInt64;
    uncompressed_size: UInt64;
    size_filename: uLong;
    size_file_extra: uLong;
    size_file_comment: uLong;
    disk_num_start: uLong;
    internal_fa: uLong;
    external_fa: uLong;
    tmu_date: tm_unz;
  end;

  unz_file_info64 = unz_file_info64_s;
  Punz_file_info64 = ^unz_file_info64;
  Pplm_t = Pointer;
  PPplm_t = ^Pplm_t;
  Pplm_buffer_t = Pointer;
  PPplm_buffer_t = ^Pplm_buffer_t;
  Pplm_demux_t = Pointer;
  PPplm_demux_t = ^Pplm_demux_t;
  Pplm_video_t = Pointer;
  PPplm_video_t = ^Pplm_video_t;
  Pplm_audio_t = Pointer;
  PPplm_audio_t = ^Pplm_audio_t;

  plm_packet_t = record
    &type: Integer;
    pts: Double;
    length: NativeUInt;
    data: PUInt8;
  end;

  plm_plane_t = record
    width: Cardinal;
    height: Cardinal;
    data: PUInt8;
  end;

  plm_frame_t = record
    time: Double;
    width: Cardinal;
    height: Cardinal;
    y: plm_plane_t;
    cr: plm_plane_t;
    cb: plm_plane_t;
  end;

  plm_video_decode_callback = procedure(self: Pplm_t; frame: Pplm_frame_t; user: Pointer); cdecl;

  plm_samples_t = record
    time: Double;
    count: Cardinal;
    interleaved: array [0..2303] of Single;
  end;

  plm_audio_decode_callback = procedure(self: Pplm_t; samples: Pplm_samples_t; user: Pointer); cdecl;

  plm_buffer_load_callback = procedure(self: Pplm_buffer_t; user: Pointer); cdecl;

  cerr_callback = procedure(const text: PUTF8Char; user_data: Pointer); cdecl;

const
  PLM_DEMUX_PACKET_PRIVATE: Integer = $BD;
  PLM_DEMUX_PACKET_AUDIO_1: Integer = $C0;
  PLM_DEMUX_PACKET_AUDIO_2: Integer = $C1;
  PLM_DEMUX_PACKET_AUDIO_3: Integer = $C2;
  PLM_DEMUX_PACKET_AUDIO_4: Integer = $C3;
  PLM_DEMUX_PACKET_VIDEO_1: Integer = $E0;

procedure sfListener_setGlobalVolume(volume: Single); cdecl;
  external PSFML_DLL name _PU + 'sfListener_setGlobalVolume';

function sfListener_getGlobalVolume(): Single; cdecl;
  external PSFML_DLL name _PU + 'sfListener_getGlobalVolume';

procedure sfListener_setPosition(position: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfListener_setPosition';

function sfListener_getPosition(): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfListener_getPosition';

procedure sfListener_setDirection(direction: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfListener_setDirection';

function sfListener_getDirection(): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfListener_getDirection';

procedure sfListener_setVelocity(velocity: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfListener_setVelocity';

function sfListener_getVelocity(): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfListener_getVelocity';

procedure sfListener_setCone(cone: sfListenerCone); cdecl;
  external PSFML_DLL name _PU + 'sfListener_setCone';

function sfListener_getCone(): sfListenerCone; cdecl;
  external PSFML_DLL name _PU + 'sfListener_getCone';

procedure sfListener_setUpVector(upVector: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfListener_setUpVector';

function sfListener_getUpVector(): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfListener_getUpVector';

function sfTime_asSeconds(time: sfTime): Single; cdecl;
  external PSFML_DLL name _PU + 'sfTime_asSeconds';

function sfTime_asMilliseconds(time: sfTime): Int32; cdecl;
  external PSFML_DLL name _PU + 'sfTime_asMilliseconds';

function sfTime_asMicroseconds(time: sfTime): Int64; cdecl;
  external PSFML_DLL name _PU + 'sfTime_asMicroseconds';

function sfSeconds(amount: Single): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfSeconds';

function sfMilliseconds(amount: Int32): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfMilliseconds';

function sfMicroseconds(amount: Int64): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfMicroseconds';

function sfMusic_createFromFile(const filename: PUTF8Char): PsfMusic; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_createFromFile';

function sfMusic_createFromMemory(const data: Pointer; sizeInBytes: NativeUInt): PsfMusic; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_createFromMemory';

function sfMusic_createFromStream(stream: PsfInputStream): PsfMusic; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_createFromStream';

procedure sfMusic_destroy(const music: PsfMusic); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_destroy';

procedure sfMusic_setLooping(music: PsfMusic; loop: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setLooping';

function sfMusic_isLooping(const music: PsfMusic): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_isLooping';

procedure sfMusic_setEffectProcessor(music: PsfMusic; effectProcessor: sfEffectProcessor); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setEffectProcessor';

function sfMusic_getDuration(const music: PsfMusic): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getDuration';

function sfMusic_getLoopPoints(const music: PsfMusic): sfTimeSpan; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getLoopPoints';

procedure sfMusic_setLoopPoints(music: PsfMusic; timePoints: sfTimeSpan); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setLoopPoints';

procedure sfMusic_play(music: PsfMusic); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_play';

procedure sfMusic_pause(music: PsfMusic); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_pause';

procedure sfMusic_stop(music: PsfMusic); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_stop';

function sfMusic_getChannelCount(const music: PsfMusic): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getChannelCount';

function sfMusic_getSampleRate(const music: PsfMusic): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getSampleRate';

function sfMusic_getChannelMap(const music: PsfMusic; count: PNativeUInt): PsfSoundChannel; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getChannelMap';

function sfMusic_getStatus(const music: PsfMusic): sfSoundStatus; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getStatus';

function sfMusic_getPlayingOffset(const music: PsfMusic): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getPlayingOffset';

procedure sfMusic_setPitch(music: PsfMusic; pitch: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setPitch';

procedure sfMusic_setPan(music: PsfMusic; pan: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setPan';

procedure sfMusic_setVolume(music: PsfMusic; volume: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setVolume';

procedure sfMusic_setSpatializationEnabled(music: PsfMusic; enabled: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setSpatializationEnabled';

procedure sfMusic_setPosition(music: PsfMusic; position: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setPosition';

procedure sfMusic_setDirection(music: PsfMusic; direction: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setDirection';

procedure sfMusic_setCone(music: PsfMusic; cone: sfSoundSourceCone); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setCone';

procedure sfMusic_setVelocity(music: PsfMusic; velocity: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setVelocity';

procedure sfMusic_setDopplerFactor(music: PsfMusic; factor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setDopplerFactor';

procedure sfMusic_setDirectionalAttenuationFactor(music: PsfMusic; factor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setDirectionalAttenuationFactor';

procedure sfMusic_setRelativeToListener(music: PsfMusic; relative: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setRelativeToListener';

procedure sfMusic_setMinDistance(music: PsfMusic; distance: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setMinDistance';

procedure sfMusic_setMaxDistance(music: PsfMusic; distance: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setMaxDistance';

procedure sfMusic_setMinGain(music: PsfMusic; gain: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setMinGain';

procedure sfMusic_setMaxGain(music: PsfMusic; gain: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setMaxGain';

procedure sfMusic_setAttenuation(music: PsfMusic; attenuation: Single); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setAttenuation';

procedure sfMusic_setPlayingOffset(music: PsfMusic; timeOffset: sfTime); cdecl;
  external PSFML_DLL name _PU + 'sfMusic_setPlayingOffset';

function sfMusic_getPitch(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getPitch';

function sfMusic_getPan(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getPan';

function sfMusic_isSpatializationEnabled(const music: PsfMusic): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_isSpatializationEnabled';

function sfMusic_getVolume(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getVolume';

function sfMusic_getPosition(const music: PsfMusic): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getPosition';

function sfMusic_getDirection(const music: PsfMusic): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getDirection';

function sfMusic_getCone(const music: PsfMusic): sfSoundSourceCone; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getCone';

function sfMusic_getVelocity(const music: PsfMusic): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getVelocity';

function sfMusic_getDopplerFactor(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getDopplerFactor';

function sfMusic_getDirectionalAttenuationFactor(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getDirectionalAttenuationFactor';

function sfMusic_isRelativeToListener(const music: PsfMusic): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_isRelativeToListener';

function sfMusic_getMinDistance(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getMinDistance';

function sfMusic_getMaxDistance(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getMaxDistance';

function sfMusic_getMinGain(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getMinGain';

function sfMusic_getMaxGain(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getMaxGain';

function sfMusic_getAttenuation(const music: PsfMusic): Single; cdecl;
  external PSFML_DLL name _PU + 'sfMusic_getAttenuation';

function sfSound_create(const buffer: PsfSoundBuffer): PsfSound; cdecl;
  external PSFML_DLL name _PU + 'sfSound_create';

function sfSound_copy(const sound: PsfSound): PsfSound; cdecl;
  external PSFML_DLL name _PU + 'sfSound_copy';

procedure sfSound_destroy(const sound: PsfSound); cdecl;
  external PSFML_DLL name _PU + 'sfSound_destroy';

procedure sfSound_play(sound: PsfSound); cdecl;
  external PSFML_DLL name _PU + 'sfSound_play';

procedure sfSound_pause(sound: PsfSound); cdecl;
  external PSFML_DLL name _PU + 'sfSound_pause';

procedure sfSound_stop(sound: PsfSound); cdecl;
  external PSFML_DLL name _PU + 'sfSound_stop';

procedure sfSound_setBuffer(sound: PsfSound; const buffer: PsfSoundBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setBuffer';

function sfSound_getBuffer(const sound: PsfSound): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getBuffer';

procedure sfSound_setLooping(sound: PsfSound; loop: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setLooping';

function sfSound_isLooping(const sound: PsfSound): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSound_isLooping';

function sfSound_getStatus(const sound: PsfSound): sfSoundStatus; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getStatus';

procedure sfSound_setPitch(sound: PsfSound; pitch: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setPitch';

procedure sfSound_setPan(sound: PsfSound; pan: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setPan';

procedure sfSound_setVolume(sound: PsfSound; volume: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setVolume';

procedure sfSound_setSpatializationEnabled(sound: PsfSound; enabled: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setSpatializationEnabled';

procedure sfSound_setPosition(sound: PsfSound; position: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setPosition';

procedure sfSound_setDirection(sound: PsfSound; direction: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setDirection';

procedure sfSound_setCone(sound: PsfSound; cone: sfSoundSourceCone); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setCone';

procedure sfSound_setVelocity(sound: PsfSound; velocity: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setVelocity';

procedure sfSound_setDopplerFactor(sound: PsfSound; factor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setDopplerFactor';

procedure sfSound_setDirectionalAttenuationFactor(sound: PsfSound; factor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setDirectionalAttenuationFactor';

procedure sfSound_setRelativeToListener(sound: PsfSound; relative: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setRelativeToListener';

procedure sfSound_setMinDistance(sound: PsfSound; distance: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setMinDistance';

procedure sfSound_setMaxDistance(sound: PsfSound; distance: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setMaxDistance';

procedure sfSound_setMinGain(sound: PsfSound; gain: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setMinGain';

procedure sfSound_setMaxGain(sound: PsfSound; gain: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setMaxGain';

procedure sfSound_setAttenuation(sound: PsfSound; attenuation: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setAttenuation';

procedure sfSound_setPlayingOffset(sound: PsfSound; timeOffset: sfTime); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setPlayingOffset';

procedure sfSound_setEffectProcessor(sound: PsfSound; effectProcessor: sfEffectProcessor); cdecl;
  external PSFML_DLL name _PU + 'sfSound_setEffectProcessor';

function sfSound_getPitch(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getPitch';

function sfSound_getPan(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getPan';

function sfSound_getVolume(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getVolume';

function sfSound_isSpatializationEnabled(const sound: PsfSound): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSound_isSpatializationEnabled';

function sfSound_getPosition(const sound: PsfSound): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getPosition';

function sfSound_getDirection(const sound: PsfSound): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getDirection';

function sfSound_getCone(const sound: PsfSound): sfSoundSourceCone; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getCone';

function sfSound_getVelocity(const sound: PsfSound): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getVelocity';

function sfSound_getDopplerFactor(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getDopplerFactor';

function sfSound_getDirectionalAttenuationFactor(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getDirectionalAttenuationFactor';

function sfSound_isRelativeToListener(const sound: PsfSound): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSound_isRelativeToListener';

function sfSound_getMinDistance(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getMinDistance';

function sfSound_getMaxDistance(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getMaxDistance';

function sfSound_getMinGain(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getMinGain';

function sfSound_getMaxGain(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getMaxGain';

function sfSound_getAttenuation(const sound: PsfSound): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getAttenuation';

function sfSound_getPlayingOffset(const sound: PsfSound): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfSound_getPlayingOffset';

function sfSoundBuffer_createFromFile(const filename: PUTF8Char): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_createFromFile';

function sfSoundBuffer_createFromMemory(const data: Pointer; sizeInBytes: NativeUInt): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_createFromMemory';

function sfSoundBuffer_createFromStream(stream: PsfInputStream): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_createFromStream';

function sfSoundBuffer_createFromSamples(const samples: PInt16; sampleCount: UInt64; channelCount: Cardinal; sampleRate: Cardinal; channelMapData: PsfSoundChannel; channelMapSize: NativeUInt): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_createFromSamples';

function sfSoundBuffer_copy(const soundBuffer: PsfSoundBuffer): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_copy';

procedure sfSoundBuffer_destroy(const soundBuffer: PsfSoundBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_destroy';

function sfSoundBuffer_saveToFile(const soundBuffer: PsfSoundBuffer; const filename: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_saveToFile';

function sfSoundBuffer_getSamples(const soundBuffer: PsfSoundBuffer): PInt16; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_getSamples';

function sfSoundBuffer_getSampleCount(const soundBuffer: PsfSoundBuffer): UInt64; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_getSampleCount';

function sfSoundBuffer_getSampleRate(const soundBuffer: PsfSoundBuffer): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_getSampleRate';

function sfSoundBuffer_getChannelCount(const soundBuffer: PsfSoundBuffer): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_getChannelCount';

function sfSoundBuffer_getChannelMap(const soundBuffer: PsfSoundBuffer; count: PNativeUInt): PsfSoundChannel; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_getChannelMap';

function sfSoundBuffer_getDuration(const soundBuffer: PsfSoundBuffer): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBuffer_getDuration';

function sfSoundBufferRecorder_create(): PsfSoundBufferRecorder; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_create';

procedure sfSoundBufferRecorder_destroy(const soundBufferRecorder: PsfSoundBufferRecorder); cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_destroy';

function sfSoundBufferRecorder_start(soundBufferRecorder: PsfSoundBufferRecorder; sampleRate: Cardinal): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_start';

procedure sfSoundBufferRecorder_stop(soundBufferRecorder: PsfSoundBufferRecorder); cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_stop';

function sfSoundBufferRecorder_getSampleRate(const soundBufferRecorder: PsfSoundBufferRecorder): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_getSampleRate';

function sfSoundBufferRecorder_getBuffer(const soundBufferRecorder: PsfSoundBufferRecorder): PsfSoundBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_getBuffer';

function sfSoundBufferRecorder_setDevice(soundBufferRecorder: PsfSoundBufferRecorder; const name: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_setDevice';

function sfSoundBufferRecorder_getDevice(soundBufferRecorder: PsfSoundBufferRecorder): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_getDevice';

procedure sfSoundBufferRecorder_setChannelCount(soundBufferRecorder: PsfSoundBufferRecorder; channelCount: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_setChannelCount';

function sfSoundBufferRecorder_getChannelCount(const soundBufferRecorder: PsfSoundBufferRecorder): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundBufferRecorder_getChannelCount';

function sfSoundRecorder_create(onStart: sfSoundRecorderStartCallback; onProcess: sfSoundRecorderProcessCallback; onStop: sfSoundRecorderStopCallback; userData: Pointer): PsfSoundRecorder; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_create';

procedure sfSoundRecorder_destroy(const soundRecorder: PsfSoundRecorder); cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_destroy';

function sfSoundRecorder_start(soundRecorder: PsfSoundRecorder; sampleRate: Cardinal): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_start';

procedure sfSoundRecorder_stop(soundRecorder: PsfSoundRecorder); cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_stop';

function sfSoundRecorder_getSampleRate(const soundRecorder: PsfSoundRecorder): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_getSampleRate';

function sfSoundRecorder_isAvailable(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_isAvailable';

function sfSoundRecorder_getAvailableDevices(count: PNativeUInt): PPUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_getAvailableDevices';

function sfSoundRecorder_getDefaultDevice(): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_getDefaultDevice';

function sfSoundRecorder_setDevice(soundRecorder: PsfSoundRecorder; const name: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_setDevice';

function sfSoundRecorder_getDevice(soundRecorder: PsfSoundRecorder): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_getDevice';

procedure sfSoundRecorder_setChannelCount(soundRecorder: PsfSoundRecorder; channelCount: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_setChannelCount';

function sfSoundRecorder_getChannelCount(const soundRecorder: PsfSoundRecorder): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_getChannelCount';

function sfSoundRecorder_getChannelMap(const soundRecorder: PsfSoundRecorder; count: PNativeUInt): PsfSoundChannel; cdecl;
  external PSFML_DLL name _PU + 'sfSoundRecorder_getChannelMap';

function sfSoundStream_create(onGetData: sfSoundStreamGetDataCallback; onSeek: sfSoundStreamSeekCallback; channelCount: Cardinal; sampleRate: Cardinal; channelMapData: PsfSoundChannel; channelMapSize: NativeUInt; userData: Pointer): PsfSoundStream; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_create';

procedure sfSoundStream_destroy(const soundStream: PsfSoundStream); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_destroy';

procedure sfSoundStream_play(soundStream: PsfSoundStream); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_play';

procedure sfSoundStream_pause(soundStream: PsfSoundStream); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_pause';

procedure sfSoundStream_stop(soundStream: PsfSoundStream); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_stop';

function sfSoundStream_getStatus(const soundStream: PsfSoundStream): sfSoundStatus; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getStatus';

function sfSoundStream_getChannelCount(const soundStream: PsfSoundStream): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getChannelCount';

function sfSoundStream_getSampleRate(const soundStream: PsfSoundStream): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getSampleRate';

function sfSoundStream_getChannelMap(const soundStream: PsfSoundStream; count: PNativeUInt): PsfSoundChannel; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getChannelMap';

procedure sfSoundStream_setPitch(soundStream: PsfSoundStream; pitch: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setPitch';

procedure sfSoundStream_setPan(soundStream: PsfSoundStream; pan: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setPan';

procedure sfSoundStream_setVolume(soundStream: PsfSoundStream; volume: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setVolume';

procedure sfSoundStream_setSpatializationEnabled(soundStream: PsfSoundStream; enabled: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setSpatializationEnabled';

procedure sfSoundStream_setPosition(soundStream: PsfSoundStream; position: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setPosition';

procedure sfSoundStream_setDirection(soundStream: PsfSoundStream; direction: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setDirection';

procedure sfSoundStream_setCone(soundStream: PsfSoundStream; cone: sfSoundSourceCone); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setCone';

procedure sfSoundStream_setVelocity(soundStream: PsfSoundStream; velocity: sfVector3f); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setVelocity';

procedure sfSoundStream_setDopplerFactor(soundStream: PsfSoundStream; factor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setDopplerFactor';

procedure sfSoundStream_setDirectionalAttenuationFactor(soundStream: PsfSoundStream; factor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setDirectionalAttenuationFactor';

procedure sfSoundStream_setRelativeToListener(soundStream: PsfSoundStream; relative: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setRelativeToListener';

procedure sfSoundStream_setMinDistance(soundStream: PsfSoundStream; distance: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setMinDistance';

procedure sfSoundStream_setMaxDistance(soundStream: PsfSoundStream; distance: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setMaxDistance';

procedure sfSoundStream_setMinGain(soundStream: PsfSoundStream; gain: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setMinGain';

procedure sfSoundStream_setMaxGain(soundStream: PsfSoundStream; gain: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setMaxGain';

procedure sfSoundStream_setAttenuation(soundStream: PsfSoundStream; attenuation: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setAttenuation';

procedure sfSoundStream_setPlayingOffset(soundStream: PsfSoundStream; timeOffset: sfTime); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setPlayingOffset';

procedure sfSoundStream_setLooping(soundStream: PsfSoundStream; loop: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setLooping';

function sfSoundStream_getPitch(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getPitch';

function sfSoundStream_getPan(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getPan';

function sfSoundStream_getVolume(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getVolume';

function sfSoundStream_isSpatializationEnabled(const soundStream: PsfSoundStream): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_isSpatializationEnabled';

function sfSoundStream_getPosition(const soundStream: PsfSoundStream): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getPosition';

function sfSoundStream_getDirection(const soundStream: PsfSoundStream): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getDirection';

function sfSoundStream_getCone(const soundStream: PsfSoundStream): sfSoundSourceCone; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getCone';

function sfSoundStream_getVelocity(const soundStream: PsfSoundStream): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getVelocity';

function sfSoundStream_getDopplerFactor(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getDopplerFactor';

function sfSoundStream_getDirectionalAttenuationFactor(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getDirectionalAttenuationFactor';

function sfSoundStream_isRelativeToListener(const soundStream: PsfSoundStream): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_isRelativeToListener';

function sfSoundStream_getMinDistance(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getMinDistance';

function sfSoundStream_getMaxDistance(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getMaxDistance';

function sfSoundStream_getMinGain(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getMinGain';

function sfSoundStream_getMaxGain(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getMaxGain';

function sfSoundStream_getAttenuation(const soundStream: PsfSoundStream): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getAttenuation';

function sfSoundStream_isLooping(const soundStream: PsfSoundStream): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_isLooping';

procedure sfSoundStream_setEffectProcessor(soundStream: PsfSoundStream; effectProcessor: sfEffectProcessor); cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_setEffectProcessor';

function sfSoundStream_getPlayingOffset(const soundStream: PsfSoundStream): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfSoundStream_getPlayingOffset';

function sfBuffer_create(): PsfBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfBuffer_create';

procedure sfBuffer_destroy(const buffer: PsfBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfBuffer_destroy';

function sfBuffer_getSize(const buffer: PsfBuffer): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfBuffer_getSize';

function sfBuffer_getData(const buffer: PsfBuffer): PUInt8; cdecl;
  external PSFML_DLL name _PU + 'sfBuffer_getData';

function sfClock_create(): PsfClock; cdecl;
  external PSFML_DLL name _PU + 'sfClock_create';

function sfClock_copy(const clock: PsfClock): PsfClock; cdecl;
  external PSFML_DLL name _PU + 'sfClock_copy';

procedure sfClock_destroy(const clock: PsfClock); cdecl;
  external PSFML_DLL name _PU + 'sfClock_destroy';

function sfClock_getElapsedTime(const clock: PsfClock): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfClock_getElapsedTime';

function sfClock_isRunning(const clock: PsfClock): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfClock_isRunning';

procedure sfClock_start(clock: PsfClock); cdecl;
  external PSFML_DLL name _PU + 'sfClock_start';

procedure sfClock_stop(clock: PsfClock); cdecl;
  external PSFML_DLL name _PU + 'sfClock_stop';

function sfClock_restart(clock: PsfClock): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfClock_restart';

function sfClock_reset(clock: PsfClock): sfTime; cdecl;
  external PSFML_DLL name _PU + 'sfClock_reset';

procedure sfSleep(duration: sfTime); cdecl;
  external PSFML_DLL name _PU + 'sfSleep';

function sfColor_fromRGB(red: UInt8; green: UInt8; blue: UInt8): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_fromRGB';

function sfColor_fromRGBA(red: UInt8; green: UInt8; blue: UInt8; alpha: UInt8): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_fromRGBA';

function sfColor_fromInteger(color: UInt32): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_fromInteger';

function sfColor_toInteger(color: sfColor): UInt32; cdecl;
  external PSFML_DLL name _PU + 'sfColor_toInteger';

function sfColor_add(color1: sfColor; color2: sfColor): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_add';

function sfColor_subtract(color1: sfColor; color2: sfColor): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_subtract';

function sfColor_modulate(color1: sfColor; color2: sfColor): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfColor_modulate';

function sfFloatRect_contains(const rect: PsfFloatRect; point: sfVector2f): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfFloatRect_contains';

function sfIntRect_contains(const rect: PsfIntRect; point: sfVector2i): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfIntRect_contains';

function sfFloatRect_intersects(const rect1: PsfFloatRect; const rect2: PsfFloatRect; intersection: PsfFloatRect): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfFloatRect_intersects';

function sfIntRect_intersects(const rect1: PsfIntRect; const rect2: PsfIntRect; intersection: PsfIntRect): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfIntRect_intersects';

function sfTransform_fromMatrix(a00: Single; a01: Single; a02: Single; a10: Single; a11: Single; a12: Single; a20: Single; a21: Single; a22: Single): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfTransform_fromMatrix';

procedure sfTransform_getMatrix(const transform: PsfTransform; matrix: PSingle); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_getMatrix';

function sfTransform_getInverse(const transform: PsfTransform): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfTransform_getInverse';

function sfTransform_transformPoint(const transform: PsfTransform; point: sfVector2f): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfTransform_transformPoint';

function sfTransform_transformRect(const transform: PsfTransform; rectangle: sfFloatRect): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfTransform_transformRect';

procedure sfTransform_combine(transform: PsfTransform; const other: PsfTransform); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_combine';

procedure sfTransform_translate(transform: PsfTransform; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_translate';

procedure sfTransform_rotate(transform: PsfTransform; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_rotate';

procedure sfTransform_rotateWithCenter(transform: PsfTransform; angle: Single; center: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_rotateWithCenter';

procedure sfTransform_scale(transform: PsfTransform; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_scale';

procedure sfTransform_scaleWithCenter(transform: PsfTransform; scale: sfVector2f; center: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransform_scaleWithCenter';

function sfTransform_equal(left: PsfTransform; right: PsfTransform): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfTransform_equal';

function sfCircleShape_create(): PsfCircleShape; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_create';

function sfCircleShape_copy(const shape: PsfCircleShape): PsfCircleShape; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_copy';

procedure sfCircleShape_destroy(const shape: PsfCircleShape); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_destroy';

procedure sfCircleShape_setPosition(shape: PsfCircleShape; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setPosition';

procedure sfCircleShape_setRotation(shape: PsfCircleShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setRotation';

procedure sfCircleShape_setScale(shape: PsfCircleShape; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setScale';

procedure sfCircleShape_setOrigin(shape: PsfCircleShape; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setOrigin';

function sfCircleShape_getPosition(const shape: PsfCircleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getPosition';

function sfCircleShape_getRotation(const shape: PsfCircleShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getRotation';

function sfCircleShape_getScale(const shape: PsfCircleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getScale';

function sfCircleShape_getOrigin(const shape: PsfCircleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getOrigin';

procedure sfCircleShape_move(shape: PsfCircleShape; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_move';

procedure sfCircleShape_rotate(shape: PsfCircleShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_rotate';

procedure sfCircleShape_scale(shape: PsfCircleShape; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_scale';

function sfCircleShape_getTransform(const shape: PsfCircleShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getTransform';

function sfCircleShape_getInverseTransform(const shape: PsfCircleShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getInverseTransform';

procedure sfCircleShape_setTexture(shape: PsfCircleShape; const texture: PsfTexture; resetRect: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setTexture';

procedure sfCircleShape_setTextureRect(shape: PsfCircleShape; rect: sfIntRect); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setTextureRect';

procedure sfCircleShape_setFillColor(shape: PsfCircleShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setFillColor';

procedure sfCircleShape_setOutlineColor(shape: PsfCircleShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setOutlineColor';

procedure sfCircleShape_setOutlineThickness(shape: PsfCircleShape; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setOutlineThickness';

function sfCircleShape_getTexture(const shape: PsfCircleShape): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getTexture';

function sfCircleShape_getTextureRect(const shape: PsfCircleShape): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getTextureRect';

function sfCircleShape_getFillColor(const shape: PsfCircleShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getFillColor';

function sfCircleShape_getOutlineColor(const shape: PsfCircleShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getOutlineColor';

function sfCircleShape_getOutlineThickness(const shape: PsfCircleShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getOutlineThickness';

function sfCircleShape_getPointCount(const shape: PsfCircleShape): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getPointCount';

function sfCircleShape_getPoint(const shape: PsfCircleShape; index: NativeUInt): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getPoint';

function sfCircleShape_getGeometricCenter(const shape: PsfCircleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getGeometricCenter';

procedure sfCircleShape_setRadius(shape: PsfCircleShape; radius: Single); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setRadius';

function sfCircleShape_getRadius(const shape: PsfCircleShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getRadius';

procedure sfCircleShape_setPointCount(shape: PsfCircleShape; count: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_setPointCount';

function sfCircleShape_getLocalBounds(const shape: PsfCircleShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getLocalBounds';

function sfCircleShape_getGlobalBounds(const shape: PsfCircleShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfCircleShape_getGlobalBounds';

function sfConvexShape_create(): PsfConvexShape; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_create';

function sfConvexShape_copy(const shape: PsfConvexShape): PsfConvexShape; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_copy';

procedure sfConvexShape_destroy(const shape: PsfConvexShape); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_destroy';

procedure sfConvexShape_setPosition(shape: PsfConvexShape; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setPosition';

procedure sfConvexShape_setRotation(shape: PsfConvexShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setRotation';

procedure sfConvexShape_setScale(shape: PsfConvexShape; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setScale';

procedure sfConvexShape_setOrigin(shape: PsfConvexShape; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setOrigin';

function sfConvexShape_getPosition(const shape: PsfConvexShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getPosition';

function sfConvexShape_getRotation(const shape: PsfConvexShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getRotation';

function sfConvexShape_getScale(const shape: PsfConvexShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getScale';

function sfConvexShape_getOrigin(const shape: PsfConvexShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getOrigin';

procedure sfConvexShape_move(shape: PsfConvexShape; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_move';

procedure sfConvexShape_rotate(shape: PsfConvexShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_rotate';

procedure sfConvexShape_scale(shape: PsfConvexShape; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_scale';

function sfConvexShape_getTransform(const shape: PsfConvexShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getTransform';

function sfConvexShape_getInverseTransform(const shape: PsfConvexShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getInverseTransform';

procedure sfConvexShape_setTexture(shape: PsfConvexShape; const texture: PsfTexture; resetRect: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setTexture';

procedure sfConvexShape_setTextureRect(shape: PsfConvexShape; rect: sfIntRect); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setTextureRect';

procedure sfConvexShape_setFillColor(shape: PsfConvexShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setFillColor';

procedure sfConvexShape_setOutlineColor(shape: PsfConvexShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setOutlineColor';

procedure sfConvexShape_setOutlineThickness(shape: PsfConvexShape; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setOutlineThickness';

function sfConvexShape_getTexture(const shape: PsfConvexShape): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getTexture';

function sfConvexShape_getTextureRect(const shape: PsfConvexShape): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getTextureRect';

function sfConvexShape_getFillColor(const shape: PsfConvexShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getFillColor';

function sfConvexShape_getOutlineColor(const shape: PsfConvexShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getOutlineColor';

function sfConvexShape_getOutlineThickness(const shape: PsfConvexShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getOutlineThickness';

function sfConvexShape_getPointCount(const shape: PsfConvexShape): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getPointCount';

function sfConvexShape_getPoint(const shape: PsfConvexShape; index: NativeUInt): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getPoint';

function sfConvexShape_getGeometricCenter(const shape: PsfConvexShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getGeometricCenter';

procedure sfConvexShape_setPointCount(shape: PsfConvexShape; count: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setPointCount';

procedure sfConvexShape_setPoint(shape: PsfConvexShape; index: NativeUInt; point: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_setPoint';

function sfConvexShape_getLocalBounds(const shape: PsfConvexShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getLocalBounds';

function sfConvexShape_getGlobalBounds(const shape: PsfConvexShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfConvexShape_getGlobalBounds';

function sfFont_createFromFile(const filename: PUTF8Char): PsfFont; cdecl;
  external PSFML_DLL name _PU + 'sfFont_createFromFile';

function sfFont_createFromMemory(const data: Pointer; sizeInBytes: NativeUInt): PsfFont; cdecl;
  external PSFML_DLL name _PU + 'sfFont_createFromMemory';

function sfFont_createFromStream(stream: PsfInputStream): PsfFont; cdecl;
  external PSFML_DLL name _PU + 'sfFont_createFromStream';

function sfFont_copy(const font: PsfFont): PsfFont; cdecl;
  external PSFML_DLL name _PU + 'sfFont_copy';

procedure sfFont_destroy(const font: PsfFont); cdecl;
  external PSFML_DLL name _PU + 'sfFont_destroy';

function sfFont_getGlyph(const font: PsfFont; codePoint: UInt32; characterSize: Cardinal; bold: Boolean; outlineThickness: Single): sfGlyph; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getGlyph';

function sfFont_hasGlyph(const font: PsfFont; codePoint: UInt32): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfFont_hasGlyph';

function sfFont_getKerning(const font: PsfFont; first: UInt32; second: UInt32; characterSize: Cardinal): Single; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getKerning';

function sfFont_getBoldKerning(const font: PsfFont; first: UInt32; second: UInt32; characterSize: Cardinal): Single; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getBoldKerning';

function sfFont_getLineSpacing(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getLineSpacing';

function sfFont_getUnderlinePosition(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getUnderlinePosition';

function sfFont_getUnderlineThickness(const font: PsfFont; characterSize: Cardinal): Single; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getUnderlineThickness';

function sfFont_getTexture(font: PsfFont; characterSize: Cardinal): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getTexture';

procedure sfFont_setSmooth(font: PsfFont; smooth: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfFont_setSmooth';

function sfFont_isSmooth(const font: PsfFont): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfFont_isSmooth';

function sfFont_getInfo(const font: PsfFont): sfFontInfo; cdecl;
  external PSFML_DLL name _PU + 'sfFont_getInfo';

function sfImage_create(size: sfVector2u): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_create';

function sfImage_createFromColor(size: sfVector2u; color: sfColor): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_createFromColor';

function sfImage_createFromPixels(size: sfVector2u; const pixels: PUInt8): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_createFromPixels';

function sfImage_createFromFile(const filename: PUTF8Char): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_createFromFile';

function sfImage_createFromMemory(const data: Pointer; size: NativeUInt): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_createFromMemory';

function sfImage_createFromStream(stream: PsfInputStream): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_createFromStream';

function sfImage_copy(const image: PsfImage): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfImage_copy';

procedure sfImage_destroy(const image: PsfImage); cdecl;
  external PSFML_DLL name _PU + 'sfImage_destroy';

function sfImage_saveToFile(const image: PsfImage; const filename: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfImage_saveToFile';

function sfImage_saveToMemory(const image: PsfImage; output: PsfBuffer; const format: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfImage_saveToMemory';

function sfImage_getSize(const image: PsfImage): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfImage_getSize';

procedure sfImage_createMaskFromColor(image: PsfImage; color: sfColor; alpha: UInt8); cdecl;
  external PSFML_DLL name _PU + 'sfImage_createMaskFromColor';

function sfImage_copyImage(image: PsfImage; const source: PsfImage; dest: sfVector2u; sourceRect: sfIntRect; applyAlpha: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfImage_copyImage';

procedure sfImage_setPixel(image: PsfImage; coords: sfVector2u; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfImage_setPixel';

function sfImage_getPixel(const image: PsfImage; coords: sfVector2u): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfImage_getPixel';

function sfImage_getPixelsPtr(const image: PsfImage): PUInt8; cdecl;
  external PSFML_DLL name _PU + 'sfImage_getPixelsPtr';

procedure sfImage_flipHorizontally(image: PsfImage); cdecl;
  external PSFML_DLL name _PU + 'sfImage_flipHorizontally';

procedure sfImage_flipVertically(image: PsfImage); cdecl;
  external PSFML_DLL name _PU + 'sfImage_flipVertically';

function sfRectangleShape_create(): PsfRectangleShape; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_create';

function sfRectangleShape_copy(const shape: PsfRectangleShape): PsfRectangleShape; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_copy';

procedure sfRectangleShape_destroy(const shape: PsfRectangleShape); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_destroy';

procedure sfRectangleShape_setPosition(shape: PsfRectangleShape; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setPosition';

procedure sfRectangleShape_setRotation(shape: PsfRectangleShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setRotation';

procedure sfRectangleShape_setScale(shape: PsfRectangleShape; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setScale';

procedure sfRectangleShape_setOrigin(shape: PsfRectangleShape; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setOrigin';

function sfRectangleShape_getPosition(const shape: PsfRectangleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getPosition';

function sfRectangleShape_getRotation(const shape: PsfRectangleShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getRotation';

function sfRectangleShape_getScale(const shape: PsfRectangleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getScale';

function sfRectangleShape_getOrigin(const shape: PsfRectangleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getOrigin';

procedure sfRectangleShape_move(shape: PsfRectangleShape; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_move';

procedure sfRectangleShape_rotate(shape: PsfRectangleShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_rotate';

procedure sfRectangleShape_scale(shape: PsfRectangleShape; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_scale';

function sfRectangleShape_getTransform(const shape: PsfRectangleShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getTransform';

function sfRectangleShape_getInverseTransform(const shape: PsfRectangleShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getInverseTransform';

procedure sfRectangleShape_setTexture(shape: PsfRectangleShape; const texture: PsfTexture; resetRect: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setTexture';

procedure sfRectangleShape_setTextureRect(shape: PsfRectangleShape; rect: sfIntRect); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setTextureRect';

procedure sfRectangleShape_setFillColor(shape: PsfRectangleShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setFillColor';

procedure sfRectangleShape_setOutlineColor(shape: PsfRectangleShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setOutlineColor';

procedure sfRectangleShape_setOutlineThickness(shape: PsfRectangleShape; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setOutlineThickness';

function sfRectangleShape_getTexture(const shape: PsfRectangleShape): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getTexture';

function sfRectangleShape_getTextureRect(const shape: PsfRectangleShape): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getTextureRect';

function sfRectangleShape_getFillColor(const shape: PsfRectangleShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getFillColor';

function sfRectangleShape_getOutlineColor(const shape: PsfRectangleShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getOutlineColor';

function sfRectangleShape_getOutlineThickness(const shape: PsfRectangleShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getOutlineThickness';

function sfRectangleShape_getPointCount(const shape: PsfRectangleShape): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getPointCount';

function sfRectangleShape_getPoint(const shape: PsfRectangleShape; index: NativeUInt): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getPoint';

function sfRectangleShape_getGeometricCenter(const shape: PsfRectangleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getGeometricCenter';

procedure sfRectangleShape_setSize(shape: PsfRectangleShape; size: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_setSize';

function sfRectangleShape_getSize(const shape: PsfRectangleShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getSize';

function sfRectangleShape_getLocalBounds(const shape: PsfRectangleShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getLocalBounds';

function sfRectangleShape_getGlobalBounds(const shape: PsfRectangleShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfRectangleShape_getGlobalBounds';

function sfJoystick_isConnected(joystick: Cardinal): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_isConnected';

function sfJoystick_getButtonCount(joystick: Cardinal): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_getButtonCount';

function sfJoystick_hasAxis(joystick: Cardinal; axis: sfJoystickAxis): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_hasAxis';

function sfJoystick_isButtonPressed(joystick: Cardinal; button: Cardinal): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_isButtonPressed';

function sfJoystick_getAxisPosition(joystick: Cardinal; axis: sfJoystickAxis): Single; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_getAxisPosition';

function sfJoystick_getIdentification(joystick: Cardinal): sfJoystickIdentification; cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_getIdentification';

procedure sfJoystick_update(); cdecl;
  external PSFML_DLL name _PU + 'sfJoystick_update';

function sfKeyboard_isKeyPressed(key: sfKeyCode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_isKeyPressed';

function sfKeyboard_isScancodePressed(code: sfScancode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_isScancodePressed';

function sfKeyboard_localize(code: sfScancode): sfKeyCode; cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_localize';

function sfKeyboard_delocalize(key: sfKeyCode): sfScancode; cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_delocalize';

function sfKeyboard_getDescription(code: sfScancode): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_getDescription';

procedure sfKeyboard_setVirtualKeyboardVisible(visible: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfKeyboard_setVirtualKeyboardVisible';

function sfMouse_isButtonPressed(button: sfMouseButton): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfMouse_isButtonPressed';

function sfMouse_getPosition(const relativeTo: PsfWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfMouse_getPosition';

procedure sfMouse_setPosition(position: sfVector2i; const relativeTo: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'sfMouse_setPosition';

function sfMouse_getPositionWindowBase(const relativeTo: PsfWindowBase): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfMouse_getPositionWindowBase';

procedure sfMouse_setPositionWindowBase(position: sfVector2i; const relativeTo: PsfWindowBase); cdecl;
  external PSFML_DLL name _PU + 'sfMouse_setPositionWindowBase';

function sfSensor_isAvailable(sensor: sfSensorType): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSensor_isAvailable';

procedure sfSensor_setEnabled(sensor: sfSensorType; enabled: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfSensor_setEnabled';

function sfSensor_getValue(sensor: sfSensorType): sfVector3f; cdecl;
  external PSFML_DLL name _PU + 'sfSensor_getValue';

function sfVideoMode_getDesktopMode(): sfVideoMode; cdecl;
  external PSFML_DLL name _PU + 'sfVideoMode_getDesktopMode';

function sfVideoMode_getFullscreenModes(count: PNativeUInt): PsfVideoMode; cdecl;
  external PSFML_DLL name _PU + 'sfVideoMode_getFullscreenModes';

function sfVideoMode_isValid(mode: sfVideoMode): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfVideoMode_isValid';

function sfVulkan_isAvailable(requireGraphics: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfVulkan_isAvailable';

function sfVulkan_getFunction(const name: PUTF8Char): sfVulkanFunctionPointer; cdecl;
  external PSFML_DLL name _PU + 'sfVulkan_getFunction';

function sfVulkan_getGraphicsRequiredInstanceExtensions(count: PNativeUInt): PPUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfVulkan_getGraphicsRequiredInstanceExtensions';

function sfWindowBase_create(mode: sfVideoMode; const title: PUTF8Char; style: UInt32; state: sfWindowState): PsfWindowBase; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_create';

function sfWindowBase_createUnicode(mode: sfVideoMode; const title: PsfChar32; style: UInt32; state: sfWindowState): PsfWindowBase; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_createUnicode';

function sfWindowBase_createFromHandle(handle: sfWindowHandle): PsfWindowBase; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_createFromHandle';

procedure sfWindowBase_destroy(const windowBase: PsfWindowBase); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_destroy';

procedure sfWindowBase_close(windowBase: PsfWindowBase); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_close';

function sfWindowBase_isOpen(const windowBase: PsfWindowBase): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_isOpen';

function sfWindowBase_pollEvent(windowBase: PsfWindowBase; event: PsfEvent): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_pollEvent';

function sfWindowBase_waitEvent(windowBase: PsfWindowBase; timeout: sfTime; event: PsfEvent): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_waitEvent';

function sfWindowBase_getPosition(const windowBase: PsfWindowBase): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_getPosition';

procedure sfWindowBase_setPosition(windowBase: PsfWindowBase; position: sfVector2i); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setPosition';

function sfWindowBase_getSize(const windowBase: PsfWindowBase): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_getSize';

procedure sfWindowBase_setSize(windowBase: PsfWindowBase; size: sfVector2u); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setSize';

procedure sfWindowBase_setTitle(windowBase: PsfWindowBase; const title: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setTitle';

procedure sfWindowBase_setUnicodeTitle(windowBase: PsfWindowBase; const title: PsfChar32); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setUnicodeTitle';

procedure sfWindowBase_setIcon(windowBase: PsfWindowBase; size: sfVector2u; const pixels: PUInt8); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setIcon';

procedure sfWindowBase_setVisible(windowBase: PsfWindowBase; visible: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setVisible';

procedure sfWindowBase_setMouseCursorVisible(windowBase: PsfWindowBase; visible: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setMouseCursorVisible';

procedure sfWindowBase_setMouseCursorGrabbed(windowBase: PsfWindowBase; grabbed: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setMouseCursorGrabbed';

procedure sfWindowBase_setMouseCursor(windowBase: PsfWindowBase; const cursor: PsfCursor); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setMouseCursor';

procedure sfWindowBase_setKeyRepeatEnabled(windowBase: PsfWindowBase; enabled: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setKeyRepeatEnabled';

procedure sfWindowBase_setJoystickThreshold(windowBase: PsfWindowBase; threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_setJoystickThreshold';

procedure sfWindowBase_requestFocus(windowBase: PsfWindowBase); cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_requestFocus';

function sfWindowBase_hasFocus(const windowBase: PsfWindowBase): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_hasFocus';

function sfWindowBase_getNativeHandle(const windowBase: PsfWindowBase): sfWindowHandle; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_getNativeHandle';

function sfWindowBase_createVulkanSurface(windowBase: PsfWindowBase; const instance: PVkInstance; surface: PVkSurfaceKHR; const allocator: PVkAllocationCallbacks): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfWindowBase_createVulkanSurface';

function sfWindow_create(mode: sfVideoMode; const title: PUTF8Char; style: UInt32; state: sfWindowState; const settings: PsfContextSettings): PsfWindow; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_create';

function sfWindow_createUnicode(mode: sfVideoMode; const title: PsfChar32; style: UInt32; state: sfWindowState; const settings: PsfContextSettings): PsfWindow; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_createUnicode';

function sfWindow_createFromHandle(handle: sfWindowHandle; const settings: PsfContextSettings): PsfWindow; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_createFromHandle';

procedure sfWindow_destroy(const window: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_destroy';

procedure sfWindow_close(window: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_close';

function sfWindow_isOpen(const window: PsfWindow): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_isOpen';

function sfWindow_getSettings(const window: PsfWindow): sfContextSettings; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_getSettings';

function sfWindow_pollEvent(window: PsfWindow; event: PsfEvent): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_pollEvent';

function sfWindow_waitEvent(window: PsfWindow; timeout: sfTime; event: PsfEvent): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_waitEvent';

function sfWindow_getPosition(const window: PsfWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_getPosition';

procedure sfWindow_setPosition(window: PsfWindow; position: sfVector2i); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setPosition';

function sfWindow_getSize(const window: PsfWindow): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_getSize';

procedure sfWindow_setSize(window: PsfWindow; size: sfVector2u); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setSize';

procedure sfWindow_setTitle(window: PsfWindow; const title: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setTitle';

procedure sfWindow_setUnicodeTitle(window: PsfWindow; const title: PsfChar32); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setUnicodeTitle';

procedure sfWindow_setIcon(window: PsfWindow; size: sfVector2u; const pixels: PUInt8); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setIcon';

procedure sfWindow_setVisible(window: PsfWindow; visible: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setVisible';

procedure sfWindow_setVerticalSyncEnabled(window: PsfWindow; enabled: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setVerticalSyncEnabled';

procedure sfWindow_setMouseCursorVisible(window: PsfWindow; visible: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setMouseCursorVisible';

procedure sfWindow_setMouseCursorGrabbed(window: PsfWindow; grabbed: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setMouseCursorGrabbed';

procedure sfWindow_setMouseCursor(window: PsfWindow; const cursor: PsfCursor); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setMouseCursor';

procedure sfWindow_setKeyRepeatEnabled(window: PsfWindow; enabled: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setKeyRepeatEnabled';

procedure sfWindow_setFramerateLimit(window: PsfWindow; limit: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setFramerateLimit';

procedure sfWindow_setJoystickThreshold(window: PsfWindow; threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setJoystickThreshold';

function sfWindow_setActive(window: PsfWindow; active: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_setActive';

procedure sfWindow_requestFocus(window: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_requestFocus';

function sfWindow_hasFocus(const window: PsfWindow): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_hasFocus';

procedure sfWindow_display(window: PsfWindow); cdecl;
  external PSFML_DLL name _PU + 'sfWindow_display';

function sfWindow_getNativeHandle(const window: PsfWindow): sfWindowHandle; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_getNativeHandle';

function sfWindow_createVulkanSurface(window: PsfWindow; const instance: PVkInstance; surface: PVkSurfaceKHR; const allocator: PVkAllocationCallbacks): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfWindow_createVulkanSurface';

function sfRenderTexture_create(size: sfVector2u; const settings: PsfContextSettings): PsfRenderTexture; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_create';

procedure sfRenderTexture_destroy(const renderTexture: PsfRenderTexture); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_destroy';

function sfRenderTexture_getSize(const renderTexture: PsfRenderTexture): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getSize';

function sfRenderTexture_isSrgb(const renderTexture: PsfRenderTexture): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_isSrgb';

function sfRenderTexture_setActive(renderTexture: PsfRenderTexture; active: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_setActive';

procedure sfRenderTexture_display(renderTexture: PsfRenderTexture); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_display';

procedure sfRenderTexture_clear(renderTexture: PsfRenderTexture; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_clear';

procedure sfRenderTexture_clearStencil(renderTexture: PsfRenderTexture; stencilValue: sfStencilValue); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_clearStencil';

procedure sfRenderTexture_clearColorAndStencil(renderTexture: PsfRenderTexture; color: sfColor; stencilValue: sfStencilValue); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_clearColorAndStencil';

procedure sfRenderTexture_setView(renderTexture: PsfRenderTexture; const view: PsfView); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_setView';

function sfRenderTexture_getView(const renderTexture: PsfRenderTexture): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getView';

function sfRenderTexture_getDefaultView(const renderTexture: PsfRenderTexture): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getDefaultView';

function sfRenderTexture_getViewport(const renderTexture: PsfRenderTexture; const view: PsfView): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getViewport';

function sfRenderTexture_getScissor(const renderTexture: PsfRenderTexture; const view: PsfView): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getScissor';

function sfRenderTexture_mapPixelToCoords(const renderTexture: PsfRenderTexture; point: sfVector2i; const view: PsfView): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_mapPixelToCoords';

function sfRenderTexture_mapCoordsToPixel(const renderTexture: PsfRenderTexture; point: sfVector2f; const view: PsfView): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_mapCoordsToPixel';

procedure sfRenderTexture_drawSprite(renderTexture: PsfRenderTexture; const &object: PsfSprite; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawSprite';

procedure sfRenderTexture_drawText(renderTexture: PsfRenderTexture; const &object: PsfText; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawText';

procedure sfRenderTexture_drawShape(renderTexture: PsfRenderTexture; const &object: PsfShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawShape';

procedure sfRenderTexture_drawCircleShape(renderTexture: PsfRenderTexture; const &object: PsfCircleShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawCircleShape';

procedure sfRenderTexture_drawConvexShape(renderTexture: PsfRenderTexture; const &object: PsfConvexShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawConvexShape';

procedure sfRenderTexture_drawRectangleShape(renderTexture: PsfRenderTexture; const &object: PsfRectangleShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawRectangleShape';

procedure sfRenderTexture_drawVertexArray(renderTexture: PsfRenderTexture; const &object: PsfVertexArray; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawVertexArray';

procedure sfRenderTexture_drawVertexBuffer(renderTexture: PsfRenderTexture; const &object: PsfVertexBuffer; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawVertexBuffer';

procedure sfRenderTexture_drawVertexBufferRange(renderTexture: PsfRenderTexture; const &object: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawVertexBufferRange';

procedure sfRenderTexture_drawPrimitives(renderTexture: PsfRenderTexture; const vertices: PsfVertex; vertexCount: NativeUInt; &type: sfPrimitiveType; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_drawPrimitives';

procedure sfRenderTexture_pushGLStates(renderTexture: PsfRenderTexture); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_pushGLStates';

procedure sfRenderTexture_popGLStates(renderTexture: PsfRenderTexture); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_popGLStates';

procedure sfRenderTexture_resetGLStates(renderTexture: PsfRenderTexture); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_resetGLStates';

function sfRenderTexture_getTexture(const renderTexture: PsfRenderTexture): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getTexture';

function sfRenderTexture_getMaximumAntiAliasingLevel(): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_getMaximumAntiAliasingLevel';

procedure sfRenderTexture_setSmooth(renderTexture: PsfRenderTexture; smooth: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_setSmooth';

function sfRenderTexture_isSmooth(const renderTexture: PsfRenderTexture): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_isSmooth';

procedure sfRenderTexture_setRepeated(renderTexture: PsfRenderTexture; repeated: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_setRepeated';

function sfRenderTexture_isRepeated(const renderTexture: PsfRenderTexture): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_isRepeated';

function sfRenderTexture_generateMipmap(renderTexture: PsfRenderTexture): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderTexture_generateMipmap';

function sfRenderWindow_create(mode: sfVideoMode; const title: PUTF8Char; style: UInt32; state: sfWindowState; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_create';

function sfRenderWindow_createUnicode(mode: sfVideoMode; const title: PsfChar32; style: UInt32; state: sfWindowState; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_createUnicode';

function sfRenderWindow_createFromHandle(handle: sfWindowHandle; const settings: PsfContextSettings): PsfRenderWindow; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_createFromHandle';

procedure sfRenderWindow_destroy(const renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_destroy';

procedure sfRenderWindow_close(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_close';

function sfRenderWindow_isOpen(const renderWindow: PsfRenderWindow): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_isOpen';

function sfRenderWindow_getSettings(const renderWindow: PsfRenderWindow): sfContextSettings; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getSettings';

function sfRenderWindow_pollEvent(renderWindow: PsfRenderWindow; event: PsfEvent): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_pollEvent';

function sfRenderWindow_waitEvent(renderWindow: PsfRenderWindow; timeout: sfTime; event: PsfEvent): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_waitEvent';

function sfRenderWindow_getPosition(const renderWindow: PsfRenderWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getPosition';

procedure sfRenderWindow_setPosition(renderWindow: PsfRenderWindow; position: sfVector2i); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setPosition';

function sfRenderWindow_getSize(const renderWindow: PsfRenderWindow): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getSize';

function sfRenderWindow_isSrgb(const renderWindow: PsfRenderWindow): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_isSrgb';

procedure sfRenderWindow_setSize(renderWindow: PsfRenderWindow; size: sfVector2u); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setSize';

procedure sfRenderWindow_setTitle(renderWindow: PsfRenderWindow; const title: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setTitle';

procedure sfRenderWindow_setUnicodeTitle(renderWindow: PsfRenderWindow; const title: PsfChar32); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setUnicodeTitle';

procedure sfRenderWindow_setIcon(renderWindow: PsfRenderWindow; size: sfVector2u; const pixels: PUInt8); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setIcon';

procedure sfRenderWindow_setVisible(renderWindow: PsfRenderWindow; visible: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setVisible';

procedure sfRenderWindow_setVerticalSyncEnabled(renderWindow: PsfRenderWindow; enabled: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setVerticalSyncEnabled';

procedure sfRenderWindow_setMouseCursorVisible(renderWindow: PsfRenderWindow; show: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setMouseCursorVisible';

procedure sfRenderWindow_setMouseCursorGrabbed(renderWindow: PsfRenderWindow; grabbed: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setMouseCursorGrabbed';

procedure sfRenderWindow_setMouseCursor(renderWindow: PsfRenderWindow; const cursor: PsfCursor); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setMouseCursor';

procedure sfRenderWindow_setKeyRepeatEnabled(renderWindow: PsfRenderWindow; enabled: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setKeyRepeatEnabled';

procedure sfRenderWindow_setFramerateLimit(renderWindow: PsfRenderWindow; limit: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setFramerateLimit';

procedure sfRenderWindow_setJoystickThreshold(renderWindow: PsfRenderWindow; threshold: Single); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setJoystickThreshold';

function sfRenderWindow_setActive(renderWindow: PsfRenderWindow; active: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setActive';

procedure sfRenderWindow_requestFocus(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_requestFocus';

function sfRenderWindow_hasFocus(const renderWindow: PsfRenderWindow): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_hasFocus';

procedure sfRenderWindow_display(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_display';

function sfRenderWindow_getNativeHandle(const renderWindow: PsfRenderWindow): sfWindowHandle; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getNativeHandle';

procedure sfRenderWindow_clear(renderWindow: PsfRenderWindow; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_clear';

procedure sfRenderWindow_clearStencil(renderWindow: PsfRenderWindow; stencilValue: sfStencilValue); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_clearStencil';

procedure sfRenderWindow_clearColorAndStencil(renderWindow: PsfRenderWindow; color: sfColor; stencilValue: sfStencilValue); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_clearColorAndStencil';

procedure sfRenderWindow_setView(renderWindow: PsfRenderWindow; const view: PsfView); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_setView';

function sfRenderWindow_getView(const renderWindow: PsfRenderWindow): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getView';

function sfRenderWindow_getDefaultView(const renderWindow: PsfRenderWindow): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getDefaultView';

function sfRenderWindow_getViewport(const renderWindow: PsfRenderWindow; const view: PsfView): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getViewport';

function sfRenderWindow_getScissor(const renderWindow: PsfRenderWindow; const view: PsfView): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_getScissor';

function sfRenderWindow_mapPixelToCoords(const renderWindow: PsfRenderWindow; point: sfVector2i; const view: PsfView): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_mapPixelToCoords';

function sfRenderWindow_mapCoordsToPixel(const renderWindow: PsfRenderWindow; point: sfVector2f; const view: PsfView): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_mapCoordsToPixel';

procedure sfRenderWindow_drawSprite(renderWindow: PsfRenderWindow; const &object: PsfSprite; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawSprite';

procedure sfRenderWindow_drawText(renderWindow: PsfRenderWindow; const &object: PsfText; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawText';

procedure sfRenderWindow_drawShape(renderWindow: PsfRenderWindow; const &object: PsfShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawShape';

procedure sfRenderWindow_drawCircleShape(renderWindow: PsfRenderWindow; const &object: PsfCircleShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawCircleShape';

procedure sfRenderWindow_drawConvexShape(renderWindow: PsfRenderWindow; const &object: PsfConvexShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawConvexShape';

procedure sfRenderWindow_drawRectangleShape(renderWindow: PsfRenderWindow; const &object: PsfRectangleShape; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawRectangleShape';

procedure sfRenderWindow_drawVertexArray(renderWindow: PsfRenderWindow; const &object: PsfVertexArray; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawVertexArray';

procedure sfRenderWindow_drawVertexBuffer(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawVertexBuffer';

procedure sfRenderWindow_drawVertexBufferRange(renderWindow: PsfRenderWindow; const &object: PsfVertexBuffer; firstVertex: NativeUInt; vertexCount: NativeUInt; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawVertexBufferRange';

procedure sfRenderWindow_drawPrimitives(renderWindow: PsfRenderWindow; const vertices: PsfVertex; vertexCount: NativeUInt; &type: sfPrimitiveType; const states: PsfRenderStates); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_drawPrimitives';

procedure sfRenderWindow_pushGLStates(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_pushGLStates';

procedure sfRenderWindow_popGLStates(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_popGLStates';

procedure sfRenderWindow_resetGLStates(renderWindow: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_resetGLStates';

function sfMouse_getPositionRenderWindow(const relativeTo: PsfRenderWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfMouse_getPositionRenderWindow';

procedure sfMouse_setPositionRenderWindow(position: sfVector2i; const relativeTo: PsfRenderWindow); cdecl;
  external PSFML_DLL name _PU + 'sfMouse_setPositionRenderWindow';

function sfTouch_getPositionRenderWindow(finger: Cardinal; const relativeTo: PsfRenderWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfTouch_getPositionRenderWindow';

function sfRenderWindow_createVulkanSurface(renderWindow: PsfRenderWindow; const instance: PVkInstance; surface: PVkSurfaceKHR; const allocator: PVkAllocationCallbacks): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfRenderWindow_createVulkanSurface';

function sfShader_createFromFile(const vertexShaderFilename: PUTF8Char; const geometryShaderFilename: PUTF8Char; const fragmentShaderFilename: PUTF8Char): PsfShader; cdecl;
  external PSFML_DLL name _PU + 'sfShader_createFromFile';

function sfShader_createFromMemory(const vertexShader: PUTF8Char; const geometryShader: PUTF8Char; const fragmentShader: PUTF8Char): PsfShader; cdecl;
  external PSFML_DLL name _PU + 'sfShader_createFromMemory';

function sfShader_createFromStream(vertexShaderStream: PsfInputStream; geometryShaderStream: PsfInputStream; fragmentShaderStream: PsfInputStream): PsfShader; cdecl;
  external PSFML_DLL name _PU + 'sfShader_createFromStream';

procedure sfShader_destroy(const shader: PsfShader); cdecl;
  external PSFML_DLL name _PU + 'sfShader_destroy';

procedure sfShader_setFloatUniform(shader: PsfShader; const name: PUTF8Char; x: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setFloatUniform';

procedure sfShader_setVec2Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec2); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec2Uniform';

procedure sfShader_setVec3Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec3); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec3Uniform';

procedure sfShader_setVec4Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslVec4); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec4Uniform';

procedure sfShader_setColorUniform(shader: PsfShader; const name: PUTF8Char; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setColorUniform';

procedure sfShader_setIntUniform(shader: PsfShader; const name: PUTF8Char; x: Integer); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setIntUniform';

procedure sfShader_setIvec2Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec2); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setIvec2Uniform';

procedure sfShader_setIvec3Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec3); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setIvec3Uniform';

procedure sfShader_setIvec4Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslIvec4); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setIvec4Uniform';

procedure sfShader_setIntColorUniform(shader: PsfShader; const name: PUTF8Char; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setIntColorUniform';

procedure sfShader_setBoolUniform(shader: PsfShader; const name: PUTF8Char; x: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setBoolUniform';

procedure sfShader_setBvec2Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec2); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setBvec2Uniform';

procedure sfShader_setBvec3Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec3); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setBvec3Uniform';

procedure sfShader_setBvec4Uniform(shader: PsfShader; const name: PUTF8Char; vector: sfGlslBvec4); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setBvec4Uniform';

procedure sfShader_setMat3Uniform(shader: PsfShader; const name: PUTF8Char; const matrix: PsfGlslMat3); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setMat3Uniform';

procedure sfShader_setMat4Uniform(shader: PsfShader; const name: PUTF8Char; const matrix: PsfGlslMat4); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setMat4Uniform';

procedure sfShader_setTextureUniform(shader: PsfShader; const name: PUTF8Char; const texture: PsfTexture); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setTextureUniform';

procedure sfShader_setCurrentTextureUniform(shader: PsfShader; const name: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setCurrentTextureUniform';

procedure sfShader_setFloatUniformArray(shader: PsfShader; const name: PUTF8Char; const scalarArray: PSingle; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setFloatUniformArray';

procedure sfShader_setVec2UniformArray(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec2; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec2UniformArray';

procedure sfShader_setVec3UniformArray(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec3; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec3UniformArray';

procedure sfShader_setVec4UniformArray(shader: PsfShader; const name: PUTF8Char; const vectorArray: PsfGlslVec4; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setVec4UniformArray';

procedure sfShader_setMat3UniformArray(shader: PsfShader; const name: PUTF8Char; const matrixArray: PsfGlslMat3; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setMat3UniformArray';

procedure sfShader_setMat4UniformArray(shader: PsfShader; const name: PUTF8Char; const matrixArray: PsfGlslMat4; length: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfShader_setMat4UniformArray';

function sfShader_getNativeHandle(const shader: PsfShader): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfShader_getNativeHandle';

procedure sfShader_bind(const shader: PsfShader); cdecl;
  external PSFML_DLL name _PU + 'sfShader_bind';

function sfShader_isAvailable(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfShader_isAvailable';

function sfShader_isGeometryAvailable(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfShader_isGeometryAvailable';

function sfShape_create(getPointCount: sfShapeGetPointCountCallback; getPoint: sfShapeGetPointCallback; userData: Pointer): PsfShape; cdecl;
  external PSFML_DLL name _PU + 'sfShape_create';

procedure sfShape_destroy(const shape: PsfShape); cdecl;
  external PSFML_DLL name _PU + 'sfShape_destroy';

procedure sfShape_setPosition(shape: PsfShape; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setPosition';

procedure sfShape_setRotation(shape: PsfShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setRotation';

procedure sfShape_setScale(shape: PsfShape; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setScale';

procedure sfShape_setOrigin(shape: PsfShape; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setOrigin';

function sfShape_getPosition(const shape: PsfShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getPosition';

function sfShape_getRotation(const shape: PsfShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getRotation';

function sfShape_getScale(const shape: PsfShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getScale';

function sfShape_getOrigin(const shape: PsfShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getOrigin';

procedure sfShape_move(shape: PsfShape; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfShape_move';

procedure sfShape_rotate(shape: PsfShape; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShape_rotate';

procedure sfShape_scale(shape: PsfShape; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfShape_scale';

function sfShape_getTransform(const shape: PsfShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getTransform';

function sfShape_getInverseTransform(const shape: PsfShape): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getInverseTransform';

procedure sfShape_setTexture(shape: PsfShape; const texture: PsfTexture; resetRect: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setTexture';

procedure sfShape_setTextureRect(shape: PsfShape; rect: sfIntRect); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setTextureRect';

procedure sfShape_setFillColor(shape: PsfShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setFillColor';

procedure sfShape_setOutlineColor(shape: PsfShape; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setOutlineColor';

procedure sfShape_setOutlineThickness(shape: PsfShape; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'sfShape_setOutlineThickness';

function sfShape_getTexture(const shape: PsfShape): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getTexture';

function sfShape_getTextureRect(const shape: PsfShape): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getTextureRect';

function sfShape_getFillColor(const shape: PsfShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getFillColor';

function sfShape_getOutlineColor(const shape: PsfShape): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getOutlineColor';

function sfShape_getOutlineThickness(const shape: PsfShape): Single; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getOutlineThickness';

function sfShape_getPointCount(const shape: PsfShape): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getPointCount';

function sfShape_getPoint(const shape: PsfShape; index: NativeUInt): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getPoint';

function sfShape_getGeometricCenter(const shape: PsfShape): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getGeometricCenter';

function sfShape_getLocalBounds(const shape: PsfShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getLocalBounds';

function sfShape_getGlobalBounds(const shape: PsfShape): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfShape_getGlobalBounds';

procedure sfShape_update(shape: PsfShape); cdecl;
  external PSFML_DLL name _PU + 'sfShape_update';

function sfSprite_create(const texture: PsfTexture): PsfSprite; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_create';

function sfSprite_copy(const sprite: PsfSprite): PsfSprite; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_copy';

procedure sfSprite_destroy(const sprite: PsfSprite); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_destroy';

procedure sfSprite_setPosition(sprite: PsfSprite; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setPosition';

procedure sfSprite_setRotation(sprite: PsfSprite; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setRotation';

procedure sfSprite_setScale(sprite: PsfSprite; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setScale';

procedure sfSprite_setOrigin(sprite: PsfSprite; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setOrigin';

function sfSprite_getPosition(const sprite: PsfSprite): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getPosition';

function sfSprite_getRotation(const sprite: PsfSprite): Single; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getRotation';

function sfSprite_getScale(const sprite: PsfSprite): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getScale';

function sfSprite_getOrigin(const sprite: PsfSprite): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getOrigin';

procedure sfSprite_move(sprite: PsfSprite; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_move';

procedure sfSprite_rotate(sprite: PsfSprite; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_rotate';

procedure sfSprite_scale(sprite: PsfSprite; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_scale';

function sfSprite_getTransform(const sprite: PsfSprite): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getTransform';

function sfSprite_getInverseTransform(const sprite: PsfSprite): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getInverseTransform';

procedure sfSprite_setTexture(sprite: PsfSprite; const texture: PsfTexture; resetRect: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setTexture';

procedure sfSprite_setTextureRect(sprite: PsfSprite; rectangle: sfIntRect); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setTextureRect';

procedure sfSprite_setColor(sprite: PsfSprite; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfSprite_setColor';

function sfSprite_getTexture(const sprite: PsfSprite): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getTexture';

function sfSprite_getTextureRect(const sprite: PsfSprite): sfIntRect; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getTextureRect';

function sfSprite_getColor(const sprite: PsfSprite): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getColor';

function sfSprite_getLocalBounds(const sprite: PsfSprite): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getLocalBounds';

function sfSprite_getGlobalBounds(const sprite: PsfSprite): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfSprite_getGlobalBounds';

function sfText_create(const font: PsfFont): PsfText; cdecl;
  external PSFML_DLL name _PU + 'sfText_create';

function sfText_copy(const text: PsfText): PsfText; cdecl;
  external PSFML_DLL name _PU + 'sfText_copy';

procedure sfText_destroy(const text: PsfText); cdecl;
  external PSFML_DLL name _PU + 'sfText_destroy';

procedure sfText_setPosition(text: PsfText; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfText_setPosition';

procedure sfText_setRotation(text: PsfText; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfText_setRotation';

procedure sfText_setScale(text: PsfText; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfText_setScale';

procedure sfText_setOrigin(text: PsfText; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfText_setOrigin';

function sfText_getPosition(const text: PsfText): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfText_getPosition';

function sfText_getRotation(const text: PsfText): Single; cdecl;
  external PSFML_DLL name _PU + 'sfText_getRotation';

function sfText_getScale(const text: PsfText): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfText_getScale';

function sfText_getOrigin(const text: PsfText): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfText_getOrigin';

procedure sfText_move(text: PsfText; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfText_move';

procedure sfText_rotate(text: PsfText; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfText_rotate';

procedure sfText_scale(text: PsfText; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfText_scale';

function sfText_getTransform(const text: PsfText): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfText_getTransform';

function sfText_getInverseTransform(const text: PsfText): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfText_getInverseTransform';

procedure sfText_setString(text: PsfText; const &string: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfText_setString';

procedure sfText_setUnicodeString(text: PsfText; const &string: PsfChar32); cdecl;
  external PSFML_DLL name _PU + 'sfText_setUnicodeString';

procedure sfText_setFont(text: PsfText; const font: PsfFont); cdecl;
  external PSFML_DLL name _PU + 'sfText_setFont';

procedure sfText_setCharacterSize(text: PsfText; size: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfText_setCharacterSize';

procedure sfText_setLineSpacing(text: PsfText; spacingFactor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfText_setLineSpacing';

procedure sfText_setLetterSpacing(text: PsfText; spacingFactor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfText_setLetterSpacing';

procedure sfText_setStyle(text: PsfText; style: UInt32); cdecl;
  external PSFML_DLL name _PU + 'sfText_setStyle';

procedure sfText_setFillColor(text: PsfText; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfText_setFillColor';

procedure sfText_setOutlineColor(text: PsfText; color: sfColor); cdecl;
  external PSFML_DLL name _PU + 'sfText_setOutlineColor';

procedure sfText_setOutlineThickness(text: PsfText; thickness: Single); cdecl;
  external PSFML_DLL name _PU + 'sfText_setOutlineThickness';

function sfText_getString(const text: PsfText): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfText_getString';

function sfText_getUnicodeString(const text: PsfText): PsfChar32; cdecl;
  external PSFML_DLL name _PU + 'sfText_getUnicodeString';

function sfText_getFont(const text: PsfText): PsfFont; cdecl;
  external PSFML_DLL name _PU + 'sfText_getFont';

function sfText_getCharacterSize(const text: PsfText): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfText_getCharacterSize';

function sfText_getLetterSpacing(const text: PsfText): Single; cdecl;
  external PSFML_DLL name _PU + 'sfText_getLetterSpacing';

function sfText_getLineSpacing(const text: PsfText): Single; cdecl;
  external PSFML_DLL name _PU + 'sfText_getLineSpacing';

function sfText_getStyle(const text: PsfText): UInt32; cdecl;
  external PSFML_DLL name _PU + 'sfText_getStyle';

function sfText_getFillColor(const text: PsfText): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfText_getFillColor';

function sfText_getOutlineColor(const text: PsfText): sfColor; cdecl;
  external PSFML_DLL name _PU + 'sfText_getOutlineColor';

function sfText_getOutlineThickness(const text: PsfText): Single; cdecl;
  external PSFML_DLL name _PU + 'sfText_getOutlineThickness';

function sfText_findCharacterPos(const text: PsfText; index: NativeUInt): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfText_findCharacterPos';

function sfText_getLocalBounds(const text: PsfText): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfText_getLocalBounds';

function sfText_getGlobalBounds(const text: PsfText): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfText_getGlobalBounds';

function sfTexture_create(size: sfVector2u): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_create';

function sfTexture_createSrgb(size: sfVector2u): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createSrgb';

function sfTexture_createFromFile(const filename: PUTF8Char; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createFromFile';

function sfTexture_createSrgbFromFile(const filename: PUTF8Char; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createSrgbFromFile';

function sfTexture_createFromMemory(const data: Pointer; sizeInBytes: NativeUInt; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createFromMemory';

function sfTexture_createSrgbFromMemory(const data: Pointer; sizeInBytes: NativeUInt; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createSrgbFromMemory';

function sfTexture_createFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createFromStream';

function sfTexture_createSrgbFromStream(stream: PsfInputStream; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createSrgbFromStream';

function sfTexture_createFromImage(const image: PsfImage; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createFromImage';

function sfTexture_createSrgbFromImage(const image: PsfImage; const area: PsfIntRect): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_createSrgbFromImage';

function sfTexture_copy(const texture: PsfTexture): PsfTexture; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_copy';

procedure sfTexture_destroy(const texture: PsfTexture); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_destroy';

function sfTexture_getSize(const texture: PsfTexture): sfVector2u; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_getSize';

function sfTexture_copyToImage(const texture: PsfTexture): PsfImage; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_copyToImage';

procedure sfTexture_updateFromPixels(texture: PsfTexture; const pixels: PUInt8; size: sfVector2u; offset: sfVector2u); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_updateFromPixels';

procedure sfTexture_updateFromTexture(destination: PsfTexture; const source: PsfTexture; offset: sfVector2u); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_updateFromTexture';

procedure sfTexture_updateFromImage(texture: PsfTexture; const image: PsfImage; offset: sfVector2u); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_updateFromImage';

procedure sfTexture_updateFromWindow(texture: PsfTexture; const window: PsfWindow; offset: sfVector2u); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_updateFromWindow';

procedure sfTexture_updateFromRenderWindow(texture: PsfTexture; const renderWindow: PsfRenderWindow; offset: sfVector2u); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_updateFromRenderWindow';

procedure sfTexture_setSmooth(texture: PsfTexture; smooth: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_setSmooth';

function sfTexture_isSmooth(const texture: PsfTexture): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_isSmooth';

function sfTexture_isSrgb(const texture: PsfTexture): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_isSrgb';

procedure sfTexture_setRepeated(texture: PsfTexture; repeated: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_setRepeated';

function sfTexture_isRepeated(const texture: PsfTexture): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_isRepeated';

function sfTexture_generateMipmap(texture: PsfTexture): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_generateMipmap';

procedure sfTexture_swap(left: PsfTexture; right: PsfTexture); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_swap';

function sfTexture_getNativeHandle(const texture: PsfTexture): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_getNativeHandle';

procedure sfTexture_bind(const texture: PsfTexture; &type: sfCoordinateType); cdecl;
  external PSFML_DLL name _PU + 'sfTexture_bind';

function sfTexture_getMaximumSize(): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfTexture_getMaximumSize';

function sfTransformable_create(): PsfTransformable; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_create';

function sfTransformable_copy(const transformable: PsfTransformable): PsfTransformable; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_copy';

procedure sfTransformable_destroy(const transformable: PsfTransformable); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_destroy';

procedure sfTransformable_setPosition(transformable: PsfTransformable; position: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_setPosition';

procedure sfTransformable_setRotation(transformable: PsfTransformable; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_setRotation';

procedure sfTransformable_setScale(transformable: PsfTransformable; scale: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_setScale';

procedure sfTransformable_setOrigin(transformable: PsfTransformable; origin: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_setOrigin';

function sfTransformable_getPosition(const transformable: PsfTransformable): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getPosition';

function sfTransformable_getRotation(const transformable: PsfTransformable): Single; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getRotation';

function sfTransformable_getScale(const transformable: PsfTransformable): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getScale';

function sfTransformable_getOrigin(const transformable: PsfTransformable): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getOrigin';

procedure sfTransformable_move(transformable: PsfTransformable; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_move';

procedure sfTransformable_rotate(transformable: PsfTransformable; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_rotate';

procedure sfTransformable_scale(transformable: PsfTransformable; factors: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_scale';

function sfTransformable_getTransform(const transformable: PsfTransformable): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getTransform';

function sfTransformable_getInverseTransform(const transformable: PsfTransformable): sfTransform; cdecl;
  external PSFML_DLL name _PU + 'sfTransformable_getInverseTransform';

function sfVertexArray_create(): PsfVertexArray; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_create';

function sfVertexArray_copy(const vertexArray: PsfVertexArray): PsfVertexArray; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_copy';

procedure sfVertexArray_destroy(const vertexArray: PsfVertexArray); cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_destroy';

function sfVertexArray_getVertexCount(const vertexArray: PsfVertexArray): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_getVertexCount';

function sfVertexArray_getVertex(vertexArray: PsfVertexArray; index: NativeUInt): PsfVertex; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_getVertex';

procedure sfVertexArray_clear(vertexArray: PsfVertexArray); cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_clear';

procedure sfVertexArray_resize(vertexArray: PsfVertexArray; vertexCount: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_resize';

procedure sfVertexArray_append(vertexArray: PsfVertexArray; vertex: sfVertex); cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_append';

procedure sfVertexArray_setPrimitiveType(vertexArray: PsfVertexArray; &type: sfPrimitiveType); cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_setPrimitiveType';

function sfVertexArray_getPrimitiveType(vertexArray: PsfVertexArray): sfPrimitiveType; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_getPrimitiveType';

function sfVertexArray_getBounds(vertexArray: PsfVertexArray): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfVertexArray_getBounds';

function sfVertexBuffer_create(vertexCount: NativeUInt; &type: sfPrimitiveType; usage: sfVertexBufferUsage): PsfVertexBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_create';

function sfVertexBuffer_copy(const vertexBuffer: PsfVertexBuffer): PsfVertexBuffer; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_copy';

procedure sfVertexBuffer_destroy(const vertexBuffer: PsfVertexBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_destroy';

function sfVertexBuffer_getVertexCount(const vertexBuffer: PsfVertexBuffer): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_getVertexCount';

function sfVertexBuffer_update(vertexBuffer: PsfVertexBuffer; const vertices: PsfVertex; vertexCount: Cardinal; offset: Cardinal): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_update';

function sfVertexBuffer_updateFromVertexBuffer(vertexBuffer: PsfVertexBuffer; const other: PsfVertexBuffer): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_updateFromVertexBuffer';

procedure sfVertexBuffer_swap(left: PsfVertexBuffer; right: PsfVertexBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_swap';

function sfVertexBuffer_getNativeHandle(vertexBuffer: PsfVertexBuffer): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_getNativeHandle';

procedure sfVertexBuffer_setPrimitiveType(vertexBuffer: PsfVertexBuffer; &type: sfPrimitiveType); cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_setPrimitiveType';

function sfVertexBuffer_getPrimitiveType(const vertexBuffer: PsfVertexBuffer): sfPrimitiveType; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_getPrimitiveType';

procedure sfVertexBuffer_setUsage(vertexBuffer: PsfVertexBuffer; usage: sfVertexBufferUsage); cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_setUsage';

function sfVertexBuffer_getUsage(const vertexBuffer: PsfVertexBuffer): sfVertexBufferUsage; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_getUsage';

procedure sfVertexBuffer_bind(const vertexBuffer: PsfVertexBuffer); cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_bind';

function sfVertexBuffer_isAvailable(): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfVertexBuffer_isAvailable';

function sfView_create(): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfView_create';

function sfView_createFromRect(rectangle: sfFloatRect): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfView_createFromRect';

function sfView_copy(const view: PsfView): PsfView; cdecl;
  external PSFML_DLL name _PU + 'sfView_copy';

procedure sfView_destroy(const view: PsfView); cdecl;
  external PSFML_DLL name _PU + 'sfView_destroy';

procedure sfView_setCenter(view: PsfView; center: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfView_setCenter';

procedure sfView_setSize(view: PsfView; size: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfView_setSize';

procedure sfView_setRotation(view: PsfView; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfView_setRotation';

procedure sfView_setViewport(view: PsfView; viewport: sfFloatRect); cdecl;
  external PSFML_DLL name _PU + 'sfView_setViewport';

procedure sfView_setScissor(view: PsfView; scissor: sfFloatRect); cdecl;
  external PSFML_DLL name _PU + 'sfView_setScissor';

function sfView_getCenter(const view: PsfView): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfView_getCenter';

function sfView_getSize(const view: PsfView): sfVector2f; cdecl;
  external PSFML_DLL name _PU + 'sfView_getSize';

function sfView_getRotation(const view: PsfView): Single; cdecl;
  external PSFML_DLL name _PU + 'sfView_getRotation';

function sfView_getViewport(const view: PsfView): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfView_getViewport';

function sfView_getScissor(const view: PsfView): sfFloatRect; cdecl;
  external PSFML_DLL name _PU + 'sfView_getScissor';

procedure sfView_move(view: PsfView; offset: sfVector2f); cdecl;
  external PSFML_DLL name _PU + 'sfView_move';

procedure sfView_rotate(view: PsfView; angle: Single); cdecl;
  external PSFML_DLL name _PU + 'sfView_rotate';

procedure sfView_zoom(view: PsfView; factor: Single); cdecl;
  external PSFML_DLL name _PU + 'sfView_zoom';

function sfClipboard_getString(): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfClipboard_getString';

function sfClipboard_getUnicodeString(): PsfChar32; cdecl;
  external PSFML_DLL name _PU + 'sfClipboard_getUnicodeString';

procedure sfClipboard_setString(const text: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfClipboard_setString';

procedure sfClipboard_setUnicodeString(const text: PsfChar32); cdecl;
  external PSFML_DLL name _PU + 'sfClipboard_setUnicodeString';

function sfContext_create(): PsfContext; cdecl;
  external PSFML_DLL name _PU + 'sfContext_create';

procedure sfContext_destroy(const context: PsfContext); cdecl;
  external PSFML_DLL name _PU + 'sfContext_destroy';

function sfContext_isExtensionAvailable(const name: PUTF8Char): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfContext_isExtensionAvailable';

function sfContext_setActive(context: PsfContext; active: Boolean): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfContext_setActive';

function sfContext_getFunction(const name: PUTF8Char): sfGlFunctionPointer; cdecl;
  external PSFML_DLL name _PU + 'sfContext_getFunction';

function sfContext_getSettings(const context: PsfContext): sfContextSettings; cdecl;
  external PSFML_DLL name _PU + 'sfContext_getSettings';

function sfContext_getActiveContextId(): UInt64; cdecl;
  external PSFML_DLL name _PU + 'sfContext_getActiveContextId';

function sfCursor_createFromPixels(const pixels: PUInt8; size: sfVector2u; hotspot: sfVector2u): PsfCursor; cdecl;
  external PSFML_DLL name _PU + 'sfCursor_createFromPixels';

function sfCursor_createFromSystem(&type: sfCursorType): PsfCursor; cdecl;
  external PSFML_DLL name _PU + 'sfCursor_createFromSystem';

procedure sfCursor_destroy(const cursor: PsfCursor); cdecl;
  external PSFML_DLL name _PU + 'sfCursor_destroy';

function sfTouch_isDown(finger: Cardinal): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfTouch_isDown';

function sfTouch_getPosition(finger: Cardinal; const relativeTo: PsfWindow): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfTouch_getPosition';

function sfTouch_getPositionWindowBase(finger: Cardinal; const relativeTo: PsfWindowBase): sfVector2i; cdecl;
  external PSFML_DLL name _PU + 'sfTouch_getPositionWindowBase';

function sfIpAddress_fromString(const address: PUTF8Char): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_fromString';

function sfIpAddress_fromBytes(byte0: UInt8; byte1: UInt8; byte2: UInt8; byte3: UInt8): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_fromBytes';

function sfIpAddress_fromInteger(address: UInt32): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_fromInteger';

procedure sfIpAddress_toString(address: sfIpAddress; &string: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_toString';

function sfIpAddress_toInteger(address: sfIpAddress): UInt32; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_toInteger';

function sfIpAddress_getLocalAddress(): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_getLocalAddress';

function sfIpAddress_getPublicAddress(timeout: sfTime): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfIpAddress_getPublicAddress';

procedure sfFtpListingResponse_destroy(const ftpListingResponse: PsfFtpListingResponse); cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_destroy';

function sfFtpListingResponse_isOk(const ftpListingResponse: PsfFtpListingResponse): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_isOk';

function sfFtpListingResponse_getStatus(const ftpListingResponse: PsfFtpListingResponse): sfFtpStatus; cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_getStatus';

function sfFtpListingResponse_getMessage(const ftpListingResponse: PsfFtpListingResponse): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_getMessage';

function sfFtpListingResponse_getCount(const ftpListingResponse: PsfFtpListingResponse): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_getCount';

function sfFtpListingResponse_getName(const ftpListingResponse: PsfFtpListingResponse; index: NativeUInt): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfFtpListingResponse_getName';

procedure sfFtpDirectoryResponse_destroy(const ftpDirectoryResponse: PsfFtpDirectoryResponse); cdecl;
  external PSFML_DLL name _PU + 'sfFtpDirectoryResponse_destroy';

function sfFtpDirectoryResponse_isOk(const ftpDirectoryResponse: PsfFtpDirectoryResponse): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfFtpDirectoryResponse_isOk';

function sfFtpDirectoryResponse_getStatus(const ftpDirectoryResponse: PsfFtpDirectoryResponse): sfFtpStatus; cdecl;
  external PSFML_DLL name _PU + 'sfFtpDirectoryResponse_getStatus';

function sfFtpDirectoryResponse_getMessage(const ftpDirectoryResponse: PsfFtpDirectoryResponse): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfFtpDirectoryResponse_getMessage';

function sfFtpDirectoryResponse_getDirectory(const ftpDirectoryResponse: PsfFtpDirectoryResponse): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfFtpDirectoryResponse_getDirectory';

function sfFtpDirectoryResponse_getDirectoryUnicode(const ftpDirectoryResponse: PsfFtpDirectoryResponse): PsfChar32; cdecl;
  external PSFML_DLL name _PU + 'sfFtpDirectoryResponse_getDirectoryUnicode';

procedure sfFtpResponse_destroy(const ftpResponse: PsfFtpResponse); cdecl;
  external PSFML_DLL name _PU + 'sfFtpResponse_destroy';

function sfFtpResponse_isOk(const ftpResponse: PsfFtpResponse): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfFtpResponse_isOk';

function sfFtpResponse_getStatus(const ftpResponse: PsfFtpResponse): sfFtpStatus; cdecl;
  external PSFML_DLL name _PU + 'sfFtpResponse_getStatus';

function sfFtpResponse_getMessage(const ftpResponse: PsfFtpResponse): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfFtpResponse_getMessage';

function sfFtp_create(): PsfFtp; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_create';

procedure sfFtp_destroy(const ftp: PsfFtp); cdecl;
  external PSFML_DLL name _PU + 'sfFtp_destroy';

function sfFtp_connect(ftp: PsfFtp; server: sfIpAddress; port: Word; timeout: sfTime): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_connect';

function sfFtp_loginAnonymous(ftp: PsfFtp): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_loginAnonymous';

function sfFtp_login(ftp: PsfFtp; const name: PUTF8Char; const password: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_login';

function sfFtp_disconnect(ftp: PsfFtp): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_disconnect';

function sfFtp_keepAlive(ftp: PsfFtp): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_keepAlive';

function sfFtp_getWorkingDirectory(ftp: PsfFtp): PsfFtpDirectoryResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_getWorkingDirectory';

function sfFtp_getDirectoryListing(ftp: PsfFtp; const directory: PUTF8Char): PsfFtpListingResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_getDirectoryListing';

function sfFtp_changeDirectory(ftp: PsfFtp; const directory: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_changeDirectory';

function sfFtp_parentDirectory(ftp: PsfFtp): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_parentDirectory';

function sfFtp_createDirectory(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_createDirectory';

function sfFtp_deleteDirectory(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_deleteDirectory';

function sfFtp_renameFile(ftp: PsfFtp; const &file: PUTF8Char; const newName: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_renameFile';

function sfFtp_deleteFile(ftp: PsfFtp; const name: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_deleteFile';

function sfFtp_download(ftp: PsfFtp; const remoteFile: PUTF8Char; const localPath: PUTF8Char; mode: sfFtpTransferMode): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_download';

function sfFtp_upload(ftp: PsfFtp; const localFile: PUTF8Char; const remotePath: PUTF8Char; mode: sfFtpTransferMode; append: Boolean): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_upload';

function sfFtp_sendCommand(ftp: PsfFtp; const command: PUTF8Char; const parameter: PUTF8Char): PsfFtpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfFtp_sendCommand';

function sfHttpRequest_create(): PsfHttpRequest; cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_create';

procedure sfHttpRequest_destroy(const httpRequest: PsfHttpRequest); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_destroy';

procedure sfHttpRequest_setField(httpRequest: PsfHttpRequest; const field: PUTF8Char; const value: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_setField';

procedure sfHttpRequest_setMethod(httpRequest: PsfHttpRequest; method: sfHttpMethod); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_setMethod';

procedure sfHttpRequest_setUri(httpRequest: PsfHttpRequest; const uri: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_setUri';

procedure sfHttpRequest_setHttpVersion(httpRequest: PsfHttpRequest; major: Cardinal; minor: Cardinal); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_setHttpVersion';

procedure sfHttpRequest_setBody(httpRequest: PsfHttpRequest; const body: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfHttpRequest_setBody';

procedure sfHttpResponse_destroy(const httpResponse: PsfHttpResponse); cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_destroy';

function sfHttpResponse_getField(const httpResponse: PsfHttpResponse; const field: PUTF8Char): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_getField';

function sfHttpResponse_getStatus(const httpResponse: PsfHttpResponse): sfHttpStatus; cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_getStatus';

function sfHttpResponse_getMajorVersion(const httpResponse: PsfHttpResponse): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_getMajorVersion';

function sfHttpResponse_getMinorVersion(const httpResponse: PsfHttpResponse): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_getMinorVersion';

function sfHttpResponse_getBody(const httpResponse: PsfHttpResponse): PUTF8Char; cdecl;
  external PSFML_DLL name _PU + 'sfHttpResponse_getBody';

function sfHttp_create(): PsfHttp; cdecl;
  external PSFML_DLL name _PU + 'sfHttp_create';

procedure sfHttp_destroy(const http: PsfHttp); cdecl;
  external PSFML_DLL name _PU + 'sfHttp_destroy';

procedure sfHttp_setHost(http: PsfHttp; const host: PUTF8Char; port: Word); cdecl;
  external PSFML_DLL name _PU + 'sfHttp_setHost';

function sfHttp_sendRequest(http: PsfHttp; const request: PsfHttpRequest; timeout: sfTime): PsfHttpResponse; cdecl;
  external PSFML_DLL name _PU + 'sfHttp_sendRequest';

function sfPacket_create(): PsfPacket; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_create';

function sfPacket_copy(const packet: PsfPacket): PsfPacket; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_copy';

procedure sfPacket_destroy(const packet: PsfPacket); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_destroy';

procedure sfPacket_append(packet: PsfPacket; const data: Pointer; sizeInBytes: NativeUInt); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_append';

function sfPacket_getReadPosition(const packet: PsfPacket): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_getReadPosition';

procedure sfPacket_clear(packet: PsfPacket); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_clear';

function sfPacket_getData(const packet: PsfPacket): Pointer; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_getData';

function sfPacket_getDataSize(const packet: PsfPacket): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_getDataSize';

function sfPacket_endOfPacket(const packet: PsfPacket): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_endOfPacket';

function sfPacket_canRead(const packet: PsfPacket): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_canRead';

function sfPacket_readBool(packet: PsfPacket): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readBool';

function sfPacket_readInt8(packet: PsfPacket): Int8; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readInt8';

function sfPacket_readUint8(packet: PsfPacket): UInt8; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readUint8';

function sfPacket_readInt16(packet: PsfPacket): Int16; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readInt16';

function sfPacket_readUint16(packet: PsfPacket): UInt16; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readUint16';

function sfPacket_readInt32(packet: PsfPacket): Int32; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readInt32';

function sfPacket_readUint32(packet: PsfPacket): UInt32; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readUint32';

function sfPacket_readFloat(packet: PsfPacket): Single; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readFloat';

function sfPacket_readDouble(packet: PsfPacket): Double; cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readDouble';

procedure sfPacket_readString(packet: PsfPacket; &string: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readString';

procedure sfPacket_readWideString(packet: PsfPacket; &string: PWideChar); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_readWideString';

procedure sfPacket_writeBool(packet: PsfPacket; p2: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeBool';

procedure sfPacket_writeInt8(packet: PsfPacket; p2: Int8); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeInt8';

procedure sfPacket_writeUint8(packet: PsfPacket; p2: UInt8); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeUint8';

procedure sfPacket_writeInt16(packet: PsfPacket; p2: Int16); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeInt16';

procedure sfPacket_writeUint16(packet: PsfPacket; p2: UInt16); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeUint16';

procedure sfPacket_writeInt32(packet: PsfPacket; p2: Int32); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeInt32';

procedure sfPacket_writeUint32(packet: PsfPacket; p2: UInt32); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeUint32';

procedure sfPacket_writeFloat(packet: PsfPacket; p2: Single); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeFloat';

procedure sfPacket_writeDouble(packet: PsfPacket; p2: Double); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeDouble';

procedure sfPacket_writeString(packet: PsfPacket; const &string: PUTF8Char); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeString';

procedure sfPacket_writeWideString(packet: PsfPacket; const &string: PWideChar); cdecl;
  external PSFML_DLL name _PU + 'sfPacket_writeWideString';

function sfSocketSelector_create(): PsfSocketSelector; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_create';

function sfSocketSelector_copy(const selector: PsfSocketSelector): PsfSocketSelector; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_copy';

procedure sfSocketSelector_destroy(const selector: PsfSocketSelector); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_destroy';

procedure sfSocketSelector_addTcpListener(selector: PsfSocketSelector; socket: PsfTcpListener); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_addTcpListener';

procedure sfSocketSelector_addTcpSocket(selector: PsfSocketSelector; socket: PsfTcpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_addTcpSocket';

procedure sfSocketSelector_addUdpSocket(selector: PsfSocketSelector; socket: PsfUdpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_addUdpSocket';

procedure sfSocketSelector_removeTcpListener(selector: PsfSocketSelector; socket: PsfTcpListener); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_removeTcpListener';

procedure sfSocketSelector_removeTcpSocket(selector: PsfSocketSelector; socket: PsfTcpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_removeTcpSocket';

procedure sfSocketSelector_removeUdpSocket(selector: PsfSocketSelector; socket: PsfUdpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_removeUdpSocket';

procedure sfSocketSelector_clear(selector: PsfSocketSelector); cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_clear';

function sfSocketSelector_wait(selector: PsfSocketSelector; timeout: sfTime): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_wait';

function sfSocketSelector_isTcpListenerReady(const selector: PsfSocketSelector; socket: PsfTcpListener): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_isTcpListenerReady';

function sfSocketSelector_isTcpSocketReady(const selector: PsfSocketSelector; socket: PsfTcpSocket): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_isTcpSocketReady';

function sfSocketSelector_isUdpSocketReady(const selector: PsfSocketSelector; socket: PsfUdpSocket): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfSocketSelector_isUdpSocketReady';

function sfTcpListener_create(): PsfTcpListener; cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_create';

procedure sfTcpListener_destroy(const listener: PsfTcpListener); cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_destroy';

procedure sfTcpListener_setBlocking(listener: PsfTcpListener; blocking: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_setBlocking';

function sfTcpListener_isBlocking(const listener: PsfTcpListener): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_isBlocking';

function sfTcpListener_getLocalPort(const listener: PsfTcpListener): Word; cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_getLocalPort';

function sfTcpListener_listen(listener: PsfTcpListener; port: Word; address: sfIpAddress): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_listen';

function sfTcpListener_accept(listener: PsfTcpListener; connected: PPsfTcpSocket): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpListener_accept';

function sfTcpSocket_create(): PsfTcpSocket; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_create';

procedure sfTcpSocket_destroy(const socket: PsfTcpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_destroy';

procedure sfTcpSocket_setBlocking(socket: PsfTcpSocket; blocking: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_setBlocking';

function sfTcpSocket_isBlocking(const socket: PsfTcpSocket): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_isBlocking';

function sfTcpSocket_getLocalPort(const socket: PsfTcpSocket): Word; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_getLocalPort';

function sfTcpSocket_getRemoteAddress(const socket: PsfTcpSocket): sfIpAddress; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_getRemoteAddress';

function sfTcpSocket_getRemotePort(const socket: PsfTcpSocket): Word; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_getRemotePort';

function sfTcpSocket_connect(socket: PsfTcpSocket; remoteAddress: sfIpAddress; remotePort: Word; timeout: sfTime): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_connect';

procedure sfTcpSocket_disconnect(socket: PsfTcpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_disconnect';

function sfTcpSocket_send(socket: PsfTcpSocket; const data: Pointer; size: NativeUInt): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_send';

function sfTcpSocket_sendPartial(socket: PsfTcpSocket; const data: Pointer; size: NativeUInt; sent: PNativeUInt): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_sendPartial';

function sfTcpSocket_receive(socket: PsfTcpSocket; data: Pointer; size: NativeUInt; received: PNativeUInt): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_receive';

function sfTcpSocket_sendPacket(socket: PsfTcpSocket; packet: PsfPacket): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_sendPacket';

function sfTcpSocket_receivePacket(socket: PsfTcpSocket; packet: PsfPacket): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfTcpSocket_receivePacket';

function sfUdpSocket_create(): PsfUdpSocket; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_create';

procedure sfUdpSocket_destroy(const socket: PsfUdpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_destroy';

procedure sfUdpSocket_setBlocking(socket: PsfUdpSocket; blocking: Boolean); cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_setBlocking';

function sfUdpSocket_isBlocking(const socket: PsfUdpSocket): Boolean; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_isBlocking';

function sfUdpSocket_getLocalPort(const socket: PsfUdpSocket): Word; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_getLocalPort';

function sfUdpSocket_bind(socket: PsfUdpSocket; port: Word; address: sfIpAddress): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_bind';

procedure sfUdpSocket_unbind(socket: PsfUdpSocket); cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_unbind';

function sfUdpSocket_send(socket: PsfUdpSocket; const data: Pointer; size: NativeUInt; remoteAddress: sfIpAddress; remotePort: Word): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_send';

function sfUdpSocket_receive(socket: PsfUdpSocket; data: Pointer; size: NativeUInt; received: PNativeUInt; remoteAddress: PsfIpAddress; remotePort: PWord): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_receive';

function sfUdpSocket_sendPacket(socket: PsfUdpSocket; packet: PsfPacket; remoteAddress: sfIpAddress; remotePort: Word): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_sendPacket';

function sfUdpSocket_receivePacket(socket: PsfUdpSocket; packet: PsfPacket; remoteAddress: PsfIpAddress; remotePort: PWord): sfSocketStatus; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_receivePacket';

function sfUdpSocket_maxDatagramSize(): Cardinal; cdecl;
  external PSFML_DLL name _PU + 'sfUdpSocket_maxDatagramSize';

function crc32(crc: uLong; const buf: PBytef; len: uInt): uLong; cdecl;
  external PSFML_DLL name _PU + 'crc32';

function unzOpen64(const path: Pointer): unzFile; cdecl;
  external PSFML_DLL name _PU + 'unzOpen64';

function unzLocateFile(&file: unzFile; const szFileName: PUTF8Char; iCaseSensitivity: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzLocateFile';

function unzClose(&file: unzFile): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzClose';

function unzOpenCurrentFilePassword(&file: unzFile; const password: PUTF8Char): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzOpenCurrentFilePassword';

function unzGetCurrentFileInfo64(&file: unzFile; pfile_info: Punz_file_info64; szFileName: PUTF8Char; fileNameBufferSize: uLong; extraField: Pointer; extraFieldBufferSize: uLong; szComment: PUTF8Char; commentBufferSize: uLong): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzGetCurrentFileInfo64';

function unzReadCurrentFile(&file: unzFile; buf: voidp; len: Cardinal): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzReadCurrentFile';

function unzCloseCurrentFile(&file: unzFile): Integer; cdecl;
  external PSFML_DLL name _PU + 'unzCloseCurrentFile';

function unztell64(&file: unzFile): UInt64; cdecl;
  external PSFML_DLL name _PU + 'unztell64';

function zipOpen64(const pathname: Pointer; append: Integer): zipFile; cdecl;
  external PSFML_DLL name _PU + 'zipOpen64';

function zipOpenNewFileInZip3_64(&file: zipFile; const filename: PUTF8Char; const zipfi: Pzip_fileinfo; const extrafield_local: Pointer; size_extrafield_local: uInt; const extrafield_global: Pointer; size_extrafield_global: uInt; const comment: PUTF8Char; method: Integer; level: Integer; raw: Integer; windowBits: Integer; memLevel: Integer; strategy: Integer; const password: PUTF8Char; crcForCrypting: uLong; zip64: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'zipOpenNewFileInZip3_64';

function zipWriteInFileInZip(&file: zipFile; const buf: Pointer; len: Cardinal): Integer; cdecl;
  external PSFML_DLL name _PU + 'zipWriteInFileInZip';

function zipCloseFileInZip(&file: zipFile): Integer; cdecl;
  external PSFML_DLL name _PU + 'zipCloseFileInZip';

function zipClose(&file: zipFile; const global_comment: PUTF8Char): Integer; cdecl;
  external PSFML_DLL name _PU + 'zipClose';

function plm_create_with_filename(const filename: PUTF8Char): Pplm_t; cdecl;
  external PSFML_DLL name _PU + 'plm_create_with_filename';

function plm_create_with_file(fh: PPointer; close_when_done: Integer): Pplm_t; cdecl;
  external PSFML_DLL name _PU + 'plm_create_with_file';

function plm_create_with_memory(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_t; cdecl;
  external PSFML_DLL name _PU + 'plm_create_with_memory';

function plm_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_t; cdecl;
  external PSFML_DLL name _PU + 'plm_create_with_buffer';

procedure plm_destroy(self: Pplm_t); cdecl;
  external PSFML_DLL name _PU + 'plm_destroy';

function plm_has_headers(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_has_headers';

function plm_probe(self: Pplm_t; probesize: NativeUInt): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_probe';

function plm_get_video_enabled(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_video_enabled';

procedure plm_set_video_enabled(self: Pplm_t; enabled: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_video_enabled';

function plm_get_num_video_streams(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_num_video_streams';

function plm_get_width(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_width';

function plm_get_height(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_height';

function plm_get_pixel_aspect_ratio(self: Pplm_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_get_pixel_aspect_ratio';

function plm_get_framerate(self: Pplm_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_get_framerate';

function plm_get_audio_enabled(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_audio_enabled';

procedure plm_set_audio_enabled(self: Pplm_t; enabled: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_audio_enabled';

function plm_get_num_audio_streams(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_num_audio_streams';

procedure plm_set_audio_stream(self: Pplm_t; stream_index: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_audio_stream';

function plm_get_samplerate(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_samplerate';

function plm_get_audio_lead_time(self: Pplm_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_get_audio_lead_time';

procedure plm_set_audio_lead_time(self: Pplm_t; lead_time: Double); cdecl;
  external PSFML_DLL name _PU + 'plm_set_audio_lead_time';

function plm_get_time(self: Pplm_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_get_time';

function plm_get_duration(self: Pplm_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_get_duration';

procedure plm_rewind(self: Pplm_t); cdecl;
  external PSFML_DLL name _PU + 'plm_rewind';

function plm_get_loop(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_get_loop';

procedure plm_set_loop(self: Pplm_t; loop: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_loop';

function plm_has_ended(self: Pplm_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_has_ended';

procedure plm_set_video_decode_callback(self: Pplm_t; fp: plm_video_decode_callback; user: Pointer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_video_decode_callback';

procedure plm_set_audio_decode_callback(self: Pplm_t; fp: plm_audio_decode_callback; user: Pointer); cdecl;
  external PSFML_DLL name _PU + 'plm_set_audio_decode_callback';

procedure plm_decode(self: Pplm_t; seconds: Double); cdecl;
  external PSFML_DLL name _PU + 'plm_decode';

function plm_decode_video(self: Pplm_t): Pplm_frame_t; cdecl;
  external PSFML_DLL name _PU + 'plm_decode_video';

function plm_decode_audio(self: Pplm_t): Pplm_samples_t; cdecl;
  external PSFML_DLL name _PU + 'plm_decode_audio';

function plm_seek(self: Pplm_t; time: Double; seek_exact: Integer): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_seek';

function plm_seek_frame(self: Pplm_t; time: Double; seek_exact: Integer): Pplm_frame_t; cdecl;
  external PSFML_DLL name _PU + 'plm_seek_frame';

function plm_buffer_create_with_filename(const filename: PUTF8Char): Pplm_buffer_t; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_create_with_filename';

function plm_buffer_create_with_file(fh: PPointer; close_when_done: Integer): Pplm_buffer_t; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_create_with_file';

function plm_buffer_create_with_memory(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_buffer_t; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_create_with_memory';

function plm_buffer_create_with_capacity(capacity: NativeUInt): Pplm_buffer_t; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_create_with_capacity';

function plm_buffer_create_for_appending(initial_capacity: NativeUInt): Pplm_buffer_t; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_create_for_appending';

procedure plm_buffer_destroy(self: Pplm_buffer_t); cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_destroy';

function plm_buffer_write(self: Pplm_buffer_t; bytes: PUInt8; length: NativeUInt): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_write';

procedure plm_buffer_signal_end(self: Pplm_buffer_t); cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_signal_end';

procedure plm_buffer_set_load_callback(self: Pplm_buffer_t; fp: plm_buffer_load_callback; user: Pointer); cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_set_load_callback';

procedure plm_buffer_rewind(self: Pplm_buffer_t); cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_rewind';

function plm_buffer_get_size(self: Pplm_buffer_t): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_get_size';

function plm_buffer_get_remaining(self: Pplm_buffer_t): NativeUInt; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_get_remaining';

function plm_buffer_has_ended(self: Pplm_buffer_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_buffer_has_ended';

function plm_demux_create(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_demux_t; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_create';

procedure plm_demux_destroy(self: Pplm_demux_t); cdecl;
  external PSFML_DLL name _PU + 'plm_demux_destroy';

function plm_demux_has_headers(self: Pplm_demux_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_has_headers';

function plm_demux_probe(self: Pplm_demux_t; probesize: NativeUInt): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_probe';

function plm_demux_get_num_video_streams(self: Pplm_demux_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_get_num_video_streams';

function plm_demux_get_num_audio_streams(self: Pplm_demux_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_get_num_audio_streams';

procedure plm_demux_rewind(self: Pplm_demux_t); cdecl;
  external PSFML_DLL name _PU + 'plm_demux_rewind';

function plm_demux_has_ended(self: Pplm_demux_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_has_ended';

function plm_demux_seek(self: Pplm_demux_t; time: Double; &type: Integer; force_intra: Integer): Pplm_packet_t; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_seek';

function plm_demux_get_start_time(self: Pplm_demux_t; &type: Integer): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_get_start_time';

function plm_demux_get_duration(self: Pplm_demux_t; &type: Integer): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_get_duration';

function plm_demux_decode(self: Pplm_demux_t): Pplm_packet_t; cdecl;
  external PSFML_DLL name _PU + 'plm_demux_decode';

function plm_video_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_video_t; cdecl;
  external PSFML_DLL name _PU + 'plm_video_create_with_buffer';

procedure plm_video_destroy(self: Pplm_video_t); cdecl;
  external PSFML_DLL name _PU + 'plm_video_destroy';

function plm_video_has_header(self: Pplm_video_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_video_has_header';

function plm_video_get_framerate(self: Pplm_video_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_video_get_framerate';

function plm_video_get_pixel_aspect_ratio(self: Pplm_video_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_video_get_pixel_aspect_ratio';

function plm_video_get_width(self: Pplm_video_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_video_get_width';

function plm_video_get_height(self: Pplm_video_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_video_get_height';

procedure plm_video_set_no_delay(self: Pplm_video_t; no_delay: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_video_set_no_delay';

function plm_video_get_time(self: Pplm_video_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_video_get_time';

procedure plm_video_set_time(self: Pplm_video_t; time: Double); cdecl;
  external PSFML_DLL name _PU + 'plm_video_set_time';

procedure plm_video_rewind(self: Pplm_video_t); cdecl;
  external PSFML_DLL name _PU + 'plm_video_rewind';

function plm_video_has_ended(self: Pplm_video_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_video_has_ended';

function plm_video_decode(self: Pplm_video_t): Pplm_frame_t; cdecl;
  external PSFML_DLL name _PU + 'plm_video_decode';

procedure plm_frame_to_rgb(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_rgb';

procedure plm_frame_to_bgr(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_bgr';

procedure plm_frame_to_rgba(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_rgba';

procedure plm_frame_to_bgra(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_bgra';

procedure plm_frame_to_argb(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_argb';

procedure plm_frame_to_abgr(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external PSFML_DLL name _PU + 'plm_frame_to_abgr';

function plm_audio_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_audio_t; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_create_with_buffer';

procedure plm_audio_destroy(self: Pplm_audio_t); cdecl;
  external PSFML_DLL name _PU + 'plm_audio_destroy';

function plm_audio_has_header(self: Pplm_audio_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_has_header';

function plm_audio_get_samplerate(self: Pplm_audio_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_get_samplerate';

function plm_audio_get_time(self: Pplm_audio_t): Double; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_get_time';

procedure plm_audio_set_time(self: Pplm_audio_t; time: Double); cdecl;
  external PSFML_DLL name _PU + 'plm_audio_set_time';

procedure plm_audio_rewind(self: Pplm_audio_t); cdecl;
  external PSFML_DLL name _PU + 'plm_audio_rewind';

function plm_audio_has_ended(self: Pplm_audio_t): Integer; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_has_ended';

function plm_audio_decode(self: Pplm_audio_t): Pplm_samples_t; cdecl;
  external PSFML_DLL name _PU + 'plm_audio_decode';

procedure redirect_cerr_to_callback(callback: cerr_callback; user_data: Pointer); cdecl;
  external PSFML_DLL name _PU + 'redirect_cerr_to_callback';

procedure restore_cerr(); cdecl;
  external PSFML_DLL name _PU + 'restore_cerr';

implementation

end.
