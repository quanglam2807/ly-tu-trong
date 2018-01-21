uses windows;
const fileinp = 'khohang.inp';
      fileout = 'khohang.out';
      maxN = 10000;

var n,m,res,c,time:longint;
    a:array[1..maxN] of longint;
    s:array[1..2] of longint;


procedure Init;
var i:longint;
begin
  time:=gettickcount;
  assign(input,fileinp); reset(input);
  readln(n,m);
  for i:=1 to n do
    readln(a[i]);
  close(input);
end;

procedure QSort(l,r:longint);
var i,j,p,tmp:longint;
begin
  if l >= r then exit;
  i:=l;
  j:=r;
  p:=a[l + random(r-l+1)];
  repeat
    while a[i] < p do inc(i);
    while a[j] > p do dec(j);
    if i <= j then
      begin
        tmp:=a[i];
        a[i]:=a[j];
        a[i]:=tmp;
        inc(i); dec(j);
      end;
  until i > j;
  QSort(l,j); QSort(i,r);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  close(output);
  halt;
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > n then
    begin
      if c > res then res:=c;
      exit;
    end;
  for j:=2 downto 0 do
    begin
      if gettickcount - time > 800 then Print;
      if (j > 0) then
        begin
          if (s[j] + a[i] > m) then continue;
          s[j]:=s[j] + a[i];
          inc(c);
          Generate(i+1);
          dec(c);
          s[j]:=s[j] - a[i];
        end
      else
        Generate(i+1);
    end;
end;

procedure Analyse;
var i:longint;
begin
  randomize;
  QSort(1,n);
  s[1]:=0;
  s[2]:=0;
  res:=0;
  c:=0;
  Generate(1);
end;

begin
  Init;
  Analyse;
  Print;
end.
