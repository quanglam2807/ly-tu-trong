var n, i: integer;
    tong: real;
begin
  write('n = '); readln(n);
  tong:=0;
  for i:=n downto 1 do
    tong:=tong + sqrt(i);
  writeln(tong:0:6);
  readln
end.