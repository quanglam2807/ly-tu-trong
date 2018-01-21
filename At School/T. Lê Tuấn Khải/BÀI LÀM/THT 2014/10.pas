uses crt;
var m:longint;
    delta:real;
begin
  clrscr;
  write  ('Nhap m = ');readln(m);
  if m=-2 then writeln(-(5*(m-2))/(-2*(m+8)):0:3) else
  begin
    delta :=sqr(-2*(m+8))-4*(m+2)*5*(m-2);
    if delta<0 then writeln ('Phuong trinh vo nghiem');
    if delta=0 then writeln ('Phuong trinh co nghiem kep x1=x2=',(2*(m+8))/(2*(m+2)):0:3);
    if delta>0 then writeln ('x1=',(2*(m+8)-sqrt(delta))/(2*(m+2)):0:3,'   x2=',(2*(m+8)+sqrt(delta))/(2*(m+2)):0:3);
  end;
  readln;
end.