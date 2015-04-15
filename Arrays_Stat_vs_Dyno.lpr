program Arrays_Stat_vs_Dyno;

procedure PointerOfArray(var Arr: array of Char); overload;
begin
  Write(' var Arr: @Arr and @Arr[Low(Arr)] is ');
  if @Arr = @Arr[Low(Arr)] then
    Writeln('equal')
  else
    Writeln('different');
end;

procedure CompareStatArray1stElement;
var
  Arr: array [0..15] of Char;
begin
  Write('Stat Arr: @Arr and @Arr[Low(Arr)] is ');
  if @Arr = @Arr[Low(Arr)] then
    Writeln('equal')
  else
    Writeln('different');
  PointerOfArray(Arr);
end;

procedure CompareDynoArray1stElement;
var
  Arr: array of Char;
begin
  SetLength(Arr, 16);
  Write('Dyno Arr: @Arr and @Arr[Low(Arr)] is ');
  if @Arr = @Arr[Low(Arr)] then
    Writeln('equal')
  else
    Writeln('different');
  PointerOfArray(Arr);
end;

function PointerOfArray(var Arr: array of Byte): Pointer; overload;
begin
  Result := @Arr;
end;

procedure CheckPointerOfStatArray;
var
  Arr: array[0..15] of Byte;
begin
  Write('Stat Arr: PointerOfArray(var Arr) and @Arr is ');
  if PointerOfArray(Arr) = @Arr then
    Writeln('equal')
  else
    Writeln('different');
end;

procedure CheckPointerOfDynoArray;
var
  Arr: array of Byte;
begin
  SetLength(Arr, 16);
  Write('Dyno Arr: PointerOfArray(var Arr) and @Arr is ');
  if PointerOfArray(Arr) = @Arr then
    Writeln('equal')
  else
    Writeln('different');
end;

procedure CheckPointerOfStatArray1stElement;
var
  Arr: array[5..15] of Byte;
begin
  Write('Stat Arr: PointerOfArray(var Arr) and @Arr[Low(Arr)] is ');
  if PointerOfArray(Arr) = @Arr[Low(Arr)] then
    Writeln('equal')
  else
    Writeln('different');
end;

procedure CheckPointerOfDynoArray1stElement;
var
  Arr: array of Byte;
begin
  SetLength(Arr, 16);
  Write('Dyno Arr: PointerOfArray(var Arr) and @Arr[Low(Arr)] is ');
  if PointerOfArray(Arr) = @Arr[Low(Arr)] then
    Writeln('equal')
  else
    Writeln('different');
end;

begin
  CompareStatArray1stElement;
  CompareDynoArray1stElement;
  Writeln;
  CheckPointerOfStatArray;
  CheckPointerOfDynoArray;
  Writeln;
  CheckPointerOfStatArray1stElement;
  CheckPointerOfDynoArray1stElement;
end.


