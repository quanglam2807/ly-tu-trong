const fileinp = 'hprimes.inp';
      fileout = 'hprimes.out';

var n,h:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n,h);
  close(input);
end;

function Height(a:longint):longint;
begin
  Height:=0;
  while a <> 0 do
    begin
      inc(Height,a mod 10);
      a:=a div 10;
    end;
end;

function isPrime(x:longint):boolean;
var i:longint;
begin
  for i:=2 to trunc(sqrt(x)) do
    if x mod i = 0 then
      exit(false);
  exit(true);
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=2 to n do
    if (Height(i) = h) and (isPrime(i)) then
      writeln(i);
  close(output);
end;

begin
  Init;
  Print;
end.