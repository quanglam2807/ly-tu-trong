const finp='electric.inp';
      fout='electric.out';
      maxC=1000;
      maxN=1000;
      maxM=2000;
var c,b:array[1..maxN,1..maxN] of longint;
    trace:array [1..maxN] of integer;
    res,n,m:longint;
    free:array[1..maxN] of boolean;
    yes:array[1..maxM] of boolean;
    d:array[1..maxN] of longint;
procedure init;
var i,j,u,v:longint;
begin
  assign (input,finp);reset(input);
  readln(n,m);
  for i:=1 to n do
    for j:=1 to n do
      if i=j then c[i,j]:=0
      else c[i,j]:=-maxC;
  for i:=1 to m do
    begin
      readln(u,v,c[u,v]);
      //c[v,u]:=c[u,v];
      b[u,v]:=i;
      //b[v,u]:=i;
    end;
  close(input);
end;

procedure prim;
var u,v,max:longint;
begin
  for u:=1 to n do
    d[u]:=-maxC;
  d[1]:=0;
  fillchar (free,sizeof (free),true);
  repeat
    max:=-maxlongint;
    u:=0;
    for v:=1 to n do
      if (free[v]) and (d[v] > max) then
        begin
          max:=d[v];
          u:=v;
        end;
    if u=0 then exit;
    free[u]:=false;
    for v:=1 to n do
      if c[u,v]>d[v] then
        begin
          d[v]:=c[u,v];
          trace[v]:=u;
        end;
  until false;
end;

procedure Load;
var v:longint;
begin
  res:=0;
  for v:=2 to n do
    begin
      res:=res + c[trace[v],v];
      yes[b[trace[v],v]]:=true;
    end;
end;

procedure print;
var i:longint;
begin
  assign (output,fout);rewrite(output);
  writeln(res);
  for i:=1 to m do
    if yes[i] then
      writeln (i);
  close(output);
end;

begin
  init;
  prim;
  load;
  print;
end.
