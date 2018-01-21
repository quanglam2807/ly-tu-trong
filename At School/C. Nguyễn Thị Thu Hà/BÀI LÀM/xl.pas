const fileinp = 'xl.inp';
      fileout = 'xl.out';
      maxM = 30;
      maxN = 1000;

var n,m1,m2,minA,minB:longint;
    a,b,q:array[1..maxM] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  readln(m1);
  for i:=1 to m1 do read(a[i]);
  readln;
  readln(m2);
  for i:=1 to m2 do read(b[i]);
  close(input);
end;

procedure CheckA;
var i,s:longint;
begin
  s:=0;
  for i:=1 to m1 do
    s:=s + q[i];
  if s <> n then exit;
  s:=0;
  for i:=1 to m1 do
    if q[i]*a[i] > s then
      s:=q[i]*a[i];
  if s < minA then minA:=s;
end;

procedure CheckB;
var i,s:longint;
begin
  s:=0;
  for i:=1 to m1 do
    s:=s + q[i];
  if s <> n then exit;
  s:=0;
  for i:=m1+1 to m1+m2 do
    s:=s + q[i];
  if s <> n then exit;

  s:=0;
  donea:=0;
  doneb:=0;
  repeat
    for i:=1 to m1 do
      if q[i] > 0 then
      begin
        inc(donea);
        w[donea]:=a[i];
        a[i]:=a[i] + w[donea];
        dec(q[i]);
      end;
    for i:=m1+1 to m1+m2 do
      begin
      end;
  until false;
  if s < minB then minB:=s;
end;

procedure GenerateA(x:longint);
var i:longint;
begin
  if x > m1 then
    begin
      CheckA;
      exit;
    end;
  for i:=0 to n do
    begin
      q[x]:=i;
      GenerateA(x+1);
    end;
end;

procedure GenerateB(x:longint);
var i:longint;
begin
  if x > m1+m2 then
    begin
      CheckB;
      exit;
    end;
  for i:=0 to n do
    begin
      q[x]:=i;
      GenerateA(x+1);
    end;
end;


procedure Analyse;
begin
  minA:=maxlongint;
  GenerateA(1);
end;

begin
  Init;
  Analyse;
end.