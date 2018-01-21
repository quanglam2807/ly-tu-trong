const fileinp = 'seq.inp';
      fileout = 'seq.out';

var n,k:longint;
    a,b:array[0..100000] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,k);
  for i:=1 to n do
    begin
      read(a[i]);
      b[i]:=i;
    end;
  close(input);
end;

procedure QSort(l,r:longint);
var i,j,p,tmp:longint;
begin
  if l  >= r then exit;
  i:=l;
  j:=r;
  p:=a[(i+j) div 2];
  repeat
    while a[i] < p do inc(i);
    while a[j] > p do dec(j);
    if i <= j then
      begin
        tmp:=a[i];
        a[i]:=a[j];
        a[j]:=tmp;
        tmp:=b[i];
        b[i]:=b[j];
        b[j]:=tmp;
        inc(i); dec(j);
      end;
  until i > j;
  QSort(l,j);
  QSort(i,r);
end;

function Find(w:int64):longint;
var l,r,p:longint;
begin
  l:=1;
  r:=n;
  while l <= r do
    begin
      p:=(l+r) div 2;
      if w < a[p] then r:=p - 1
      else if w > a[p] then l:=p + 1
      else exit(p);
    end;
  exit(0);
end;

procedure Analyse;
var i,j:longint;
begin
  QSort(1,n);
  assign(output,fileout); rewrite(output);
  for i:=1 to n do
    begin
      j:=Find(a[i]-k);
      if (j <> 0) and (b[i] <> b[j]) then
        begin
          writeln(b[i],' ',b[j]);
          exit;
        end;
    end;
  writeln(0);
  close(output);
end;

begin
  Init;
  Analyse;
end.
