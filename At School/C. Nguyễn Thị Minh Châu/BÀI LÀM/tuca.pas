const fileinp = 'tuca.inp';
      fileout = 'tuca.out';
      maxN = 100;

var a,b,c,d,e:array[1..maxN] of longint;
    n,k,count:longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,k);
  for i:=1 to n do
    readln(e[i],b[i],c[i],d[i]);
  close(input);
end;

procedure QSort(l,r:longint);
var i,j,p,tmp:longint;
begin
  if l >= r then exit;
  i:=l;
  j:=r;
  p:=a[(l+r) div 2];
  repeat
    while a[i] > p do inc(i);
    while a[j] < p do dec(j);
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
var i,j,k,w:longint;
begin
  for i:=1 to n do
    for j:=1 to n do
      for k:=1 to n do
        for w:=1 to n do
          begin
            inc(count);
            a[count]:=e[i] + b[j] + c[k] + d[w];
          end;
  QSort(1,count);
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to k do
    writeln(a[i]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.