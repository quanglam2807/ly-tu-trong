uses windows;

const fileinp = 'lss.inp';
      fileout = 'lss.out';
      maxN = 1000;

var n,g,time:longint;
    min:real;
    q,a:array[0..maxN] of longint;
    ss:array[1..maxN,1..maxN] of real;

procedure Init;
var i:longint;
begin
  time:=gettickcount;
  assign(input,fileinp); reset(input);
  readln(n,g);
  for i:=1 to n do
    readln(a[i]);
  close(input);
end;

function Sum(i,j:longint):real;
var k:longint;
    mean:real;
begin
  if ss[i,j] > 0 then exit(ss[i,j]);
  mean:=0;
  for k:=i to j do
    mean:=mean + a[k];
  mean:=mean/(j-i+1);
  Sum:=0;
  for k:=i to j do
    begin
      Sum:=Sum + sqr(a[k] - mean);
    end;
  ss[i,j]:=Sum;
end;

procedure Check;
var i:longint;
    s:real;
begin
  s:=0;
  for i:=1 to g do
    begin
      s:=s + Sum(q[i-1]+1,q[i]);
      if s >= min then exit;
    end;
  if s < min then
    min:=s;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(min:0:2);
  close(output);
  halt;
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > g-1 then
    begin
      Check;
      exit;
    end;
  for j:=q[i-1]+1 to n-1 do
    begin
      if gettickcount - time > 900 then Print;
      q[i]:=j;
      Generate(i+1);
    end;
end;

procedure Analyse;
begin
  min:=maxlongint;
  q[0]:=0;
  q[g]:=n;
  Generate(1);
end;

begin
  Init;
  Analyse;
  Print;
end.
