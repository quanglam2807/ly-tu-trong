const fileinp = 'qbbishop.inp';
      fileout = 'qbbishop.out';
      maxN = 200;

type td = record
            x,y:longint;
          end;

var n,m,p,q,s,t,kq:longint;
    free,avail:array[1..maxN,1..maxN] of boolean;
    d:array[1..maxN,1..maxN] of longint;
    found:boolean;

procedure Init;
var i,r,c:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m,p,q,s,t);
  fillchar(free,sizeof(free),true);
  fillchar(avail,sizeof(avail),false);
  for i:=1 to m do
    begin
      readln(r,c);
      avail[r,c]:=true;
    end;
  close(input);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  if not found then writeln(-1)
  else writeln(d[s,t]);
  close(output);
end;

procedure Analyse;
var queue:array[1..maxN*maxN] of td;
    rear,front,i,j:longint;
    cur:td;
begin
  found:=false;
  queue[1].x:=p;
  queue[1].y:=q;
  free[p,q]:=false;
  d[p,q]:=0;
  rear:=1;
  front:=1;
  repeat
    cur:=queue[rear]; inc(rear);
    i:=cur.x;
    j:=cur.y;
    while (i-1 > 0) and (j-1 > 0) and (i-1 <= n) and (j-1 <= n)  do
      begin
        dec(i);
        dec(j);
        if (avail[i,j]) then
          break;
        if (free[i,j]) then
          begin
            inc(front);
            free[i,j]:=false;
            d[i,j]:=d[cur.x,cur.y] + 1;
            queue[front].x:=i;
            queue[front].y:=j;
            if (i=s) and (j=t) then
              begin
                found:=true;
                exit;
              end;
          end;
      end;

    i:=cur.x;
    j:=cur.y;
    while (i-1 > 0) and (j+1 > 0) and (i-1 <= n) and (j+1 <=n) do
      begin
        dec(i);
        inc(j);
       if (avail[i,j]) then
          break;
        if (free[i,j]) then
          begin
            inc(front);
            free[i,j]:=false;
            d[i,j]:=d[cur.x,cur.y] + 1;
            queue[front].x:=i;
            queue[front].y:=j;
            if (i=s) and (j=t) then
              begin
                found:=true;
                exit;
              end;
          end;
      end;

    i:=cur.x;
    j:=cur.y;
    while (i+1 > 0) and (j+1 > 0) and (i+1 <= n) and (j+1 <= n) do
      begin
        inc(i);
        inc(j);
        if (avail[i,j]) then
          break;
        if (free[i,j]) then
          begin
            inc(front);
            free[i,j]:=false;
            d[i,j]:=d[cur.x,cur.y] + 1;
            queue[front].x:=i;
            queue[front].y:=j;
             if (i=s) and (j=t) then
              begin
                found:=true;
                exit;
              end;
          end;
      end;

    i:=cur.x;
    j:=cur.y;
    while (i+1 > 0) and (j-1 > 0) and (i+1 <= n) and (j-1 <= n) do
      begin
        inc(i);
        dec(j);
        if (avail[i,j]) then
          break;
        if (free[i,j]) then
          begin
            inc(front);
            free[i,j]:=false;
            d[i,j]:=d[cur.x,cur.y] + 1;
            queue[front].x:=i;
            queue[front].y:=j;
            if (i=s) and (j=t) then
              begin
                found:=true;
                exit;
              end;
          end;
      end;
  until rear > front;
end;

begin
  Init;
  Analyse;
  Print;
end.