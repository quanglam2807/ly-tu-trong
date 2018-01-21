const fileinp = 'acm.inp';
      fileout = 'acm.out';
      maxN = 400000;

var n,c1,c2,s:longint;
    a,b,x,y:array[1..maxN*2] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  c1:=0;
  c2:=0;
  for i:=1 to 2*n do
    begin
      readln(a[i],b[i]);
      if a[i] <= b[i] then
        begin
          inc(c1);
          x[c1]:=i;
        end
      else
        begin
          inc(c2);
          y[c2]:=i;
        end;
    end;
  close(input);
end;

procedure QSort1(l,r:longint);
var i,j,middle,p,tmp:longint;
begin
  if l >= r then exit;
  i:=l;
  j:=r;
  middle:=x[l + random(r-l+1)];
  p:=abs(a[middle] - b[middle]);
  repeat
    while abs(a[x[i]] - b[x[i]]) < p do inc(i);
    while abs(a[x[j]] - b[x[j]]) > p do dec(j);
    if i <= j then
      begin
        tmp:=x[i];
        x[i]:=x[j];
        x[j]:=tmp;
        inc(i); dec(j);
      end;
  until i > j;
  QSort1(l,j); QSort1(i,r);
end;

procedure QSort2(l,r:longint);
var i,j,middle,p,tmp:longint;
begin
  if l >= r then exit;
  i:=l;
  j:=r;
  middle:=y[l + random(r-l+1)];
  p:=abs(a[middle] - b[middle]);
  repeat
    while abs(a[y[i]] - b[y[i]]) < p do inc(i);
    while abs(a[y[j]] - b[y[j]]) > p do dec(j);
    if i <= j then
      begin
        tmp:=y[i];
        y[i]:=y[j];
        y[j]:=tmp;
        inc(i); dec(j);
      end;
  until i > j;
  QSort2(l,j); QSort2(i,r);
end;



procedure Analyse;
var i:longint;
begin
  if c1 = c2 then
    begin
      s:=0;
      for i:=1 to c1 do
        inc(s,a[x[i]]);
      for i:=1 to c2 do
        inc(s,b[y[i]]);
    end;
  if c1 > c2 then
    begin
      QSort1(1,c1);
      s:=0;
      for i:=1 to c2 do
        inc(s,b[y[i]]);
      for i:=1 to (n - c2) do
        inc(s,b[x[i]]);
      for i:=(n - c2)+1 to c1 do
        inc(s,a[x[i]]);
    end;
  if c2 > c1 then
    begin
      QSort2(1,c2);
      s:=0;
      for i:=1 to c1 do
        inc(s,a[x[i]]);
      for i:=1 to (n - c1) do
        inc(s,a[y[i]]);
      for i:=(n - c1)+1 to c2 do
        inc(s,b[y[i]]);
    end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(s);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
