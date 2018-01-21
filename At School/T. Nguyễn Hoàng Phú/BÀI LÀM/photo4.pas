const fileinp = 'photo4.inp';
      fileout = 'photo4.out';
      maxM = 10000;

var n,m,count:longint;
    a:array[1..maxM] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(m);
  n:=0;
  for i:=1 to m do
    begin
      readln(a[i]);
      inc(n,a[i]);
    end;
  close(input);
end;

procedure Analyse;
var i:longint;
begin
  count:=0;
  for i:=1 to m do
    if a[i] > (n div m) then
      inc(count,a[i] - (n div m));
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
