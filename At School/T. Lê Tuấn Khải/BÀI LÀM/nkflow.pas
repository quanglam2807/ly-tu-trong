const fileinp = 'nkflow.inp';
      fileout = 'nkflow.out';
      maxN = 1000;

var n,m,s,t:longint;
    max:int64;
    c,f:array[1..maxN,1..maxN] of longint;
    trace:array[1..maxN] of longint;

procedure Init;
var i,u,v:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m,s,t);
  fillchar(c,sizeof(c),0);
  for i:=1 to m do
    readln(u,v,c[u,v]);
  close(input);
  fillchar(f,sizeof(f),0);
end;

function FindPath:boolean;
var rear,front,u,v:longint;
    q:array[1..maxN] of longint;
begin
  fillchar(trace,sizeof(trace),0);
  front:=1;
  rear:=1;
  q[1]:=s;
  trace[s]:=n+1;
  repeat
    u:=q[rear]; inc(rear);
    for v:=1 to n do
      if (trace[v] = 0) and (c[u,v] > f[u,v]) then
        begin
          trace[v]:=u;
          if v = t then
            exit(true);
          inc(front); q[front]:=v;
        end;
  until rear > front;
  exit(false);
end;

procedure IncFlow;
var delta,v,u:longint;
begin
  delta:=maxlongint;
  v:=t;
  repeat
    u:=trace[v];
    if c[u,v] - f[u,v] < delta then delta:=c[u,v] - f[u,v];
    v:=u;
  until v = s;
  v:=t;
  repeat
    u:=trace[v];
    f[u,v]:=f[u,v] + delta;
    f[v,u]:=f[v,u] - delta;
    v:=u;
  until v = s;
end;

procedure CalcMaxFlow;
var v:longint;
begin
  max:=0;
  for v:=1 to n do
    if f[s,v] > 0 then
      max:=max + f[s,v];
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
var u,v:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(max);
  close(output);
end;

begin
  Init;
  Main;
  Print;
end.