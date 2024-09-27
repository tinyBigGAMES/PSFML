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

unit PSFML.Math;

{$I PSFML.inc}

interface

uses
  System.Math,
  PSFML,
  PSFML.Ext;

const
  sfKilobyte = 1024;                     // 1 KB = 1024 bytes
  sfMegabyte = 1024 * 1024;              // 1 MB = 1024 * 1024 bytes
  sfGigabyte = 1024 * 1024 * 1024;       // 1 GB = 1024 * 1024 * 1024 bytes

  sfRadToDeg = 180.0 / PI;
  sfDegToRad = PI / 180.0;
  sfEpsilon  = 0.00001;
  sfNan      =  0.0 / 0.0;



type
  { sfVector }
  PsfVector = ^sfVector;
  sfVector = record
    x,y,z,w: Single;
  end;

function  sfVector_fromVector2f(const A: sfVector2f): sfVector;
function  sfVector_fromVector2u(const A: sfVector2u): sfVector;
procedure sfVector_assignXY(var A: sfVector; const X, Y: Single);
procedure sfVector_assigneXYZ(var A: sfVector; const X, Y, Z: Single);
procedure sfVector_assignXYZW(var A: sfVector; const X, Y, Z, W: Single);
procedure sfVector_assignVector(var A: sfVector; const B: sfVector);
procedure sfVector_clear(var A: sfVector);
procedure sfVector_add(var A: sfVector; const B: sfVector);
procedure sfVector_subtract(var A: sfVector; const B: sfVector);
procedure sfVector_multiply(var A: sfVector; const B: sfVector);
procedure sfVector_divide(var A: sfVector; const B: sfVector);
function  sfVector_magnitude(const A: sfVector): Single;
function  sfVector_magnitudeTruncate(const A: sfVector; const AMaxMagnitude: Single): sfVector;
function  sfVector_distance(const A, B: sfVector): Single;
procedure sfVector_normalize(var A: sfVector);
function  sfVector_angle(const A, B: sfVector): Single;
procedure sfVector_thrust(var A: sfVector; const AAngle, ASpeed: Single);
function  sfVector_magnitudeSquared(const A: sfVector): Single;
function  sfVector_dotProduct(const A, B: sfVector): Single;
procedure sfVector_scalerBy(var A: sfVector; const AValue: Single);
procedure sfVector_divideBy(var A: sfVector; const AValue: Single);
function  sfVector_project(const A, B: sfVector): sfVector;
procedure sfVector_negate(var A: sfVector);

type
  { sfPoint }
  PsfPoint = ^sfPoint;
  sfPoint = record
    x,y,z: Single;
  end;

  { sfSize }
  PsfSize = ^sfSize;
  sfSize = record
    w, h: Single;
  end;

  { sfRect }
  PsfRect = ^sfRect;
  sfRect = record
    x, y, w,h: Single;
  end;

  { sfExtent }
  PsfExtent = ^sfExtent;
  sfExtent = record
    minx,miny,maxx,maxy: Single;
  end;

  { sfLineIntersection }
  sfLineIntersection = (sfLineIntersecNone, sfLineIntersecTrue,
    sfLineIntersecParallel);

  { sfEase }
  sfEase = (sfEaseLinearTween, sfEaseInQuad, sfEaseOutQuad,
    sfEaseInOutQuad, sfEaseInCubic, sfEaseOutCubic, sfEaseInOutCubic,
    sfEaseInQuart, sfEaseOutQuart, sfEaseInOutQuart, sfEaseInQuint,
    sfEaseOutQuint, sfEaseInOutQuint, sfEaseInSine, sfEaseOutSine,
    sfEaseInOutSine, sfEaseInExpo, sfEaseOutExpo, sfEaseInOutExpo,
    sfEaseInCircle, sfEaseOutCircle, sfEaseInOutCircle);

  { sfOBB }
  PsfOBB = ^sfOBB;
  sfOBB = record
    Center: sfPoint;
    Extents: sfPoint;
    Rotation: Single;
  end;

{ Structs }
function  sfPoint_create(const X, Y: Single): sfPoint;
function  sfVector_create(const X, Y: Single): sfVector;
function  sfSize_create(const AWidth, AHeight: Single): sfSize;
function  sfRect_create(const X, Y, AWidth, AHeight: Single): sfRect;
function  sfExtent_create(const AMinX, AMinY, AMaxX, AMaxY: Single): sfExtent;

{ Angle }
function  sfAngle_cos(const AAngle: Cardinal): Single;
function  sfAngle_sin(const AAngle: Cardinal): Single;
function  sfAngle_difference(const ASrcAngle, ADestAngle: Single): Single;
procedure sfAngle_rotatePos(const AAngle: Single; var AX, AY: Single);

