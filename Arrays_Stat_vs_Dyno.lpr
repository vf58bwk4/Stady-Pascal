program Arrays_Stat_vs_Dyno;

procedure CompareStatArray1stElement;
var
  StatArr: array [0..15] of Char;
begin
  Write('CompareStatArray1stElement: @StatArr and @StatArr[Low(StatArr)] is ');
  if @StatArr = @StatArr[Low(StatArr)] then
    Writeln('equal')
  else
    Writeln('different');
end;

procedure CompareDynoArray1stElement;
var
  DynoArr: array of Char;
begin
  SetLength(DynoArr, 16);
  Write('CompareDynoArray1stElement: @DynoArr and @DynoArr[Low(DynoArr)] is ');
  if @DynoArr = @DynoArr[Low(DynoArr)] then
    Writeln('equal')
  else
    Writeln('different');
end;

begin
  CompareStatArray1stElement;
  CompareDynoArray1stElement;
end.


