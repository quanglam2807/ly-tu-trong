const fileinp = 'damage.inp';
      fileout = 'damage.out';
      maxP = 30000;
      maxC = 100000;


type edge = record
              u,v:longint;
            end;

var p,c,n,count:longint;
    a:array[1..maxC*2] of longint;
    b:array[1..maxP] of longint;
    h:array[1..maxP+1] of longint;
    free,nodamage:array[1..maxP] of boolean;

procedure Init;
var i,j,u,v:longint;
    e:array[1..maxC] of edge;
begin
  assign(input,fileinp); reset(input);
  readln(p,c,n);
  fillchar(h,sizeof(h),0);
  j:=0;
  for i:=1 to c do
    begin
      readln(u,v);
      if u = v then continue;
      inc(j);
      e[j].u:=u;
      e[j].v:=v;
      inc(h[u]);
      inc(h[v]);
    end;

  for i:=2 to p+1 do h[i]:=h[i]+h[i-1];

  for i:=1 to j do
    begin
      a[h[e[i].u]]:=e[i].v;
      a[h[e[i].v]]:=e[i].u;
      dec(h[e[i].u]);
      dec(h[e[i].v]);
    end;

  for i:=1 to n do read(b[i]);
  close(input);
end;

procedure DFS(u:longint);
var v:longint;
begin
  free[u]:=false;
  for v:=h[u]+1 to h[u+1] do
    if (free[a[v]]) and (nodamage[a[v]]) then
      DFS(a[v]);
end;

procedure Analyse;
var i,u,v:longint;
begin
  fillchar(free,sizeof(free),true);
  fillchar(nodamage,sizeof(nodamage),true);
  for i:=1 to n do
    begin
      u:=b[i];
      nodamage[u]:=false;
      for v:=h[u]+1 to h[u+1] do
        nodamage[a[v]]:=false;

    end;
  DFS(1);
  count:=0;
  for i:=1 to p do
    if (free[i]) then
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
