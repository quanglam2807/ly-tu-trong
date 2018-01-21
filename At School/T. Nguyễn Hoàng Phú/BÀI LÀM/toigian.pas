const fileinp = 'toigian.inp';
      fileout = 'toigian.out';

var a,b:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(a,b);
  close(input);
end;

function UCLN(a,b:longint):longint;
begin
  if a < b then exit(UCLN(b,a));
  if b = 0 then exit(a);
  exit(UCLN(b,a mod b));
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(a div UCLN(a,b),' ',b div UCLN(a,b));
  close(output);
end;

begin
  Init;
  Print;
end.
