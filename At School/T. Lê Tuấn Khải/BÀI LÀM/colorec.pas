const fileinp = 'colorec.inp';
      fileout = 'colorec.out';
      maxN = 100000;

var n,count:longint;
    x,y,c:array[1..maxN] of longint;
    q:array[1..4] of longint;
    free:array[1..maxN] of boolean;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    readln(x[i],y[i],c[i]);
  close(input);
end;

procedure Check;
var co:array[1..4] of boolean;
    i,j:longint;
begin
  if x[q[1]] <> x[q[2]] then exit;
  if x[q[3]] <> x[q[4]] then exit;
  if y[q[1]] <> y[q[3]] then exit;
  if y[q[2]] <> y[q[4]] then exit;
  fillchar(co,sizeof(co),true);
  for i:=1 to 4 do
    begin
      if co[c[q[i]]] = false then exit;
      co[c[q[i]]]:=false;
    end;
  inc(count);
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > 4 then
    begin
      Check;
      exit;
    end;
  for j:=1 to n do
    if free[j] then
      begin
        q[i]:=j;
        free[j]:=false;
        Generate(i+1);
        free[j]:=true;
      end;
end;

procedure Analyse;
begin
  count:=0;
  fillchar(free,sizeof(free),true);
  Generate(1);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(count div 4);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.