const fileinp = 'sqrt.inp';
      fileout = 'sqrt.out';
      maxN = 40000;

var n,m,sn:longint;
    a:array[1..maxN] of longint;
    free:array[1..maxN] of boolean;
    q:array[0..trunc(sqrt(maxN))] of longint;
    max:array[1..trunc(sqrt(maxN))] of longint;


function MaxF(i:longint):longint;
var j:longint;
begin
  maxF:=0;
  for j:=q[i-1]+1 to q[i] do
    if (free[j]) and (a[j] > maxF) then
      maxF:=a[j];
end;

procedure Split;
var l,i,j:longint;
begin
  l:=trunc(sqrt(n));
  q[0]:=0;
  sn:=0;
  for i:=1 to (n div l) do
    begin
      inc(sn);
      q[sn]:=q[sn-1]+l;
      max[sn]:=maxF(sn);
    end;
  if n mod l > 0 then
    begin
      inc(sn);
      q[sn]:=q[sn-1]+(n mod l);
      max[sn]:=maxF(sn);
    end;
end;

procedure Del(i:longint);
var locate:longint;
begin
  free[i]:=false;
  locate:=i div trunc(sqrt(n));
  if (i mod trunc(sqrt(n)) > 0) then inc(locate);
  max[locate]:=maxF(locate);
end;

procedure Change(i,j:longint);
var locate:longint;
begin
  a[i]:=a[i]+j;
  locate:=i div trunc(sqrt(n));
  if (i mod trunc(sqrt(n)) > 0) then inc(locate);
  max[locate]:=maxF(locate);
end;

procedure PrintMax;
var i,allmax:longint;
begin
  allmax:=0;
  for i:=1 to trunc(sqrt(n)) do
    if max[i] > allmax then
      allmax := max[i];
  writeln(allmax);
end;

procedure Main;
var i,t,x,y,b:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m);
  fillchar(free,sizeof(free),true);
  for i:=1 to n do read(a[i]);
  Split;
  for i:=1 to m do
    begin
      read(t);
      if t = 1 then
        begin
          read(x);
          Del(x);
        end;
      if t = 2 then
        begin
          read(y,b);
          Change(y,b);
        end;
      if t = 3 then
        PrintMax;
    end;
  close(input); close(output);
end;

begin
  Main;
end.
