const fileinp = 'rgame.inp';
      fileout = 'rgame.out';
      maxN = 300000;

var n,x,y:longint;
    d:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  readln(n);
  for i:=1 to n do read(d[i]);
  readln;
end;

procedure QSort(l,r:longint);
var i,j,p,tmp:longint;
begin
  if l > r then exit;
  i:=l;
  j:=r;
  p:=d[(l+r) div 2];
  repeat
    while d[i] > p do inc(i);
    while d[j] < p do dec(j);
    if i <= j then
      begin
        tmp:=d[i];
        d[i]:=d[j];
        d[j]:=tmp;
        inc(i); dec(j);
      end;
  until i > j;
  QSort(l,j); QSort(i,r);
end;

procedure Analyse;
var i:longint;
begin
  QSort(1,n);
  x:=0;
  y:=0;
  i:=1;
  while i <= n do
    begin
      if d[i] = d[i+1] then
        begin
          if x = 0 then x:=d[i]
          else
            begin
              y:=d[i];
              exit;
            end;
          inc(i);
         end;
       inc(i);
    end;
end;

procedure Print;
var s:int64;
begin
  s:=int64(x) * y;
  if s = 0 then writeln(-1)
  else writeln(s);
end;

procedure Main;
var k,i:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(k);
  for i:=1 to k do
    begin
      Init;
      Analyse;
      Print;
    end;
  close(input); close(output);
end;

begin
  Main;
end.
