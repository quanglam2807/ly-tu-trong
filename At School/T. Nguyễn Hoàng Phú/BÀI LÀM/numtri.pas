{
ID: nhutqua1
PROG: numtri
LANG: PASCAL
}

uses math;

const fileinp = 'numtri.in';
      fileout = 'numtri.out';

var r,max:longint;
    a,f:array[0..1000,0..1000] of longint;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(r);
  fillchar(f,sizeof(f),255);
  for i:=1 to r do
    begin
      for j:=1 to i do read(a[i,j]);
      readln;
    end;
  close(input);
end;

procedure Analyse;
var i,j:longint;
begin
  f[1,1]:=a[1,1];
  for i:=2 to r do
    for j:=1 to i do
      f[i,j]:=math.max(f[i-1,j],f[i-1,j-1]) + a[i,j];

  max:=0;
  for i:=1 to r do
    if f[r,i] > max then
      max:=f[r,i];
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(max);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.