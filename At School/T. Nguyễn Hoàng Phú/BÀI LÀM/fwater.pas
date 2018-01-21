const fileinp = 'fwater.inp';
      fileout = 'fwater.out';
      maxP = 30000000;
      maxN = 300;

var n,res:longint;
    d,w,trace:array[1..maxN+1] of longint;
    p:array[1..maxN+1,1..maxN+1] of longint;
    free:array[1..maxN+1] of boolean;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    begin
      readln(w[i]);
      d[i]:=maxP;
      p[n+1,i]:=w[i];
      p[i,n+1]:=w[i];
    end;
  d[n+1]:=maxP;
  for i:=1 to n do
    begin
      for j:=1 to n do read(p[i,j]);
      readln;
    end;
  close(input);
end;

procedure Prim;
var u,v,min:longint;
begin
  fillchar(free,sizeof(free),true);
  d[1]:=0;
  repeat
    u:=0;
    min:=maxP;
    for v:=1 to n+1 do
      if free[v] and (d[v] < min) then
        begin
          min:=d[v];
          u:=v;
        end;
    if u = 0 then exit;
    free[u]:=false;
    for v:=1 to n+1 do
      if free[v] and (d[v] > p[u,v]) then
        begin
          d[v]:=p[u,v];
          trace[v]:=u;
        end;
  until false;
end;

procedure Analyse;
var u:longint;
begin
  Prim;
  res:=0;
  for u:=2 to n+1 do
    res:=res + p[u,trace[u]];
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