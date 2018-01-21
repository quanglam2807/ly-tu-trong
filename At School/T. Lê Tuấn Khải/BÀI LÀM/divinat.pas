const fileinp = 'divinat.inp';
      fileout = 'divinat.out';

var n:qword;
    count:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

function NT(x:qword):boolean;
var i:longint;
begin
  for i:=2 to trunc(sqrt(x)) do
    if x mod i = 0 then
      exit(false);
  exit(true);
end;

function UCLN(x,y:int64):int64;
var tmp:longint;
begin
  if x < y then exit(UCLN(y,x));
  while y <> 0 do
    begin
      tmp:=x mod y;
      x:=y;
      y:=tmp;
    end;
  exit(x);
end;

procedure Analyse;
var i:longint;
begin
  count:=n-1;
  if NT(n) then
    exit;
  count:=1;
  for i:=2 to n-1 do
    if UCLN(n,i)=1 then
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