{ Random }
function  sfRandom_rangeInt(const AMin, AMax: Integer): Integer;
function  sfRandom_rangeFloat(const AMin, AMax: Single): Single;
function  sfRandom_bool(): Boolean;
function  sfRandom_getSeed(): Integer;
procedure sfRandom_setSeed(const AVaLue: Integer);

{ ClipValue }
function  sfClipValue_float(var AVaLue: Single; const AMin, AMax: Single; const AWrap: Boolean): Single;
function  sfClipValue_int(var AVaLue: Integer; const aMin, AMax: Integer; const AWrap: Boolean): Integer;

{ SameSign }
function  sfSameSign_int(const AVaLue1, AVaLue2: Integer): Boolean;
function  sfSameSign_float(const AVaLue1, AVaLue2: Single): Boolean;
function  sfSameValue_double(const A, B: Double; const AEpsilon: Double = 0): Boolean;
function  sfSameValue_float(const A, B: Single; const AEpsilon: Single = 0): Boolean;

{ Collision }
function  sfCollision_pointInRectangle(const APoint: sfVector; const ARect: sfRect): Boolean;
function  sfCollision_pointInCircle(const APoint, ACenter: sfVector; const ARadius: Single): Boolean;
function  sfCollision_pointInTriangle(const APoint, P1, P2, P3: sfVector): Boolean;
function  sfCollision_circlesOverlap(const ACenter1: sfVector; const ARadius1: Single; const ACenter2: sfVector; const ARadius2: Single): Boolean;
function  sfCollision_circleInRectangle(const ACenter: sfVector; const ARadius: Single; const ARect: sfRect): Boolean;
function  sfCollision_rectanglesOverlap(const ARect1, ARect2: sfRect): Boolean;
function  sfCollision_rectangleIntersection(const ARect1, ARect2: sfRect): sfRect;
function  sfCollision_lineIntersection(const X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer; var X: Integer; var Y: Integer): UInt32;
function  sfCollision_radiusOverlap(const ARadius1, X1, Y1, ARadius2, X2, Y2, AShrinkFactor: Single): Boolean;
function  sfEase_Value(ACurrentTime: Double; AStartValue: Double; AChangeInValue: Double; ADuration: Double; AEaseType: UInt32): Double;
function  sfEase_position(AStartPos: Double; AEndPos: Double; ACurrentPos: Double; AEaseType: UInt32): Double;
function  sfCollision_oBBIntersect(const AObbA, AObbB: sfOBB): Boolean;

{ Misc }
procedure sfMove_smooth(var AVaLue: Single; const AAmount, AMax, ADrag: Single);
function  sfLerp(const AFrom, ATo, ATime: Double): Double;
function  sfUnit_toScalarValue(const AValue, AMaxValue: Double): Double;

implementation

type
  TsfMath = record
    FCosTable: array [0..360] of Single;
    FSinTable: array [0..360] of Single;
  end;

var
  sfMath: TsfMath;

function  sfVector_fromVector2f(const A: sfVector2f): sfVector;
begin
  Result := Default(sfVector);
  Result.x := A.x;
  Result.y := A.y;
end;

function  sfVector_fromVector2u(const A: sfVector2u): sfVector;
begin
  Result := Default(sfVector);
  Result.x := A.x;
  Result.y := A.y;
end;

procedure sfVector_assignXY(var A: sfVector; const X, Y: Single);
begin
  A := Default(sfVector);
  A.x := X;
  A.y := Y;
end;

procedure sfVector_assigneXYZ(var A: sfVector; const X, Y, Z: Single);
begin
  A := Default(sfVector);
  A.x := X;
  A.y := Y;
  A.z := Z;
end;

procedure sfVector_assignXYZW(var A: sfVector; const X, Y, Z, W: Single);
begin
  A := Default(sfVector);
  A.x := X;
  A.y := Y;
  A.z := Z;
  A.w := W;
end;

procedure sfVector_assignVector(var A: sfVector; const B: sfVector);
begin
  A := B;
end;

procedure sfVector_clear(var A: sfVector);
begin
  A := Default(sfVector);
end;

procedure sfVector_add(var A: sfVector;  const B: sfVector);
begin
  A.x := A.x + B.x;
  A.y := A.y + B.y;
end;

procedure sfVector_subtract(var A: sfVector; const B: sfVector);
begin
  A.x := A.x - B.x;
  A.y := A.y - B.y;
end;

procedure sfVector_multiply(var A: sfVector; const B: sfVector);
begin
  A.x := A.x * B.x;
  A.y := A.y * B.y;
end;

procedure sfVector_divide(var A: sfVector; const B: sfVector);
begin
  A.x := A.x / B.x;
  A.y := A.y / B.y;
end;

function sfVector_magnitude(const A: sfVector): Single;
begin
  Result := Sqrt((A.x * A.x) + (A.y * A.y));
end;

