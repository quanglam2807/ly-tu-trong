const fileinp = 'sort25.inp';
      fileout = 'sort25.out';

var n,t:longint;
    a:array[1..1000] of longint;

procedure QSort(l,r:longint);
var i,j,pivot,tmp:longint;
begin
  if l>=r then exit;
  i:=l; j:=r;
  pivot:=a[(i+j) div 2];
  repeat
    begin
      while a[i]<pivot do inc(i);
      while a[j]>pivot do dec(j);
      if i<=j then
        begin
          tmp:=a[i];
          a[i]:=a[j];
          a[j]:=tmp;
          inc(i);
          dec(j);
       end;
    end;
  until i > j;
  QSort(l,j); QSort(i,r);
end;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n);
  for t:=1 to n do readln(a[t]);
  QSort(1,n);
  for t:=1 to n do writeln(a[t]);
  close(input); close(output);
end.
