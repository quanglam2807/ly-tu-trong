var a1, b1, a2, b2, c1, c2, d, dx, dy: longint;
begin
  writeln('Nhap he so:');
  write('a1 = '); readln(a1);
  write('b1 = '); readln(b1);
  write('c1 = '); readln(c1);
  write('a2 = '); readln(a2);
  write('b2 = '); readln(b2);
  write('c2 = '); readln(c2);
  d:=a1*b2-a2*b1;
  dx:=c1*b2-c2*b1;
  dy:=a1*c2-a2*c1;
  writeln('x = ',dx/d:0:2);
  writeln('y = ',dy/d:0:2);
  readln
end.