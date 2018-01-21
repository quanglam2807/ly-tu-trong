const fileinp = 'pair.inp';
      fileout = 'pair.out';
      dx:array[1..4] of integer = (-1,1,0,0);
      dy:array[1..4] of integer = (0,0,-1,1);
      maxN = 1000;

type td = record
            x,y:longint;
          end;

var n,m:longint;
    a:array[1..maxN,1..maxN] of char;

function OK(x,y:longint):boolean;
begin
  if (x > n+2) or (x < 0) or (y > m+2) or (y < 0) then
    exit(false);
  if (x=0) or (y=0) or (x=n+1) or (y=m+1) then
    exit(true);
  if a[x,y] = '.' then
    exit(true)
  else exit(false);
end;

function MinLength(x1,y1,x2,y2:longint):longint;
var free:array[0..maxN+1,0..maxN+1] of boolean;
    q:array[1..maxN*maxN] of td;
    deg:array[0..maxN+1,0..maxN+1] of longint;
    rear,front,i:longint;
    cur:td;
begin
  fillchar(free,sizeof(free),true);
  rear:=1;
  front:=1;
  q[1].x:=x1;
  q[1].y:=y1;
  free[x1,y1]:=false;
  deg[x1,y1]:=0;
  repeat
    cur:=q[rear]; inc(rear);
    for i:=1 to 4 do
      if ((OK(cur.x+dx[i],cur.y+dy[i])) and (free[cur.x+dx[i],cur.y+dy[i]]))
      or ((cur.x+dx[i]=x2) and (cur.y+dy[i]=y2)) then
        begin
          if (cur.x+dx[i]=x2) and (cur.y+dy[i]=y2) then
            exit(deg[cur.x,cur.y]+1);
          inc(front);
          q[front].x:=cur.x+dx[i];
          q[front].y:=cur.y+dy[i];
          free[cur.x+dx[i],cur.y+dy[i]]:=false;
          deg[cur.x+dx[i],cur.y+dy[i]]:=deg[cur.x,cur.y] + 1;
        end;
  until rear > front;
  exit(0);
end;

procedure Main;
var i,j,x1,x2,y1,y2,tmp:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m);
  tmp:=n;
  n:=m;
  m:=tmp;
  for i:=1 to n do
    begin
      for j:=1 to m do read(a[i,j]);
      readln;
    end;
  repeat
    readln(x1,y1,x2,y2);
    if (x1=0) and (y1=0) and (x2=0) and (y2=0) then exit;
    writeln(MinLength(y1,x1,y2,x2));
  until false;
  close(input); close(output);
end;

begin
  Main;
end.