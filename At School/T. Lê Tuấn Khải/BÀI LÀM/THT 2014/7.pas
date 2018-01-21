uses crt;
var a,b,c,d,e,x,f:longint;
    tu,mau:longint;

function UCLN(a, b: longint): longint;
var r, tam: longint;
begin
  r:=b mod a;
  while r > 0 do
    begin
      r:=a mod b;
      a:=b;
      b:=r;
    end;
  UCLN:=a;
end;

begin
  clrscr;
  write ('Nhap he so a: ');readln(a);
  write ('Nhap he so b: ');readln(b);
  write ('Nhap he so c: ');readln(c);
  write ('Nhap he so d: ');readln(d);
  write ('Nhap he so e: ');readln(e);
  write ('Nhap gia tri cua x: ');readln(x);
  if (d*x+e)=0 then writeln('Ham so khong xac dinh')
  else
    begin
      tu:=a*sqr(x)+b*x+c;
      mau:=d*x+e;
      f:=ucln(tu,mau);
      tu:=tu div f;
      mau:=mau div f;
      writeln('Ham so co gia tri: ',tu,'/',mau);
    end;

  readln;
end.