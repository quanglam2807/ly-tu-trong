{
ID: nhutqua1
PROG: frac1
LANG: PASCAL
}
const fileinp='frac1.in';
      fileout='frac1.out';
      maxN=160;

var n:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

procedure GetFrac(n1,d1,n2,d2:longint);
begin
  if d1 + d2 > n then exit;
  GetFrac(n1,d1,n1+n2,d1+d2);
  writeln(n1+n2,'/',d1+d2);
  GetFrac(n1+n2,d1+d2,n2,d2);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln('0/1');
  GetFrac(0,1,1,1);
  writeln('1/1');
  close(output);
end;

begin
  Init;
  Print;
end.