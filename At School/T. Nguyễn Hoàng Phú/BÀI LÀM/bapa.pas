const fileinp = 'bapa.inp';
      fileout = 'bapa.out';
      maxN = 10000;

var n:longint;
    c:array[0..maxN] of qword;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

procedure Analyse;
var i,k:longint;
begin
  c[0]:=1;
  c[1]:=1;
  for i:=2 to n do
    for k:=0 to i-1 do
      c[i]:=c[i] + c[k]*c[i-k-1];
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(c[n]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.