function sfVector_magnitudeTruncate(const A: sfVector; const AMaxMagnitude: Single): sfVector;
var
  LMaxMagSqrd: Single;
  LVecMagSqrd: Single;
  LTruc: Single;
begin
  Result := Default(sfVector);
  Result.x := A.x;
  Result.y := A.y;

  LMaxMagSqrd := AMaxMagnitude * AMaxMagnitude;
  LVecMagSqrd := sfVector_magnitude(Result);
  if LVecMagSqrd > LMaxMagSqrd then
  begin
    LTruc := (AMaxMagnitude / Sqrt(LVecMagSqrd));
    Result.x := Result.x * LTruc;
    Result.y := Result.y * LTruc;
  end;
end;

function sfVector_distance(const A, B: sfVector): Single;
var
  LDirVec: sfVector;
begin
  LDirVec.x := A.x - B.x;
  LDirVec.y := A.y - B.y;
  Result := sfVector_magnitude(LDirVec);
end;

procedure sfVector_normalize(var A: sfVector);
var
  LLen, LOOL: Single;
begin
  LLen := sfVector_magnitude(A);
  if LLen <> 0 then
  begin
    LOOL := 1.0 / LLen;
    A.x := A.x * LOOL;
    A.y := A.y * LOOL;
  end;
end;

function sfVector_angle(const A, B: sfVector): Single;
var
  LXOY: Single;
  LR: sfVector;
begin
  sfVector_assignVector(LR, A);
  sfVector_subtract(LR, B);
  sfVector_normalize(LR);

  if LR.y = 0 then
  begin
    LR.y := 0.001;
  end;

  LXOY := LR.x / LR.y;

  Result := ArcTan(LXOY) * sfRadToDeg;
  if LR.y < 0 then
    Result := Result + 180.0;
end;

procedure sfVector_thrust(var A: sfVector; const AAngle, ASpeed: Single);
var
  LA: Single;
begin
  LA := AAngle + 90.0;
  sfClipValue_float(LA, 0, 360, True);

  A.x := A.x + sfAngle_cos(Round(LA)) * -(aSpeed);
  A.y := A.y + sfAngle_sin(Round(LA)) * -(aSpeed);
end;

function sfVector_magnitudeSquared(const A: sfVector): Single;
begin
  Result := (A.x * A.x) + (A.y * A.y);
end;

function sfVector_dotProduct(const A, B: sfVector): Single;
begin
  Result := (A.x * B.x) + (A.y * B.y);
end;

procedure sfVector_scalerBy(var A: sfVector; const AValue: Single);
begin
  A.x := A.x * AValue;
  A.y := A.y * AValue;
end;

procedure sfVector_divideBy(var A: sfVector; const AValue: Single);
begin
  A.x := A.x / AValue;
  A.y := A.y / AValue;
end;

function sfVector_project(const A, B: sfVector): sfVector;
var
  LDP: Single;
begin
  LDP :=  sfVector_dotProduct(A, B);
  Result.x := (LDP / (B.x * B.x + B.y * B.y)) * B.x;
  Result.y := (LDP / (B.x * B.x + B.y * B.y)) * B.y;
end;

procedure sfVector_negate(var A: sfVector);
begin
  A.x := -A.x;
  A.y := -A.y;
end;

function  sfPoint_create(const X, Y: Single): sfPoint;
begin
  Result.x := X;
  Result.y := Y;
end;

function  sfVector_create(const X, Y: Single): sfVector;
begin
  Result.x := X;
  Result.y := Y;
end;

function  sfSize_create(const AWidth, AHeight: Single): sfSize;
begin
  Result.w := AWidth;
  Result.h := AHeight;
end;

function  sfRect_create(const X, Y, AWidth, AHeight: Single): sfRect;
begin
  Result.x := X;
  Result.y := Y;
  Result.w := AWidth;
  Result.h := AHeight;
end;

function  sfExtent_create(const AMinX, AMinY, AMaxX, AMaxY: Single): sfExtent;
begin
  Result.minx := AMinX;
  Result.miny := AMinY;
  Result.maxx := AMaxX;
  Result.maxy := AMaxY;
end;

function  sfAngle_cos(const AAngle: Cardinal): Single;
var
  LAngle: Cardinal;
begin
  LAngle := EnsureRange(AAngle, 0, 360);
  Result := sfMath.FCosTable[LAngle];
end;

function  sfAngle_sin(const AAngle: Cardinal): Single;
var
  LAngle: Cardinal;
begin
  LAngle := EnsureRange(AAngle, 0, 360);
  Result := sfMath.FSinTable[LAngle];
end;

function _RandomRange(const aFrom, aTo: Integer): Integer;
var
  LFrom: Integer;
  LTo: Integer;
