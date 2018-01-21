uses crt;
var count,i,n:longint;
begin
  clrscr;
  write('Nhap vao so nguyen duong: '); readln(n);
  count:=0;
  write('So uoc nguyen duong cua ',n,' la: ');
  for i:=1 to n do
    if (n mod i = 0) then
      begin
        inc(count);
        write(i,' ');
      end;
  writeln;
  writeln('So ',n,' co ',count,' uoc');
  readln;
end.