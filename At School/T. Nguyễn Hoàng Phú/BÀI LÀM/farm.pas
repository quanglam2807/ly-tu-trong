const fileinp = 'farm.inp';
      fileout = 'farm.out';
      maxN = 1000;
      dx:array[1..4] of integer = (-1,1,0,0);
      dy:array[1..4] of integer = (0,0,-1,1);

type td = record
            x,y:longint;
          end;

var sf,sc,m,n:longint;
    a:array[1..maxN,1..maxN] of char;
    block:array[1..maxN,1..maxN] of boolean;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(m,n);
  sf:=0;
  sc:=0;
  for i:=1 to m do
    begin
      for j:=1 to n do
        begin
          read(a[i,j]);
          if a[i,j] = 'f' then inc(sf);
          if a[i,j] = 'c' then inc(sc);
        end;
      readln;
    end;
  close(input);
end;

procedure BFS(i,j:longint);
var rear,front,cc,ff,u,v,k:longint;
    q:array[1..maxN*maxN] of td;
    cur:td;
begin
  rear:=1;
  front:=1;
  q[1].x:=i;
  q[1].y:=j;
  block[i,j]:=true;
  cc:=0;
  ff:=0;
  repeat
    cur:=q[rear]; inc(rear);
    if a[cur.x,cur.y] = 'f' then inc(ff);
    if a[cur.x,cur.y] = 'c' then inc(cc);
    for k:=1 to 4 do
      begin
        u:=cur.x + dx[k];
        v:=cur.y + dy[k];
        if (u > 0) and (v > 0) and (u <= m) and (v <= n)
        and (a[u,v] <> '#') and (not block[u,v]) then
          begin
            inc(front);
            q[front].x:=u;
            q[front].y:=v;
            block[u,v]:=true;
          end;
      end;
  until rear > front;
  if cc > ff then
    dec(sf,ff)
  else
    dec(sc,cc);
end;

procedure Analyse;
var i,j:longint;
begin
  for i:=1 to m do
    for j:=1 to n do
     if (not block[i,j]) and (a[i,j] <> '#') then
        BFS(i,j);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(sf,' ',sc);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.