begin
  LFrom := aFrom;
  LTo := aTo;

  if AFrom > ATo then
    Result := Random(LFrom - LTo) + ATo
  else
    Result := Random(LTo - LFrom) + AFrom;
end;

function  sfRandom_rangeInt(const AMin, AMax: Integer): Integer;
begin
  Result := _RandomRange(AMin, AMax + 1);
end;

function  sfRandom_rangeFloat(const AMin, AMax: Single): Single;
var
  LNum: Single;
begin
  LNum := _RandomRange(0, MaxInt) / MaxInt;
  Result := AMin + (LNum * (AMax - AMin));
end;

function  sfRandom_bool(): Boolean;
begin
  Result := Boolean(_RandomRange(0, 2) = 1);
end;

function  sfRandom_getSeed(): Integer;
begin
  Result := System.RandSeed;
end;

procedure sfRandom_setSeed(const AVaLue: Integer);
begin
  System.RandSeed := AVaLue;
end;

function  sfClipValue_float(var AVaLue: Single; const AMin, AMax: Single; const AWrap: Boolean): Single;
begin
  if AWrap then
    begin
      if (AVaLue > AMax) then
      begin
        AVaLue := AMin + Abs(AVaLue - AMax);
        if AVaLue > AMax then
          AVaLue := AMax;
      end
      else if (AVaLue < AMin) then
      begin
        AVaLue := AMax - Abs(AVaLue - AMin);
        if AVaLue < AMin then
          AVaLue := AMin;
      end
    end
  else
    begin
      if AVaLue < AMin then
        AVaLue := AMin
      else if AVaLue > AMax then
        AVaLue := AMax;
    end;

  Result := AVaLue;
end;

function  sfClipValue_int(var AVaLue: Integer; const aMin, AMax: Integer; const AWrap: Boolean): Integer;
begin
  if AWrap then
    begin
      if (AVaLue > AMax) then
      begin
        AVaLue := aMin + Abs(AVaLue - AMax);
        if AVaLue > AMax then
          AVaLue := AMax;
      end
      else if (AVaLue < aMin) then
      begin
        AVaLue := AMax - Abs(AVaLue - aMin);
        if AVaLue < aMin then
          AVaLue := aMin;
      end
    end
  else
    begin
      if AVaLue < aMin then
        AVaLue := aMin
      else if AVaLue > AMax then
        AVaLue := AMax;
    end;

  Result := AVaLue;
end;

function  sfSameSign_int(const AVaLue1, AVaLue2: Integer): Boolean;
begin
  if Sign(AVaLue1) = Sign(AVaLue2) then
    Result := True
  else
    Result := False;
end;

function  sfSameSign_float(const AVaLue1, AVaLue2: Single): Boolean;
begin
  if System.Math.Sign(AVaLue1) = System.Math.Sign(AVaLue2) then
    Result := True
  else
    Result := False;
end;

function  sfSameValue_double(const A, B: Double; const AEpsilon: Double = 0): Boolean;
begin
  Result := System.Math.SameVaLue(A, B, AEpsilon);
end;

function  sfSameValue_float(const A, B: Single; const AEpsilon: Single = 0): Boolean;
begin
  Result := System.Math.SameVaLue(A, B, AEpsilon);
end;

function  sfAngle_difference(const ASrcAngle, ADestAngle: Single): Single;
var
  C: Single;
begin
  C := ADestAngle-ASrcAngle-(Floor((ADestAngle-ASrcAngle)/360.0)*360.0);

  if C >= (360.0 / 2) then
  begin
    C := C - 360.0;
  end;
  Result := C;
end;

procedure sfAngle_rotatePos(const AAngle: Single; var AX, AY: Single);
var
  nx,ny: Single;
  ia: Integer;
  LAngle: Single;
begin
  LAngle := EnsureRange(AAngle, 0, 360);

  ia := Round(LAngle);

  nx := AX*sfMath.FCosTable[ia] - AY*sfMath.FSinTable[ia];
  ny := AY*sfMath.FCosTable[ia] + AX*sfMath.FSinTable[ia];

  AX := nx;
  AY := ny;
end;

procedure sfMove_smooth(var AVaLue: Single; const AAmount, AMax, ADrag: Single);
var
  LAmt: Single;
begin
  LAmt := AAmount;

  if LAmt > 0 then
  begin
    AVaLue := AVaLue + LAmt;
    if AVaLue > AMax then
      AVaLue := AMax;
  end else if LAmt < 0 then
  begin
    AVaLue := AVaLue + LAmt;
    if AVaLue < -AMax then
      AVaLue := -AMax;
  end else
  begin
    if AVaLue > 0 then
    begin
      AVaLue := AVaLue - ADrag;
      if AVaLue < 0 then
        AVaLue := 0;
    end else if AVaLue < 0 then
    begin
      AVaLue := AVaLue + ADrag;
      if AVaLue > 0 then
        AVaLue := 0;
    end;
  end;
