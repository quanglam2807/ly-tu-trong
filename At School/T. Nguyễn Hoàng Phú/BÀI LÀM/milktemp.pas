const fileinp = 'milktemp.inp';
      fileout = 'milktemp.out';
      maxN = 20000;

var n,x,y,z,max:longint;
    a,b:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,x,y,z);
  for i:=1 to n do
    begin
      readln(a[i],b[i]);
    end;
  close(input);
end;

procedure QSortA(l,r:longint);
var i,j,p,tmp:longint;
begin
  if l >= r then exit;
  i:=l;
  j:=r;
  p:=a[(i+j) div 2];
  while i <= j do
    begin
      while a[i] > p do inc(i);
      while a[j] < p do dec(j);
      if i <= j then
        begin
          tmp:=a[i];
          a[i]:=a[j];
          a[j]:=tmp;
          inc(i);
          dec(j);
        end;
    end;
  QSortA(l,j); QSortA(i,r);
end;

procedure QSortB(l,r:longint);
var i,j,p,tmp:longint;
begin
  if l >= r then exit;
  i:=l;
  j:=r;
  p:=b[(i+j) div 2];
  while i <= j do
    begin
      while b[i] > p do inc(i);
      while b[j] < p do dec(j);
      if i <= j then
        begin
          tmp:=b[i];
          b[i]:=b[j];
          b[j]:=tmp;
          inc(i);
          dec(j);
        end;
    end;
  QSortB(l,j); QSortB(i,r);
end;

procedure Analyse;
var sum,i,j,hot,cold,normal:longint;
begin
  QSortA(1,n);
  QSortB(1,n);
  max:=0;
  j:=1;
  for i:=1 to n do
    begin
      cold:=i-1;
      while b[j] >= a[i] do inc(j);
      hot:=n-j+1;
      normal:=n-hot-cold;
      sum:=cold*x+normal*y+hot*z;
      if sum > max then max:=sum;
    end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(max);
  close(output);
end;


begin
  Init;
  Analyse;
  Print;
end.
