const fileinp = 'nknumfre.inp';
      fileout = 'nknumfre.out';


var a,b,count:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(a,b);
  close(input);
end;

function N(a:longint):longint;
begin
  N:=a mod 10;
  a:=a div 10;
  while a <> 0 do
    begin
      N:=N*10+a mod 10;
      a:=a div 10;
    end;
end;

function UCLN(a,b:longint):longint;
begin
  if a < b then exit(UCLN(b,a));
  if b = 0 then exit(a);
  exit(UCLN(b,a mod b));
end;

procedure Analyse;
var i:longint;
begin
  count:=0;
  for i:=a to b do
    if UCLN(i,N(i)) = 1 then
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