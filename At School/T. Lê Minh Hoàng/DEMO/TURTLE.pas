{$MODE OBJFPC}
const
  InputFile  = 'TURTLE.INP';
  OutputFile = 'TURTLE.OUT';
var
  a: array[1..4] of Integer;
  res: Integer;
  f: TextFile;
  i, j: Integer;
  temp: Integer;
begin
  AssignFile(f, InputFile); Reset(f);
  ReadLn(f, a[1], a[2], a[3], a[4]);
  CloseFile(f);
  for i := 1 to 4 do
    for j := i + 1 to 4 do
      if a[i] > a[j] then
        begin
          temp := a[i]; a[i] := a[j]; a[j] := temp;
        end;
  AssignFile(f, OutputFile); Rewrite(f);
  WriteLn(f, Int64(a[1]) * a[3]);
  CloseFile(f);
end.