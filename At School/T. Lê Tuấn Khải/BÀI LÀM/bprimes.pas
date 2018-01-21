const fileinp = 'bprimes.inp';
      fileout = 'bprimes.out';

var n,h:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n,h);
  close(input);
end;

function BitCount(a:longint):longint;
begin
  BitCount:=0;
  while a <> 0 do
    begin
      if a mod 2 = 1 then inc(BitCount);
      a:=a div 2;
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
var i,count:longint;
begin
  assign(output,fileout); rewrite(output);
  count:=0;
  for i:=2 to n do
    if (BitCount(i) = h) and (isPrime(i)) then
      inc(count);
  writeln(count);
  close(output);
end;

begin
  Init;
  Print;
end.
