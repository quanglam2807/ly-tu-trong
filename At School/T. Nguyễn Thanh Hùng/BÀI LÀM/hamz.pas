const
      fileout = 'hamz.out';
      maxN = 1000000;

var s:array[1..maxN] of char;
    z:array[1..maxN] of longint;
    n:longint;

procedure Generate;
var i,j:longint;
    tmp:char;
begin   {
  randomize;
  for i:=1 to 1000000 do
    s[i]:=chr(random(3)+1);
  n:=maxN;}
  s:='aba ababacda';
  n:=12;
end;

function min(a,b:longint):longint;
begin
  if a < b then exit(a)
  else exit(b);
end;

procedure Analyse;
var r,l,i:longint;
begin
  fillchar(z,sizeof(z),0);
  r:=1;
  l:=1;
  z[1]:=0;
  for i:=2 to n do
    begin
      if i<r then
        z[i]:=min(z[i-l+1],r-i+1);
      while (i+z[i] <= n) and (s[i+z[i]]=s[z[i]+1]) do
        inc(z[i]);
      if i+z[i]-l>r then
        begin
          r:=i+z[i]-1;
          l:=i;
        end;
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to 1000000 do
    writeln(s[i],' ',z[i]);
  close(output);
end;

begin
  Generate;
  Analyse;
  Print;
end.
