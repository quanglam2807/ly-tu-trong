const fileinp = 'flow2509.inp';
      fileout = 'flow2509.out';
      maxN = 100;

var n,m,max:integer;
    c,f:array[1..maxN,1..maxN] of integer;
    trace:array[1..maxN] of integer;

procedure Init;
var i,u,v:integer;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  fillchar(c,sizeof(c),0);
  for i:=1 to m do
    readln(u,v,c[u,v]);
  close(input);
  fillchar(f,sizeof(f),0);
end;

function FindPath:boolean;
var rear,front,u,v:integer;
    q:array[1..maxN] of integer;
begin
  fillchar(trace,sizeof(trace),0);
  front:=1;
  rear:=1;
  q[1]:=1;
  trace[1]:=n+1;
  repeat
    u:=q[rear]; inc(rear);
    for v:=1 to n do
      if (trace[v] = 0) and (c[u,v] > f[u,v]) then
        begin
          trace[v]:=u;
          if v = n then
            exit(true);
          inc(front); q[front]:=v;
        end;
  until rear > front;
  exit(false);
end;

procedure IncFlow;
var delta,v,u:integer;
begin
  delta:=maxint;
  v:=n;
  repeat
    u:=trace[v];
    if c[u,v] - f[u,v] < delta then delta:=c[u,v] - f[u,v];
    v:=u;
  until v = 1;
  v:=n;
  repeat
    u:=trace[v];
    f[u,v]:=f[u,v] + delta;
    f[v,u]:=f[v,u] - delta;
    v:=u;
  until v = 1;
end;

procedure CalcMaxFlow;
var v:integer;
begin
  max:=0;
  for v:=1 to n do
    if f[1,v] > 0 then
      max:=max + f[1,v];
end;

procedure Main;
begin
  repeat
    if not FindPath then break;
    IncFlow;
  until false;
  CalcMaxFlow;
end;

procedure Print;
var u,v,count:integer;
begin
  assign(output,fileout); rewrite(output);
  writeln(max);
  count:=0;
  for u:=1 to n do
    for v:=1 to n do
      if f[u,v] > 0 then
          begin
            writeln(u,' ',v,' ',f[u,v]);
            inc(count);
            if count = m then exit;
          end;
  close(output);
end;

begin
  Init;
  Main;
  Print;
end.