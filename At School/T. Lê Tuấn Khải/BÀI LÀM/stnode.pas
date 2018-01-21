const fileinp = 'stnode.inp';
      fileout = 'stnode.out';
      maxN = 10000;
      maxM = 100000;

type edge = record
             u,v:longint;
            end;

var n,m,s,t,count:longint;
    e:array[1..maxN] of edge;
    a,h:array[1..maxM] of longint;
    q:array[1..maxN] of longint;
    free,skip:array[1..maxN] of boolean;

procedure Init;
var i,u,v:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m,s,t);

  for i:=1 to m do
    begin
      readln(e[i].u,e[i].v);
      inc(h[e[i].u]);
    end;

  for i:=2 to n do h[i]:=h[i-1]+h[i];

  for i:=1 to m do
    begin
      a[h[e[i].u]]:=e[i].v;
      dec(h[e[i].u]);
    end;
  h[n+1]:=m;

  close(input);
end;

function DFS(i:longint):boolean;
var j:longint;
begin
  free[i]:=false;
  for j:=h[i]+1 to h[i+1] do
    if free[a[j]] then
      begin
        if free[t] = false then exit;
        q[i]:=a[j];
        DFS(a[j]);
      end;
  exit(false);
end;

function OK(k:longint):boolean;
var rear,front,u,v,i:longint;
begin
  fillchar(free,sizeof(free),true);
  free[s]:=false;
  free[k]:=false;
  exit(not free[t]);
end;


procedure Analyse;
var i,j:longint;
begin
  count:=0;
  for i:=1 to n do
    if (i<>s) and (i<>t) and (not OK(i)) then
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
