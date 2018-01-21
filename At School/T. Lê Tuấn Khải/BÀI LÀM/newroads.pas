const fileinp = 'newroads.inp';
      fileout = 'newroads.out';
      maxN = 250;

var n,m,count:longint;
    a:array[1..2*maxN] of longint;
    h:array[1..maxN+1] of longint;
    free:array[1..maxN] of boolean;

procedure Init;
var i,u,v:longint;
begin
  assign(input,fileinp);
  reset(input);
  readln(n,m);
  for i:=1 to m do
    begin
      readln(u,v);
      inc(h[u]);
    end;

  for u:=2 to n+1 do h[u]:=h[u] + h[u-1];

  reset(input);
  readln;
  for i:=1 to m do
    begin
      readln(u,v);
      a[h[u]]:=v;
      dec(h[u]);
    end;
end;

procedure DFS(u,t:longint);
var v:longint;
begin
  free[u]:=false;
  if not free[t] then exit;
  for v:=h[u]+1 to h[u+1] do
    if free[a[v]] then
      DFS(a[v],t);
end;

function Friendly(u,v:longint):longint;
var new,i:longint;
begin
  fillchar(free,sizeof(free),true);
  DFS(u,v);
  if free[v] then exit(0);
  fillchar(free,sizeof(free),true);
  DFS(v,u);
  if free[u] then exit(0);
  new:=2;
  for i:=h[u]+1 to h[u+1] do
    if a[i] = v then
      begin
        dec(new);
        break;
      end;
  for i:=h[v]+1 to h[v+1] do
    if a[i] = u then
      begin
        dec(new);
        break;
      end;
  exit(new);
end;

procedure Analyse;
var u,v:longint;
begin
  count:=0;
  for u:=1 to n-1 do
    for v:=u+1 to n do
      inc(count,Friendly(u,v));
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
