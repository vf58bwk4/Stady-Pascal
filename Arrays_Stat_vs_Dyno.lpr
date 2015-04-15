{$Revision$
}
program Arrays_Stat_vs_Dyno;

procedure PointerOfArray(var Arr: array of Char); overload;
begin
  write(' var Arr: @Arr and @Arr[Low(Arr)] is ');
  if @Arr = @Arr[Low(Arr)] then
    writeln('equal')
  else
    writeln('different');
end;

procedure CompareStatArray1stElement;
var
  Arr: array [0..15] of Char;
begin
  write('Stat Arr: @Arr and @Arr[Low(Arr)] is ');
  if @Arr = @Arr[Low(Arr)] then
    writeln('equal')
  else
    writeln('different');
  PointerOfArray(Arr);
end;

procedure CompareDynoArray1stElement;
var
  Arr: array of Char;
begin
  SetLength(Arr, 16);
  write('Dyno Arr: @Arr and @Arr[Low(Arr)] is ');
  if @Arr = @Arr[Low(Arr)] then
    writeln('equal')
  else
    writeln('different');
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
  write('Stat Arr: PointerOfArray(var Arr) and @Arr is ');
  if PointerOfArray(Arr) = @Arr then
    writeln('equal')
  else
    writeln('different');
end;

procedure CheckPointerOfDynoArray;
var
  Arr: array of Byte;
begin
  SetLength(Arr, 16);
  write('Dyno Arr: PointerOfArray(var Arr) and @Arr is ');
  if PointerOfArray(Arr) = @Arr then
    writeln('equal')
  else
    writeln('different');
end;

procedure CheckPointerOfStatArray1stElement;
var
  Arr: array[0..15] of Byte;
begin
  write('Stat Arr: PointerOfArray(var Arr) and @Arr[Low(Arr)] is ');
  if PointerOfArray(Arr) = @Arr[Low(Arr)] then
    writeln('equal')
  else
    writeln('different');
end;

procedure CheckPointerOfDynoArray1stElement;
var
  Arr: array of Byte;
begin
  SetLength(Arr, 16);
  write('Dyno Arr: PointerOfArray(var Arr) and @Arr[Low(Arr)] is ');
  if PointerOfArray(Arr) = @Arr[Low(Arr)] then
    writeln('equal')
  else
    writeln('different');
end;

procedure ArrayParameter(A: array of Byte);
begin
  writeln(High(A));
end;

procedure CheckStatArrayParameter;
var
  Arr: array[1..10] of Byte;
begin
  write('ArrayParameter(A: Stat Array): High(A) = ');
  ArrayParameter(Arr);
end;

procedure CheckDynoArrayParameter;
var
  Arr: array of Byte;
begin
  SetLength(Arr, 10);
  write('ArrayParameter(A: Dyno Array): High(A) = ');
  ArrayParameter(Arr);
end;

procedure PrintArray(var A: array of Integer);
var
  I: Integer;
begin
  write('High(A) = ', High(A), ': ');
  for I in A do
    write(I, ' ');
  writeln;
end;
procedure SliceArray;
var
  Arr: array [5..14] of Integer;
  I: Integer;
begin
  for I:=Low(Arr) to High(Arr) do
    Arr[I] := I;
  PrintArray(Arr[5..10]);
  PrintArray(Arr[7..14]);
end;

begin
  CompareStatArray1stElement;
  CompareDynoArray1stElement;
  writeln;
  CheckPointerOfStatArray;
  CheckPointerOfDynoArray;
  writeln;
  CheckPointerOfStatArray1stElement;
  CheckPointerOfDynoArray1stElement;
  writeln;
  CheckStatArrayParameter;
  CheckDynoArrayParameter;
  writeln;
  SliceArray;
end.


