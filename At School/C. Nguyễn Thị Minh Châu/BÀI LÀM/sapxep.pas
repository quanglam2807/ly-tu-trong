const fileinp = 'sapxep.inp';
      fileout = 'sapxep.out';
      maxN = 10000;

var n:longint;
    a:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  close(input);
end;

procedure Analyse;
var i,j,tmp:longint;
begin
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if a[i] > a[j] then
        begin
          tmp:=a[i];
          a[i]:=a[j];
          a[j]:=tmp;
        end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to n do write(a[i],' ');
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
