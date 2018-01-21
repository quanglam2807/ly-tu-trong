var a,b,sum:real;
    c:char;
begin
  write('Nhap vao so thuc 1: '); readln(a);
  write('Nhap vao so thuc 2: '); readln(b);
  write('Thuc hien phep tinh: '); readln(c);
  if c = '+' then sum:=a + b;
  if c = '-' then sum:=a - b;
  if c = '/' then sum:=a / b;
  if c = '*' then sum:=a * b;
  writeln(a:0:1,' ',c,' ',b:0:1,' = ',sum:0:1);
  readln;
end.