end;

function  sfLerp(const AFrom, ATo, ATime: Double): Double;
begin
  if ATime <= 0.5 then
    Result := AFrom + (ATo - AFrom) * ATime
  else
    Result := ATo - (ATo - AFrom) * (1.0 - ATime);
end;

function  sfCollision_pointInRectangle(const APoint: sfVector; const ARect: sfRect): Boolean;
begin
  if ((APoint.x >= ARect.x) and (APoint.x <= (ARect.x + ARect.w)) and
    (APoint.y >= ARect.y) and (APoint.y <= (ARect.y + ARect.h))) then
    Result := True
  else
    Result := False;
end;

function  sfCollision_pointInCircle(const APoint, ACenter: sfVector; const ARadius: Single): Boolean;
begin
  Result := sfCollision_circlesOverlap(APoint, 0, ACenter, ARadius);
end;

function  sfCollision_pointInTriangle(const APoint, P1, P2, P3: sfVector): Boolean;
var
  LAlpha, LBeta, LGamma: Single;
begin
  LAlpha := ((P2.y - P3.y) * (APoint.x - P3.x) + (P3.x - P2.x) *
    (APoint.y - P3.y)) / ((P2.y - P3.y) * (P1.x - P3.x) + (P3.x - P2.x) *
    (P1.y - P3.y));

  LBeta := ((P3.y - P1.y) * (APoint.x - P3.x) + (P1.x - P3.x) *
    (APoint.y - P3.y)) / ((P2.y - P3.y) * (P1.x - P3.x) + (P3.x - P2.x) *
    (P1.y - P3.y));

  LGamma := 1.0 - LAlpha - LBeta;

  if ((LAlpha > 0) and (LBeta > 0) and (LGamma > 0)) then
    Result := True
  else
    Result := False;
end;

function  sfCollision_circlesOverlap(const ACenter1: sfVector; const ARadius1: Single; const ACenter2: sfVector; const ARadius2: Single): Boolean;
var
  LDX, LDY, LDistance: Single;
begin
  LDX := ACenter2.x - ACenter1.x; // X distance between centers
  LDY := ACenter2.y - ACenter1.y; // Y distance between centers

  LDistance := sqrt(LDX * LDX + LDY * LDY); // Distance between centers

  if (LDistance <= (ARadius1 + ARadius2)) then
    Result := True
  else
    Result := False;
end;

function  sfCollision_circleInRectangle(const ACenter: sfVector; const ARadius: Single; const ARect: sfRect): Boolean;
var
  LDX, LDY: Single;
  LCornerDistanceSq: Single;
  LRecCenterX: Integer;
  LRecCenterY: Integer;
begin
  LRecCenterX := Round(ARect.x + ARect.w / 2);
  LRecCenterY := Round(ARect.y + ARect.h / 2);

  LDX := abs(ACenter.x - LRecCenterX);
  LDY := abs(ACenter.y - LRecCenterY);

  if (LDX > (ARect.w / 2.0 + ARadius)) then
  begin
    Result := False;
    Exit;
  end;

  if (LDY > (ARect.h / 2.0 + ARadius)) then
  begin
    Result := False;
    Exit;
  end;

  if (LDX <= (ARect.w / 2.0)) then
  begin
    Result := True;
    Exit;
  end;
  if (LDY <= (ARect.h / 2.0)) then
  begin
    Result := True;
    Exit;
  end;

  LCornerDistanceSq := (LDX - ARect.w / 2.0) * (LDX - ARect.w / 2.0) +
    (LDY - ARect.h / 2.0) * (LDY - ARect.h / 2.0);

  Result := Boolean(LCornerDistanceSq <= (ARadius * ARadius));
end;

function  sfCollision_rectanglesOverlap(const ARect1, ARect2: sfRect): Boolean;
var
  LDX, LDY: Single;
begin
  LDX := abs((ARect1.x + ARect1.w / 2) - (ARect2.x + ARect2.w / 2));
  LDY := abs((ARect1.y + ARect1.h / 2) - (ARect2.y + ARect2.h / 2));

  if ((LDX <= (ARect1.w / 2 + ARect2.w / 2)) and
    ((LDY <= (ARect1.h / 2 + ARect2.h / 2)))) then
    Result := True
  else
    Result := False;
end;

function  sfCollision_rectangleIntersection(const ARect1, ARect2: sfRect): sfRect;
var
  LDXX, LDYY: Single;
