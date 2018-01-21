uses crt;
const maxN = 1000;
var i,j,m,n,c:longint;
    pname,price,pstock:array[1..maxN,1..maxN] of longint;
begin
  clrscr;
  write('Nhap M (so cua hang): '); readln(m);
  for i:=1 to m do
    begin
      writeln('CUA HANG ',i);
      write('Nhap so luong mat hang: '); readln(c);
      for j:=1 to c do
        begin
          writeln('  MAT HANG THU ',j);
          write  ('  Nhap ten san pham     : '); readln(pname[i,j]);
          write  ('  Nhap gia san pham     : '); readln(price[i,j]);
          write  ('  Nhap so luong san pham: '); readln(pstock[i,j]);
        end;
    end;
end.