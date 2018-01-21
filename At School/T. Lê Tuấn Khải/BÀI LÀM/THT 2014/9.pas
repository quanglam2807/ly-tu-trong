uses crt;
var i:longint;
    s:string;
begin
  clrscr;
  write('Nhap chuoi: '); readln(s);
  for i:=1 to length(s) do
    begin
      if s[i] = 'A' then s[i]:='Z'
      else if s[i] = 'z' then s[i]:='a'
      else if (s[i] >= 'a') and (s[i] < 'z') then
        s[i]:=chr(ord(s[i]) + 1)
      else if (s[i] > 'A') and (s[i] <= 'Z') then
        s[i]:=chr(ord(s[i]) - 1)
      else if s[i] = ' ' then
        s[i]:='*';
    end;
  writeln('Chuoi sau khi ma hoa: ',s);
  readln;
end.