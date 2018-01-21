const fileinp = 'harvest.inp';
      fileout = 'harvest.out';
      maxN = 10000;

var n,res:longint;
    a:array[0..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  close(input);
end;

procedure Analyse;
var i:longint;
begin
  res:=-maxlongint;
  for i:=2 to n-1 do
    if (a[i-1] + a[i] + a[i+1] > res) then
      res:=a[i-1] + a[i] + a[i+1];
  if a[n] + a[n-1] + a[1] > res then
    res:=a[n] + a[n-1] + a[1];
  if a[1] + a[n] + a[2] > res then
    res:=a[1] + a[2] + a[n];
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.