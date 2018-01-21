var a, b, c, d, tu, mau: longint;
    ch: char;
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
  write('Nhap tu so thu nhat a = '); readln(a);
  write('Nhap tu so thu nhat b = '); readln(b);
  write('Nhap tu so thu nhat c = '); readln(c);
  write('Nhap tu so thu nhat d = '); readln(d);
  write('Nhap phep toan: '); readln(ch);
  case ch of
    '+': begin
           tu:=a*d+c*b;
           mau:=b*d;
         end;
    '-': begin
           tu:=a*d-c*b;
           mau:=b*d;
         end;
    '/': begin
           tu:=a*d;
           mau:=b*c;
         end;
    '*': begin
           tu:=a*c;
           mau:=b*d;
         end;
  end;
  if (tu > 0) and (mau > 0) then
    begin
      writeln('Tu so = ',tu div UCLN(tu, mau));
      writeln('Mau so = ',mau div UCLN(tu, mau));
    end;
  if tu = 0 then
    begin
      writeln('Tu so = ',tu);
      writeln('Mau so = ',mau);
    end;
  readln
end.