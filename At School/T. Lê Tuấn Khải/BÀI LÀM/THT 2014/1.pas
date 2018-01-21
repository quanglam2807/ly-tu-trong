var n, i, tong, tich: longint;
    a: array[1..1000] of longint;
begin
  write('Nhap n = '); readln(n);
  for i:=1 to n do
    begin
      write('a',i,' = '); readln(a[i]);
    end;
  tong:=0;
  for i:=1 to n do
    tong:=tong+a[i];
  writeln('Trung binh cong A = ',tong/n:0:2);
  tich:=1;
  for i:=1 to n do
    tich:=tich*a[i];
  writeln('Trung binh nhan B = ',exp(ln(tich)/n):0:2);
  readln
end.