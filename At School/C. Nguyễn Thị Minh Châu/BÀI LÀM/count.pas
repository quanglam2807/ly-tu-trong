const fileinp = 'count.inp';
      fileout = 'count.out';

var n,count:longint;
    a:array[1..10000] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    readln(a[i]);
  close(input);
end;

function OK(x:longint):boolean;
var i:longint;
begin
  for i:=2 to trunc(sqrt(x)) do
    if x mod i = 0 then
      exit(false);
  exit(true);
end;

procedure Analyse;
var i:longint;
begin
  count:=0;
  for i:=1 to n do
    if OK(a[i]) then
      inc(count);
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