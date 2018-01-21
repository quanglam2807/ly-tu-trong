const fileinp = 'knight.inp';
      fileout = 'knight.out';
      maxN = 100;
      dx:array[1..8] of longint = (-2,-2,-1,-1,1,1,2,2);
      dy:array[1..8] of longint = (-1,1,-2,2,-2,2,-1,1);

type td = record
            x,y:longint;
          end;

var m,n,k,p,q,r,s,res:longint;
    block:array[1..maxN,1..maxN] of boolean;

procedure Init;
var i,u,v:longint;
begin
  assign(input,fileinp); reset(input);
  readln(m,n,k);
  readln(p,q,r,s);
  for i:=1 to k do
    begin
      readln(u,v);
      block[u,v]:=true;
    end;
end;

procedure Analyse;
var rear,front,i,x,y:longint;
    queue:array[1..maxN*maxN] of td;
    b:array[1..maxN,1..maxN] of longint;
    cur:td;
begin
  res:=-1;
  rear:=1;
  front:=1;
  queue[1].x:=p;
  queue[1].y:=q;
  block[p,q]:=false;
  b[p,q]:=0;
  repeat
   cur:=queue[rear]; inc(rear);
   for i:=1 to 8 do
     begin
       x:=cur.x + dx[i];
       y:=cur.y + dy[i];
       if (x < 1) or (x > m)
       or (y < 1) or (y > n)
       or (block[x,y]) then
         continue;
       if (x = r) and (y = s) then
         begin
           res:=b[cur.x,cur.y] + 1;
           exit;
         end;
       inc(front);
       queue[front].x:=x;
       queue[front].y:=y;
       b[x,y]:=b[cur.x,cur.y] + 1;
       block[x,y]:=true;
     end;
  until rear > front;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.