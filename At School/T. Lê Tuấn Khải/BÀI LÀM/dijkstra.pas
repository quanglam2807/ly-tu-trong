const fileinp = 'dijkstra.inp';
      fileout = 'dijkstra.out';
      maxC = 10000;
      maxN = 10000;

var n,m,s,t:longint;
    c:array[1..maxN,1..maxN] of longint;
    d,trace:array[1..maxN] of longint;
    free:array[1..maxN] of boolean;

procedure Init;
var u,v,i,tmp1,tmp2,tmp3:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m,s,t);
  for u:=1 to n do
    for v:=1 to n do
      c[u,v]:=maxC;
  for u:=1 to n do c[u,u]:=0;
  for i:=1 to m do
    begin
      readln(tmp1,tmp2,tmp3);
      c[tmp1,tmp2]:=tmp3;
    end;
  close(input);
end;


procedure Dijkstra;
var u,v,min:longint;
begin
  fillchar(free,sizeof(free),true);
  for u:=1 to n do d[u]:=maxC;
  d[s]:=0;
  repeat
    min:=maxC;
    u:=0;
    for v:=1 to n do
      if (free[v]) and (d[v] < min) then
        begin
          u:=v;
          min:=d[v];
        end;
    if (u=0) or (u=t) then break;
    free[u]:=false;
    for v:=1 to n do
      if (free[v]) and (d[v] > d[u] + c[u,v]) then
        begin
          d[v]:=d[u]+c[u,v];
          trace[v]:=u;
        end;
  until false;
end;



procedure WriteResult;
var u:longint;
begin
  assign(output,fileout); rewrite(output);
  u:=t;
  writeln(d[t]);
  while u <> s do
    begin
      write(u,' -> ');
      u:=trace[u];
    end;
  write(s);
  close(output);
end;

begin
  Init;
  Dijkstra;
  WriteResult;
end.