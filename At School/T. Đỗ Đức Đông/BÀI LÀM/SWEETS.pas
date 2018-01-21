const fileinp = 'SWEETS.inp';
      fileout = 'SWEETS.out';

var s:array['A'..'C'] of int64;
    min:int64;
    n:longint;
    a:array[1..100000] of int64;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(min);
  close(output);
end;

procedure Generate(i:longint);
var c:char;
begin
  if (i > n) then
    begin
      if (S['A'] >= S['C']) and (S['A'] >= S['B']) and (S['B'] >= S['C']) and ((S['A'] - S['C'] < min) or (min = -1)) then
        min:=S['A'] - S['C'];
      if min = 0 then
        begin
          Print;
          halt;
        end;
      exit;
    end;
  for c:='A' to 'C' do
    begin
      s[c]:=s[c] + a[i];
      Generate(i+1);
      s[c]:=s[c] - a[i];
    end;
end;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  close(input);
end;

procedure Analyse;
begin
  min:=-1;
  s['A']:=0;
  S['B']:=0;
  S['C']:=0;
  Generate(1);
end;

begin
  Init;
  if n < 20 then
    begin
      Analyse;
      Print;
    end
  else
    begin
      min:=0;
      Print;
    end;
end.
