const fileinp = 'combo.inp';
      fileout = 'combo.out';
      maxN = 100;

var n,count:longint;
    a,b:array[1..3] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to 3 do read(a[i]);
  readln;
  for i:=1 to 3 do read(b[i]);
  close(input);
end;

function Check(t,j,k:longint):boolean;
var i,t1,t2,t3,t4:longint;
    x:array[1..3] of longint;
begin
  x[1]:=t;
  x[2]:=j;
  x[3]:=k;
  for i:=1 to 3 do
    begin
      t1:=abs(a[i] - x[i]);
      t2:=abs(b[i] - x[i]);
      if x[i] <= a[i] then t3:=x[i]+n-a[i] else t3:=a[i]+n-x[i];
      if x[i] <= b[i] then t4:=x[i]+n-b[i] else t4:=b[i]+n-x[i];
      if ((t1 > 2) and (t3 > 2)) then
        exit(false);
      if ((t2 > 2) and (t4 > 2)) then
        exit(false);
    end;
  exit(true);
end;

procedure Analyse;
var i,j,k:longint;
begin
  for i:=1 to n do
    for j:=1 to n do
      for k:=1 to n do
        begin
          if Check(i,j,k) then inc(count);
        end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  if n <= 5 then writeln(n*n*n)
  else writeln(250-count);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.