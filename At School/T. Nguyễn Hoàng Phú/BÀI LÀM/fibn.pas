const fileinp = 'fibn.inp';
      fileout = 'fibn.out';

var n:longint;
    a:array[1..90] of longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

procedure Analyse;
var i:longint;
begin
  a[1]:=1;
  a[2]:=1;
  for i:=3 to n do
    a[i]:=a[i-1] + a[i-2];
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(a[n]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.