begin
  //Result.Assign(0, 0, 0, 0);
  Result := Default(sfRect);

  if sfCollision_rectanglesOverlap(ARect1, ARect2) then
  begin
    LDXX := abs(ARect1.x - ARect2.x);
    LDYY := abs(ARect1.y - ARect2.y);

    if (ARect1.x <= ARect2.x) then
    begin
      if (ARect1.y <= ARect2.y) then
      begin
        Result.x := ARect2.x;
        Result.y := ARect2.y;
        Result.w := ARect1.w - LDXX;
        Result.h := ARect1.h - LDYY;
      end
      else
      begin
        Result.x := ARect2.x;
        Result.y := ARect1.y;
        Result.w := ARect1.w - LDXX;
        Result.h := ARect2.h - LDYY;
      end
    end
    else
    begin
      if (ARect1.y <= ARect2.y) then
      begin
        Result.x := ARect1.x;
        Result.y := ARect2.y;
        Result.w := ARect2.w - LDXX;
        Result.h := ARect1.h - LDYY;
      end
      else
      begin
        Result.x := ARect1.x;
        Result.y := ARect1.y;
        Result.w := ARect2.w - LDXX;
        Result.h := ARect2.h - LDYY;
      end
    end;

    if (ARect1.w > ARect2.w) then
    begin
      if (Result.w >= ARect2.w) then
        Result.w := ARect2.w;
    end
    else
    begin
      if (Result.w >= ARect1.w) then
        Result.w := ARect1.w;
    end;

    if (ARect1.h > ARect2.h) then
    begin
      if (Result.h >= ARect2.h) then
        Result.h := ARect2.h;
    end
    else
    begin
      if (Result.h >= ARect1.h) then
        Result.h := ARect1.h;
    end
  end;
end;

function  sfCollision_lineIntersection(const X1, Y1, X2, Y2, X3, Y3, X4, Y4: Integer; var X: Integer; var Y: Integer): UInt32;
var
  LAX, LBX, LCX, LAY, LBY, LCY, LD, LE, LF, LNum: Integer;
  LOffset: Integer;
  LX1Lo, LX1Hi, LY1Lo, LY1Hi: Integer;
begin
  Result := Ord(sfLineIntersecNone);

  LAX := X2 - X1;
  LBX := X3 - X4;

  if (LAX < 0) then // X bound box test
  begin
    LX1Lo := X2;
    LX1Hi := X1;
  end
  else
  begin
    LX1Hi := X2;
    LX1Lo := X1;
  end;

  if (LBX > 0) then
  begin
    if (LX1Hi < X4) or (X3 < LX1Lo) then
      Exit;
  end
  else
  begin
    if (LX1Hi < X3) or (X4 < LX1Lo) then
      Exit;
  end;

  LAY := Y2 - Y1;
  LBY := Y3 - Y4;

  if (LAY < 0) then // Y bound box test
  begin
    LY1Lo := Y2;
    LY1Hi := Y1;
  end
  else
  begin
    LY1Hi := Y2;
    LY1Lo := Y1;
  end;

  if (LBY > 0) then
  begin
    if (LY1Hi < Y4) or (Y3 < LY1Lo) then
      Exit;
  end
  else
  begin
    if (LY1Hi < Y3) or (Y4 < LY1Lo) then
      Exit;
  end;

  LCX := X1 - X3;
  LCY := Y1 - Y3;
  LD := LBY * LCX - LBX * LCY; // alpha numerator
  LF := LAY * LBX - LAX * LBY; // both denominator

  if (LF > 0) then // alpha tests
  begin
    if (LD < 0) or (LD > LF) then
      Exit;
  end
  else
  begin
    if (LD > 0) or (LD < LF) then
      Exit
  end;

  LE := LAX * LCY - LAY * LCX; // beta numerator
  if (LF > 0) then // beta tests
  begin
    if (LE < 0) or (LE > LF) then
      Exit;
  end
  else
  begin
    if (LE > 0) or (LE < LF) then
      Exit;
  end;

  // compute intersection coordinates

  if (LF = 0) then
  begin
    Result := Ord(sfLineIntersecParallel);
    Exit;
  end;

  LNum := LD * LAX; // numerator
  // if SameSigni(num, f) then
  if Sign(LNum) = Sign(LF) then

    LOffset := LF div 2
  else
    LOffset := -LF div 2;
  X := X1 + (LNum + LOffset) div LF; // intersection x

  LNum := LD * LAY;
  // if SameSigni(num, f) then
  if Sign(LNum) = Sign(LF) then
    LOffset := LF div 2
  else
    LOffset := -LF div 2;

  Y := Y1 + (LNum + LOffset) div LF; // intersection y

  Result := Ord(sfLineIntersecTrue);
end;

function  sfCollision_radiusOverlap(const ARadius1, X1, Y1, ARadius2, X2, Y2, AShrinkFactor: Single): Boolean;
var
  LDist: Single;
  LR1, LR2: Single;
  LV1, LV2: sfVector;
