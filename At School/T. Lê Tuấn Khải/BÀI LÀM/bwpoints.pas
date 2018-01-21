uses math;

const fileinp = 'bwpoints.inp';
      fileout = 'bwpoints.out';
      maxN = 100000;

type list = record
             x,y:longint;
            end;

var n,count:longint;
    a:array[1..maxN*2] of list;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(a[i].x);
  for i:=1 to n do a[i].y:=1;
  readln;
  for i:=1 to n do read(a[n+i].x);
  for i:=1 to n do a[n+i].y:=0;
  close(input);
end;

procedure QSort(l,r:longint);
var i,j,p:longint;
    tmp:list;
begin
  if l > r then exit;
  i:=l;
  j:=r;
  p:=a[(l+r) div 2].x;
  repeat
    while a[i].x < p do inc(i);
    while a[j].x > p do dec(j);
    if i <= j then
      begin
        tmp:=a[i];
        a[i]:=a[j];
        a[j]:=tmp;
        inc(i); dec(j);
      end;
  until i > j;
  QSort(l,j); QSort(i,r);
end;

procedure Analyse;
var i,j:longint;
begin
  QSort(1,2*n);
  i:=1;
  j:=2;
  repeat
    if a[i].y <> a[j].y then
      begin
        inc(count);
        i:=j+1;
        j:=i+1;
      end
    else
      inc(j);
  until false;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.