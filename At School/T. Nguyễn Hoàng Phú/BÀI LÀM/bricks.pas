const fileinp = 'bricks.inp';
      fileout = 'bricks.out';
var g, y, m, n: int64;
   sum, prod: int64;
   low, middle, high: int64;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readLn(g,y);
  sum:=g div 2 + 2;
  prod:=g + y;
  low:=0;
  high :=sum div 2;
  while low <= high do
    begin
      middle := (low + high) div 2;
      m := middle;
      n := sum - m;
      if (m > prod div n + 1) or (m * n >= prod) then high := middle - 1
      else low := middle + 1;
    end;
  m:=low;
  n:=sum - m;
  writeLn(m, ' ', n);
  close(input); close(output);
end.