begin
  LR1 := ARadius1 * AShrinkFactor;
  LR2 := ARadius2 * AShrinkFactor;

  LV1.x := X1;
  LV1.y := Y1;
  LV2.x := X2;
  LV2.y := Y2;

  //LDist := LV1.distance(LV2);
  LDist := sfVector_distance(LV1, LV2);

  if (LDist < LR1) or (LDist < LR2) then
    Result := True
  else
    Result := False;
end;

function  sfEase_Value(ACurrentTime: Double; AStartValue: Double; AChangeInValue: Double; ADuration: Double; AEaseType: UInt32): Double;
begin
  Result := 0;
  case sfEase(AEaseType) of
    sfEaseLinearTween:
      begin
        Result := AChangeInValue * ACurrentTime / ADuration + AStartValue;
      end;

    sfEaseInQuad:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := AChangeInValue * ACurrentTime * ACurrentTime + AStartValue;
      end;

    sfEaseOutQuad:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := -AChangeInValue * ACurrentTime * (ACurrentTime-2) + AStartValue;
      end;

    sfEaseInOutQuad:
      begin
        ACurrentTime := ACurrentTime / (ADuration / 2);
        if ACurrentTime < 1 then
          Result := AChangeInValue / 2 * ACurrentTime * ACurrentTime + AStartValue
        else
        begin
          ACurrentTime := ACurrentTime - 1;
          Result := -AChangeInValue / 2 * (ACurrentTime * (ACurrentTime - 2) - 1) + AStartValue;
        end;
      end;

    sfEaseInCubic:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := AChangeInValue * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue;
      end;

    sfEaseOutCubic:
      begin
        ACurrentTime := (ACurrentTime / ADuration) - 1;
        Result := AChangeInValue * ( ACurrentTime * ACurrentTime * ACurrentTime + 1) + AStartValue;
      end;

    sfEaseInOutCubic:
      begin
        ACurrentTime := ACurrentTime / (ADuration/2);
        if ACurrentTime < 1 then
          Result := AChangeInValue / 2 * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue
        else
        begin
          ACurrentTime := ACurrentTime - 2;
          Result := AChangeInValue / 2 * (ACurrentTime * ACurrentTime * ACurrentTime + 2) + AStartValue;
        end;
      end;

    sfEaseInQuart:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := AChangeInValue * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue;
      end;

    sfEaseOutQuart:
      begin
        ACurrentTime := (ACurrentTime / ADuration) - 1;
        Result := -AChangeInValue * (ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime - 1) + AStartValue;
      end;

    sfEaseInOutQuart:
      begin
        ACurrentTime := ACurrentTime / (ADuration / 2);
        if ACurrentTime < 1 then
          Result := AChangeInValue / 2 * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue
        else
        begin
          ACurrentTime := ACurrentTime - 2;
          Result := -AChangeInValue / 2 * (ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime - 2) + AStartValue;
        end;
      end;

    sfEaseInQuint:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := AChangeInValue * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue;
      end;

    sfEaseOutQuint:
      begin
        ACurrentTime := (ACurrentTime / ADuration) - 1;
        Result := AChangeInValue * (ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + 1) + AStartValue;
      end;

    sfEaseInOutQuint:
      begin
        ACurrentTime := ACurrentTime / (ADuration / 2);
        if ACurrentTime < 1 then
          Result := AChangeInValue / 2 * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue
        else
        begin
          ACurrentTime := ACurrentTime - 2;
          Result := AChangeInValue / 2 * (ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + 2) + AStartValue;
        end;
      end;

    sfEaseInSine:
      begin
        Result := -AChangeInValue * Cos(ACurrentTime / ADuration * (PI / 2)) + AChangeInValue + AStartValue;
      end;

    sfEaseOutSine:
      begin
        Result := AChangeInValue * Sin(ACurrentTime / ADuration * (PI / 2)) + AStartValue;
      end;

    sfEaseInOutSine:
      begin
        Result := -AChangeInValue / 2 * (Cos(PI * ACurrentTime / ADuration) - 1) + AStartValue;
      end;

    sfEaseInExpo:
      begin
        Result := AChangeInValue * Power(2, 10 * (ACurrentTime/ADuration - 1) ) + AStartValue;
      end;

    sfEaseOutExpo:
      begin
        Result := AChangeInValue * (-Power(2, -10 * ACurrentTime / ADuration ) + 1 ) + AStartValue;
      end;

    sfEaseInOutExpo:
      begin
        ACurrentTime := ACurrentTime / (ADuration/2);
        if ACurrentTime < 1 then
          Result := AChangeInValue / 2 * Power(2, 10 * (ACurrentTime - 1) ) + AStartValue
        else
         begin
           ACurrentTime := ACurrentTime - 1;
           Result := AChangeInValue / 2 * (-Power(2, -10 * ACurrentTime) + 2 ) + AStartValue;
         end;
      end;

    sfEaseInCircle:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := -AChangeInValue * (Sqrt(1 - ACurrentTime * ACurrentTime) - 1) + AStartValue;
      end;

    sfEaseOutCircle:
      begin
        ACurrentTime := (ACurrentTime / ADuration) - 1;
        Result := AChangeInValue * Sqrt(1 - ACurrentTime * ACurrentTime) + AStartValue;
      end;

    sfEaseInOutCircle:
      begin
        ACurrentTime := ACurrentTime / (ADuration / 2);
        if ACurrentTime < 1 then
          Result := -AChangeInValue / 2 * (Sqrt(1 - ACurrentTime * ACurrentTime) - 1) + AStartValue
        else
        begin
          ACurrentTime := ACurrentTime - 2;
          Result := AChangeInValue / 2 * (Sqrt(1 - ACurrentTime * ACurrentTime) + 1) + AStartValue;
        end;
      end;
  end;
