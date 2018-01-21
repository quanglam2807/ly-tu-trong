uses math;
const fileinp = 'adn.inp';
      fileout = 'adn.out';
      maxN = 1000000;

var a:array[1..maxN] of char;
    n,res:longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  close(input);
end;

procedure Analyse;
var i,countA,countB,k:longint;
begin
  for i:=n downto 1 do
    if a[i] = 'B' then
      begin
        k:=i;
        break;
      end;
  countA:=0;
  countB:=0;
  for i:=1 to k do
    begin
      if a[i] = 'A' then inc(countA);
      if a[i] = 'B' then inc(countB);
    end;
  res:=math.min(countB,countA + 1);

  countA:=0;
  countB:=0;
  if a[1] = 'A' then inc(countA);
  if a[1] = 'B' then inc(countB);
  for i:=2 to n do
    begin
      if (a[i-1]='A') and (a[i]='B') then inc(countB);
      if (a[i-1]='B') and (a[i]='A') then inc(countA);
    end;
  res:=math.min(res,countA+countB);
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
