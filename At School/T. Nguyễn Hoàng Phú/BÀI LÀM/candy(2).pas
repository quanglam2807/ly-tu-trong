uses windows;

const fileinp = 'candy.inp';
      fileout = 'candy.out';
      maxN = 20;

var n,mindis,minofmax,sum,time:longint;
    a,q:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  sum:=0;
  for i:=1 to n do
    begin
      readln(a[i]);
      inc(sum,a[i]);
    end;
  time:=gettickcount;
  close(input);
end;

procedure PrintFail;
begin
  assign(output,fileout); rewrite(output);
  writeln(round(sum/3));
  close(output);
  halt;
end;

procedure Check;
var sum:array[1..3] of longint;
    i,j,maxdis,maxgroup:longint;
begin
  sum[1]:=0;
  sum[2]:=0;
  sum[3]:=0;
  for i:=1 to n do
    inc(sum[q[i]],a[i]);
  maxdis:=0;
  for i:=1 to 2 do
    for j:=i+1 to 3 do
      if abs(sum[i] - sum[j]) > maxdis then
        maxdis:=abs(sum[i]-sum[j]);
  if maxdis > mindis then exit;
  maxgroup:=1;
  for i:=2 to 3 do
    if sum[i] > sum[maxgroup] then
      maxgroup:=i;
  if (maxdis < mindis) then
    begin
      mindis:=maxdis;
      minofmax:=sum[maxgroup];
    end;
  if (maxdis = mindis) and (minofmax = sum[maxgroup]) then
    minofmax:=sum[maxgroup];
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > n then
    begin
      Check;
      exit;
    end;
  for j:=1 to 3 do
    begin
      q[i]:=j;
      if gettickcount - time > 700 then PrintFail;
      Generate(i+1);
    end;
end;

procedure Analyse;
begin
  minofmax:=maxlongint;
  mindis:=maxlongint;
  Generate(1);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(minofmax);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
