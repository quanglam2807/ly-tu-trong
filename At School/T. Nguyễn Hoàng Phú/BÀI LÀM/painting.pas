const fileinp = 'painting.inp';
      fileout = 'painting.out';
      maxN = 50000;

type fence = record
               x1,y1,x2,y2:longint;
             end;

var n,count:longint;
    a:array[1..maxN] of fence;
    free:array[1..maxN] of boolean;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    readln(a[i].x1,a[i].y1,a[i].x2,a[i].y2);
  close(output);
end;

procedure Check(i,j:longint);
begin
  if (a[i].x1 >= a[j].x1) and (a[i].x2 <= a[j].x2)
  and (a[i].y1 >= a[j].y1) and (a[i].y2 <= a[j].y2) then
    free[i]:=false;
end;

procedure Analyse;
var i,j:longint;
begin
  fillchar(free,sizeof(free),true);
  for i:=1 to n do
    if free[i] then
      for j:=1 to n do
        if (i <> j) and (free[j]) then Check(i,j);
  count:=0;
  for i:=1 to n do
    if free[i] then
      inc(count);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
