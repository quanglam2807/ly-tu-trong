const fileinp = 'minsum.inp';
      fileout = 'minsum.out';

var n:longint;
    a,b:array[1..1000] of longint;
    min:longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  for i:=1 to n do read(b[i]);
  close(input);
end;

procedure Analyse;
var i,j:longint;
begin
  min:=maxlongint;
  for i:=1 to n do
    for j:=1 to n do
      if abs(a[i] + b[j]) < min then
        min:=abs(a[i] + b[j]);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(min);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.