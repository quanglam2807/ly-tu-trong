{
ID: nhutqua1
PROG: maze1
LANG: PASCAL
}

uses math;

const fileinp = 'maze1.in';
      fileout = 'maze1.out';
      dx:array[1..4] of longint = (-1,1,0,0);
      dy:array[1..4] of longint = (0,0,-1,1);
      maxW = 38;
      maxH = 100;

type edge = record
             x,y:longint;
            end;

var w,h:longint;
    a:array[1..2*maxH+1,1..maxW*2+1] of char;
    d:array[1..2*maxH+1,1..maxW*2+1] of longint;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(w,h);
  for i:=1 to 2*h+1 do
   begin
     j:=1;
     while j <= 2*w+1 do
       begin
         if not eoln then read(a[i,j])
         else a[i,j]:=' ';
         inc(j);
       end;
     readln;
   end;
  close(input);
end;

procedure BFS1(i,j:longint);
var free:array[1..2*maxH+1,1..maxW*2+1] of boolean;
    rear,front,k,x,y:longint;
    q:array[1..(2*maxH+1)*(maxW*2+1)] of edge;
    cur:edge;
begin
  fillchar(free,sizeof(free),true);
  rear:=1;
  front:=1;
  q[1].x:=i;
  q[1].y:=j;
  free[i,j]:=false;
  d[i,j]:=1;
  repeat
    cur:=q[rear]; inc(rear);
    for k:=1 to 4 do
      begin
         x:=cur.x + dx[k];
         y:=cur.y + dy[k];
         if (x < 1) or (x > 2*h+1) or (y < 1) or (y > 2*w+1) then
           continue;
         if free[x,y] and (a[x,y] = ' ') then
           begin
             d[x,y]:=d[cur.x,cur.y] + 1;
             free[x,y]:=false;
             inc(front);
             q[front].x:=x;
             q[front].y:=y;
           end;
      end;
  until rear > front;
end;

procedure BFS2(i,j:longint);
var free:array[1..2*maxH+1,1..maxW*2+1] of boolean;
    rear,front,max,k,x,y:longint;
    q:array[1..(2*maxH+1)*(maxW*2+1)] of edge;
    cur:edge;
begin
  fillchar(free,sizeof(free),true);
  rear:=1;
  front:=1;
  q[1].x:=i;
  q[1].y:=j;
  free[i,j]:=false;
  d[i,j]:=1;
  max:=-maxlongint;
  repeat
    cur:=q[rear]; inc(rear);
    for k:=1 to 4 do
      begin
         x:=cur.x + dx[k];
         y:=cur.y + dy[k];
         if (x < 1) or (x > 2*h+1) or (y < 1) or (y > 2*w+1) then
           continue;
         if free[x,y] and (a[x,y] = ' ') then
           begin
             if d[x,y] > d[cur.x,cur.y] + 1 then d[x,y]:=d[cur.x,cur.y] + 1;
             free[x,y]:=false;
             inc(front);
             q[front].x:=x;
             q[front].y:=y;
           end;
      end;
  until rear > front;
end;

procedure Analyse;
var c,i,j:longint;
    s:array[1..2] of edge;
begin
  c:=0;
  for i:=1 to 2*h+1 do
    begin
      if c = 2 then break;
      if a[i,1] = ' ' then
        begin
          inc(c);
          s[c].x:=i;
          s[c].y:=1;
        end;
      if a[i,2*w+1] = ' ' then
        begin
          inc(c);
          s[c].x:=i;
          s[c].y:=2*w+1;
        end;
    end;

  for i:=1 to 2*w+1 do
    begin
      if c = 2 then break;
      if a[1,i] = ' ' then
        begin
          inc(c);
          s[c].x:=1;
          s[c].y:=i;
        end;
      if a[2*h+1,i] = ' ' then
        begin
          inc(c);
          s[c].x:=2*h+1;
          s[c].y:=i;
        end;
    end;
  BFS1(s[1].x,s[1].y);
  BFS2(s[2].x,s[2].y);
end;

procedure Print;
var res,i,j:longint;
begin
  assign(output,fileout); rewrite(output);
  res:=-maxlongint;
  for i:=1 to 2*h+1 do
    for j:=1 to 2*w+1 do
      if (a[i,j] = ' ') and (d[i,j] > res) then
        res:=d[i,j];
  writeln(res div 2);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
