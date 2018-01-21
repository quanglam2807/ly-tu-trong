const finp='water.inp';
      fout='water.out';

type heap1=record
            u,v:longint;
            end;

var a,pos,dau:array [1..1000,1..1000] of longint;
    q,q1:array [1..2,1..100000] of longint;
    dx:array [1..4] of longint=(0,0,-1,1);
    dy:array [1..4] of longint=(1,-1,0,0);
    heap:array [1..1000000] of heap1;
    m,n,nheap,r,dem:longint;
    res:Qword;

Procedure Enter;
var i,j:longint;
begin
  assign(input,finp); reset(input);
  readln(m,n);
  for i:=1 to m do
    for j:=1 to n do
      read(a[i][j]);
  close(input);
end;

procedure upheap(i:longint);
var j:longint;
    t:heap1;
begin
  j:=i div 2;
  if i=1 then exit;
  if a[heap[i].u][heap[i].v]>a[heap[j].u][heap[j].v] then exit;
  t:=heap[i]; heap[i]:=heap[j]; heap[j]:=t;
  pos[heap[i].u][heap[i].v]:=i;
  pos[heap[j].u][heap[j].v]:=j;
  upheap(j);
end;

procedure downheap(i:longint);
var j:longint;
    t:heap1;
begin
  j:=i*2;
  if j>nheap then exit;
  if j<nheap then
  if a[heap[j].u][heap[j].v]>a[heap[j+1].u][heap[j+1].v] then inc(j);
  if a[heap[j].u][heap[j].v]>a[heap[i].u][heap[i].v] then exit;
  t:=heap[i]; heap[i]:=heap[j]; heap[j]:=t;
  pos[heap[i].u][heap[i].v]:=i;
  pos[heap[j].u][heap[j].v]:=j;
  downheap(j);
end;

procedure push(x,y:longint);
begin
  inc(nheap); heap[nheap].u:=x; heap[nheap].v:=y;
  pos[x][y]:=nheap; upheap(nheap);
end;

procedure pop(i:longint);
begin
  pos[heap[i].u][heap[i].v]:=-1;
  heap[i]:=heap[nheap]; dec(nheap);
  downheap(i);
end;

procedure Bfs;
var i,j,x,y,x1,y1,t:longint;
begin
  i:=1; j:=r;
  repeat
    x:=q1[1][i]; y:=q1[2][i];
    for t:=1 to 4 do
      begin
        x1:=x+dx[t]; y1:=y+dy[t];
        if (x1<1) or (y1<1) then continue;
        if (x1>m) or (y1>n) then continue;
        if dau[x1][y1]=1 then continue;
        if a[x1][y1]>=a[x][y] then
          begin
            inc(j); dau[x1][y1]:=1; inc(dem);
            q1[1][j]:=x1; q1[2][j]:=y1;
          end
            else push(x,y);
      end;
    inc(i);
  until i>j;
end;

procedure Bfs1;
var i,j,x1,y1,x,y,t,muc:longint;
begin
  i:=1;
  j:=1;
  r:=0;
  muc:=a[heap[1].u][heap[1].v];
  q[1][1]:=heap[1].u;
  q[2][1]:=heap[1].v;
  pop(1);
    repeat
      x:=q[1][i]; y:=q[2][i];
        for t:=1 to 4 do
          begin
            x1:=x+dx[t]; y1:=y+dy[t];
            if (x1<1) or (y1<1) then continue;
            if (x1>m) or (y1>n) then continue;
            if dau[x1][y1]=1 then continue;
            if a[x1][y1]>muc then
              begin
                inc(r);inc(dem);
                dau[x1][y1]:=1;
                q1[1][r]:=x1; q1[2][r]:=y1;
              end
              else
                begin
                  inc(res,muc-a[x1][y1]);
                  a[x1][y1]:=muc;
                  dau[x1][y1]:=1; inc(dem);
                  inc(j);
                  q[1][j]:=x1; q[2][j]:=y1;
                end;
    end;
    inc(i);
  until i>j;
end;

procedure init;
var i:longint;
begin
  dem:=0;r:=0;
  for i:=1 to n do
    begin
      inc(r);
      dau[1][i]:=1;
      q1[1][r]:=1;
      q1[2][r]:=i;
      inc(r);
      dau[m][i]:=1;
      q1[1][r]:=m;
      q1[2][r]:=i;
      inc(dem,2);
      push(1,i);
      push(m,i);
    end;
  for i:=2 to m-1 do
    begin
      inc(r);
      dau[i][1]:=1;
      q1[1][r]:=i;
      q1[2][r]:=1;
      inc(r);
      dau[i][n]:=1;
      q1[1][r]:=i;
      q1[2][r]:=n;
      inc(dem,2);
      push(i,1);
      push(i,n);
    end;
end;

procedure Analyse;
begin
  if (n <= 2) or (m <= 2) then exit;
  res:=0;
  repeat
    Bfs;
    Bfs1;
  until dem=m*n;
end;

procedure Print;
begin
  assign(output,fout); rewrite(output);
  write(res);
  close(output);
end;

begin
  enter;
  init;
  analyse;
  print;
end.
