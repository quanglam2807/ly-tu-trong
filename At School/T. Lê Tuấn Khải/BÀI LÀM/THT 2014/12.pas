uses crt;
var a:longint;
dc,s,bkngt,bknt:real;
begin
  clrscr;
  write ('Nhap canh a=');readln(a);
  dc:=sqrt(sqr(a)-sqr(a/2));
  bkngt:=2*dc/3;
  bknt:=1*dc/3;
  s:=(sqr(bkngt)-sqr(bknt))*3.14;
  writeln('Dien tich =',s:0:0);
  readln;
end.