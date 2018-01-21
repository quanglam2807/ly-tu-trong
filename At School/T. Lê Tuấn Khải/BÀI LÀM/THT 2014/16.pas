
var s1,s2:string;
    n,m,i:longint;
    a,b:array[1..50] of string;

function OK:boolean;
var found:boolean;
    free:array[1..50] of boolean;
    i,j:longint;
begin
  fillchar(free,sizeof(free),true);
  for i:=1 to n do
    begin
      found:=false;
      for j:=1 to m do
        if (free[j]) and (a[i] = b[j]) then
          begin
            free[j]:=false;
            found:=true;
          end;
      if not found then exit(false);
    end;
  exit(true);
end;


begin
  write('Nhap chuoi 1: '); readln(s1);
  write('Nhap chuoi 2: '); readln(s2);

  n:=1;
  i:=1;
  while i <= length(s1) do
    begin
      if s1[i] = ' ' then
        begin
          inc(n);
          while s1[i] = ' ' do
            inc(i);
        end
      else
        begin
          a[n]:=a[n] + s1[i];
          inc(i);
        end;
    end;

  m:=1;
  i:=1;
  while i <= length(s2) do
    begin
      if s2[i] = ' ' then
        begin
          inc(m);
          while s2[i] = ' ' do
            inc(i);
        end
      else
        begin
          b[m]:=b[m] + s2[i];
          inc(i);
        end;
    end;

  if OK then writeln('hai chuoi ANAGRAM')
  else writeln('khong.');
  readln;
end.
