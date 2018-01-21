uses math;
const fileinp = 'board.inp';
      fileout = 'board.out';
      maxN = 1000;


var m,n,max:longint;
    a,f,trace:array[0..maxN+1,0..maxN+1] of longint;
    q:array[1..maxN] of longint;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(m,n);
  for i:=1 to m do
    begin
      for j:=1 to n do read(a[i,j]);
      readln;
    end;
  close(input);
end;

procedure Analyse;
var i,j,t:longint;
begin
  for i:=0 to m+1 do
    for j:=0 to n+1 do
      f[i,j]:=-maxlongint;
  for i:=1 to m do
    begin
      f[i,1]:=a[i,1];
      trace[i,1]:=0;
    end;
  for j:=2 to n do
    for i:=1 to m do
      begin
        f[i,j]:=math.max(f[i-1,j-1],math.max(f[i,j-1],f[i+1,j-1])) + a[i,j];
        if f[i,j] - a[i,j] = f[i-1,j-1] then
          trace[i,j]:=i-1;
        if f[i,j] - a[i,j] = f[i,j-1] then
          trace[i,j]:=i;
        if f[i,j] - a[i,j] = f[i+1,j-1] then
          trace[i,j]:=i+1;
      end;
  max:=1;
  for i:=2 to m do
    if f[i,n] > f[max,n] then
      max:=i;
  i:=max;
  j:=n;
  t:=0;
  while (i <> 0) do
    begin
      inc(t);
      q[t]:=i;
      i:=trace[i,j];
      dec(j);
    end;
end;

procedure Print;
var i,j:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(f[max,n]);
  j:=0;
  for i:=n downto 1 do
    begin
      inc(j);
      writeln(q[i],' ',j);
    end;
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
