uses math;
const fileinp = 'bonus.inp';
      fileout = 'bonus.out';
      maxN = 1000;

var n,k,max:longint;
    a:array[1..maxN,1..maxN] of longint;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,k);
  for i:=1 to n do
    begin
      for j:=1 to n do read(a[i,j]);
      readln;
    end;
  close(input);
end;

function Val(i,j:longint):longint;
var u,v:longint;
begin
  Val:=0;
  for u:=i to i+k-1 do
    for v:=j to j+k-1 do
      Val:=Val + a[u,v];
end;

procedure Analyse;
var i,j:longint;
begin
  max:=0;
  for i:=1 to n do
    for j:=1 to n do
      begin
        if (i+k-1 > n) or (j+k-1 > n) then continue;
        max:=math.max(Val(i,j),max);
      end;
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