end;

function  sfEase_position(AStartPos: Double; AEndPos: Double; ACurrentPos: Double; AEaseType: UInt32): Double;
var
  LT, LB, LC, LD: Double;
begin
  LC := AEndPos - AStartPos;
  LD := 100;
  LT := ACurrentPos;
  LB := AStartPos;
  Result := sfEase_Value(LT, LB, LC, LD, AEaseType);
  if Result > 100 then
    Result := 100;
end;

function  sfCollision_oBBIntersect(const AObbA, AObbB: sfOBB): Boolean;
var
  LAxes: array[0..3] of sfPoint;
  I: Integer;
  LProjA, LProjB: sfPoint;

  function Dot(const A, B: sfPoint): Single;
  begin
    Result := A.x * B.x + A.y * B.y;
  end;

  function Rotate(const V: sfPoint; AAngle: Single): sfPoint;
  var
    s, c: Single;
    LAngle: Cardinal;
  begin
    LAngle := Abs(Round(AAngle));
    s := sfAngle_sin(LAngle);
    c := sfAngle_cos(LAngle);
    Result.x := V.x * c - V.y * s;
    Result.y := V.x * s + V.y * c;
  end;

  function Project(const AObb: sfOBB; const AAxis: sfPoint): sfPoint;
  var
    LCorners: array[0..3] of sfPoint;
    I: Integer;
    LDot: Single;
  begin
    LCorners[0] := Rotate(sfPoint_create(AObb.Extents.x, AObb.Extents.y), AObb.Rotation);
    LCorners[1] := Rotate(sfPoint_create(-AObb.Extents.x, AObb.Extents.y), AObb.Rotation);
    LCorners[2] := Rotate(sfPoint_create(AObb.Extents.x, -AObb.Extents.y), AObb.Rotation);
    LCorners[3] := Rotate(sfPoint_create(-AObb.Extents.x, -AObb.Extents.y), AObb.Rotation);

    Result.x := Dot(AAxis, sfPoint_create(AObb.Center.x + LCorners[0].x, AObb.Center.y + LCorners[0].y));
    Result.y := Result.x;

    for I := 1 to 3 do
    begin
      LDot := Dot(AAxis, sfPoint_create(AObb.Center.x + LCorners[I].x, AObb.Center.y + LCorners[I].y));
      if LDot < Result.x then Result.x := LDot;
      if LDot > Result.y then Result.y := LDot;
    end;
  end;


begin
  LAxes[0] := Rotate(sfPoint_create(1, 0), AObbA.Rotation);
  LAxes[1] := Rotate(sfPoint_create(0, 1), AObbA.Rotation);
  LAxes[2] := Rotate(sfPoint_create(1, 0), AObbB.Rotation);
  LAxes[3] := Rotate(sfPoint_create(0, 1), AObbB.Rotation);

  for I := 0 to 3 do
  begin
    LProjA := Project(AObbA, LAxes[I]);
    LProjB := Project(AObbB, LAxes[I]);
    if (LProjA.y < LProjB.x) or (LProjB.y < LProjA.x) then Exit(False);
  end;

  Result := True;
end;

function  sfUnit_toScalarValue(const AValue, AMaxValue: Double): Double;
var
  LGain: Double;
  LFactor: Double;
  LVolume: Double;
begin
  LGain := (EnsureRange(AValue, 0.0, 1.0) * 50) - 50;
  LFactor := Power(10, LGain * 0.05);
  LVolume := EnsureRange(AMaxValue * LFactor, 0, AMaxValue);
  Result := LVolume;
end;

initialization
var
  I: Integer;
begin
  // init random number generator
  System.Randomize;

  // init sin/cos tables
  for I := 0 to 360 do
  begin
    sfMath.FCosTable[I] := cos((I * PI / 180.0));
    sfMath.FSinTable[I] := sin((I * PI / 180.0));
  end;
end;

finalization
begin

end;

end.
