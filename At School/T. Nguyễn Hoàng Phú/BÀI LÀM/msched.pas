const fileinp = 'msched.inp';
      fileout = 'msched.out';
      maxN = 10000;
      maxG = 10000;

type cow = record
            g,d:longint;
           end;

var n,s:longint;
    a:array[1..maxN] of cow;
    f:array[0..maxG] of boolean;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    readln(a[i].g,a[i].d);
  close(input);
end;

procedure QSort(l,r:longint);
var i,j,p:longint;
    tmp:cow;
begin
  if l >= r then exit;
  i:=l;
  j:=r;
  p:=a[(l+r) div 2].g;
  repeat
    while a[i].g > p do inc(i);
    while a[j].g < p do dec(j);
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
  QSort(1,n);
  s:=0;
  for i:=1 to n do
    for j:=a[i].d-1 downto 0 do
      if not f[j] then
        begin
          inc(s,a[i].g);
          f[j]:=true;
          break;
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
