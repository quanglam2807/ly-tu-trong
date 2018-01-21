const fileinp = 'cowrun.inp';
      fileout = 'cowrun.out';
      maxP = 500000;
      maxN = 1000;

var n,s:longint;
    p,m:array[0..maxN] of longint;
    l:array[0..maxN,1..maxN] of longint;
    free:array[1..maxN] of boolean;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    readln(p[i]);
  close(input);
end;

procedure LengthCalc;
var i,j:longint;
begin
  p[0]:=0;
  for i:=0 to n do
    for j:=1 to n do
      l[i,j]:=abs(p[i] - p[j]);
end;

procedure Analyse;
var i,cur,min,u,v,count:longint;
begin
  fillchar(free,sizeof(free),true);
  cur:=0;
  count:=0;
  m[0]:=0;
  repeat
    min:=maxP;
    u:=0;
    for v:=1 to n do
      if (free[v]) and (l[cur,v] < min) then
        begin
          u:=v;
          min:=l[cur,v];
        end;
    if u = 0 then exit;
    inc(count);
    m[count]:=m[count-1] + min;
    free[u]:=false;
    cur:=u;
  until false;
end;

procedure SumResult;
var i:longint;
begin
  s:=0;
  for i:=1 to n do
    s:=s + m[i];
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(s);
  close(output);
end;

begin
  Init;
  LengthCalc;
  Analyse;
  sumResult;
  Print;
end.