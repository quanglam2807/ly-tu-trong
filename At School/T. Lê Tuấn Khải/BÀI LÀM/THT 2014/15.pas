var n,k,l,i:longint;
    a:array[1..10] of longint;
begin
  write('Nhap N: '); readln(n);
  write('Nhap k: '); readln(k);
  l:=0;
  while n <> 0 do
    begin
      inc(l);
      a[l]:=n mod 10;
      n:=n div 10;
    end;
  if a[k] < 5 then a[k]:=a[k]*2;
  write('Ket qua: ');
  for i:=1 to l do
    write(a[i]);
  readln;
end.