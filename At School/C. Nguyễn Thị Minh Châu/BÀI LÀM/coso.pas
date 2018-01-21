const fileinp = 'coso.inp';
      fileout = 'coso.out';

procedure CS(a,n:longint);
var l,i:longint;
    q:array[1..100000] of char;
begin
  l:=0;
  while a <> 0 do
    begin
      inc(l);
      if a mod n < 10 then q[l]:=chr(48 + a mod n)
      else q[l]:=chr(a mod n + 55);
      a:=a div n;
    end;
  for i:=l downto 1 do
    write(q[i]);
  writeln;
end;

procedure Main;
var a,n:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  while not eof do
    begin
      readln(a,n);
      CS(a,n);
    end;
  close(input); close(output);
end;

begin
  Main;
end.