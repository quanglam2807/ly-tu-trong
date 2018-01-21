{$MODE OBJFPC}
program Task;
const
  InputFile  = 'BRICKS.INP';
  OutputFile = 'BRICKS.OUT';
var
  fi, fo: TextFile;
  g, y, m, n: Int64;
  sum, prod: Int64;
  low, middle, high: Int64;
begin
  AssignFile(fi, InputFile); Reset(fi);
  AssignFile(fo, OutputFile); Rewrite(fo);
  try
    ReadLn(fi, g, y);
    sum := g div 2 + 2;
    prod := g + y;
    low := 0; high := sum div 2;
    while low <= high do
      begin
        middle := (low + high) div 2;
        m := middle;
        n := sum - m;
        if (m > prod div n + 1) or (m * n >= prod) then high := middle - 1
        else low := middle + 1;
      end;
    m := low;
    n := sum - m;
    WriteLn(fo, m, ' ', n);
  finally
    CloseFile(fi); CloseFile(fo);
  end;
end.

