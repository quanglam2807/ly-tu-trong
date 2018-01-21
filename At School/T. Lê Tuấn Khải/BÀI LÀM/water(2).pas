const fileinp = 'water.inp';
      fileout = 'water.out';
      maxN = 100000;

var n,k,count:longint;
    v:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,k);
  for i:=1 to n do
    read(v[i]);
  close(output);
end;

procedure QSort(l,r:longint);
var i,j,p,tmp:longint;
begin
  if l >= r then exit;
  i:=l;
  j:=r;
  p:=v[l+random(r-l+1)];
  repeat
    while v[i] < p do inc(i);
    while v[j] > p do dec(j);
    if i <= j then
      begin
        tmp:=v[i];
        v[i]:=v[j];
        v[j]:=tmp;
        inc(i);
        dec(j);
      end;
  until i > j;
  QSort(l,j); QSort(i,r);
end;

procedure Analyse;
var l,r:longint;
begin
  QSort(1,n);
  count:=0;
  l:=1;
  r:=n;
  while l <= r do
    begin
      if v[l] + v[r] <= k then
        begin
          inc(count);
          inc(l);
          dec(r);
        end
      else if v[r] <= k then
        begin
          inc(count);
          dec(r);
        end
      else
        begin
          count:=0;
          exit;
        end;
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  if count = 0 then writeln('Impossible')
  else writeln(count);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
