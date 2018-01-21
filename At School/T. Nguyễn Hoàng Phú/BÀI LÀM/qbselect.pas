uses math;
const fileinp = 'qbselect.inp';
      fileout = 'qbselect.out';
      c:array[1..8] of integer = (0,1,2,4,8,5,9,10);
      maxN = 10000;

var n,res:longint;
    a:array[1..4,1..maxN] of longint;
    s,f:array[0..maxN,0..10] of longint;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to 4 do
    begin
      for j:=1 to n do
        read(a[i,j]);
      readln;
    end;
  close(input);
end;

function Sum(i,x:longint):longint;
var k:longint;
begin
  if s[i,x] <> 0 then exit(s[i,x]);
  Sum:=0;
  for k:=0 to 3 do
    if (x shr k) and 1 = 1 then
      Sum:=Sum + a[k+1,i];
  s[i,x]:=Sum;
end;

function AllMinus:boolean;
var i,j,max:longint;
begin
  max:=-maxlongint;
  for i:=1 to 4 do
    for j:=1 to n do
      begin
        if a[i,j] >= 0 then exit(false);
        if a[i,j] > max then max:=a[i,j];
      end;
  res:=max;
  exit(true);
end;

procedure Analyse;
var i,j,k:longint;
begin
  if AllMinus then exit;
  for i:=1 to n do
    for j:=1 to 8 do
      begin
        f[i,c[j]]:=0;
        s[i,c[j]]:=0;
      end;
  for i:=1 to n do
    for j:=1 to 8 do
      for k:=1 to 8 do
        if (c[j] and c[k]) = 0 then
          f[i,c[j]]:=math.max(f[i,c[j]],f[i-1,c[k]] + sum(i,c[j]));
  res:=-maxlongint;
  for i:=1 to n do
    for j:=1 to 8 do
      res:=math.max(res,f[i,c[j]]);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
