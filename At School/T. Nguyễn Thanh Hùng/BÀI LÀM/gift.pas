const fileinp = 'gift.inp';
      fileout = 'gift.out';

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to 2*n do read(a[i]);
  close(input);
end;

procedure QuickSort(l,r:longint);
var i,j,tmp,x:longint;
begin
  i:=l; j:=r;
  x:=a[(l+r) div 2];
  repeat
    while a[i] < x do inc(i);
    while a[j] > x do dec(j);
    if i <= j then
      begin
        tmp:=a[i];
        a[i]:=a[j];
        a[j]:=tmp;
        inc(i); dec(j);
      end;
  until i > j;
  QuickSort(l,j);
  QuickSort(i,r);
end;

procedure Analyse;
begin
end;