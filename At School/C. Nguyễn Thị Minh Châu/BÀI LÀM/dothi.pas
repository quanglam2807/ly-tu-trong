const fileinp = 'dothi.in';
      fileout = 'dothi.out';
      maxN = 40000;

var n,m:longint;
    a:array[1..maxN*2] of longint;
    h:array[1..maxN] of longint;


procedure AddEdge(i,j:longint);
var rear,front,u,v,w:longint;
    free:array[1..maxN] of boolean;
    q:array[1..maxN] of longint;
begin

  if (h[i] = 2) or (h[j] = 2) then
    begin
      writeln(0);
      exit;
    end;


  rear:=1;
  front:=1;
  q[1]:=i;
  fillchar(free,sizeof(free),true);
  free[i]:=false;
  repeat
    u:=q[rear]; inc(rear);
    for w:=1 to h[u] do
      begin
        v:=a[2*u-2+w];
        if (free[v]) then
          begin
            if v = j then
              begin
                writeln(0);
                exit;
              end;
            free[v]:=false;
            inc(front);
            q[front]:=v;
          end;
      end;
  until rear > front;

  writeln(1);
  inc(h[i]);
  inc(h[j]);
  a[2*i-2+h[i]]:=j;
  a[2*j-2+h[j]]:=i;

end;

procedure DelEdge(i,j:longint);
begin
  if (a[i*2-1] = j) or (a[i*2] = j) then
    begin
      dec(h[i]);
      dec(h[j]);
      if a[i*2-1] = j then a[i*2-1]:=a[i*2];
      if a[j*2-1] = i then a[j*2-1]:=a[j*2];
      writeln(1);
    end
  else writeln(0);
end;

procedure FindPoint(i,d:longint);
var rear,front,u,v,w,cn:longint;
    free:array[1..maxN] of boolean;
    q,base:array[1..maxN] of longint;
    kq:array[1..2] of longint;
begin
  if d = 0 then
    begin
      writeln('1 ',i);
      exit;
    end;

  rear:=1;
  front:=1;
  fillchar(free,sizeof(free),true);
  free[i]:=false;
  q[1]:=i;
  base[1]:=0;
  cn:=0;
  repeat
    u:=q[rear]; inc(rear);
    for w:=1 to h[u] do
      begin
        v:=a[2*u-2+w];
        if free[v] then
          begin
            if base[rear-1]+1 = d then
              begin
                inc(cn);
                kq[cn]:=v;
                continue;
              end;
            free[v]:=false;
            inc(front);
            q[front]:=v;
            base[front]:=base[rear-1]+1;
          end;
      end;
  until rear > front;
  write(cn);
  if (cn = 2) and (kq[1] > kq[2]) then
    begin
      w:=kq[1];
      kq[1]:=kq[2];
      kq[2]:=w;
    end;
  for i:=1 to cn do
    write(' ',kq[i]);
  writeln;
end;

procedure FindStart(i:longint);
var c,rear,front,sl,w,u,v:longint;
    q:array[1..maxN] of longint;
    free:array[1..maxN] of boolean;
    kq:array[1..2] of longint;
begin
  c:=0;
  rear:=1;
  front:=1;
  q[1]:=i;
  fillchar(free,sizeof(free),true);
  free[i]:=false;
  repeat
    u:=q[rear]; inc(rear);
    sl:=0;
    for w:=1 to h[u] do
      begin
        v:=a[2*u-2+w];
        if free[v] then
          begin
            free[v]:=false;
            inc(front);
            q[front]:=v;
            inc(sl);
          end;
      end;
    if (sl=1) and (u=i) then
      begin
        inc(c);
        kq[c]:=u;
      end;
    if sl = 0 then
      begin
        inc(c);
        kq[c]:=u;
      end;
  until rear > front;
  write(c);
  if (c = 2) and (kq[1] > kq[2]) then
    begin
      sl:=kq[1];
      kq[1]:=kq[2];
      kq[2]:=sl;
    end;
  for i:=1 to c do
    write(' ',kq[i]);
  writeln;
end;

procedure Main;
var x,t,i,j,d:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m);
  fillchar(a,sizeof(a),0);
  fillchar(h,sizeof(h),0);
  for x:=1 to m do
    begin
      read(t);
      if t = 1 then
        begin
          read(i,j);
          AddEdge(i,j);
        end;
      if t = 2 then
        begin
          read(i,j);
          DelEdge(i,j);
        end;
      if t = 3 then
        begin
          read(i,d);
          FindPoint(i,d);
        end;
      if t = 4 then
        begin
          read(i);
          FindStart(i);
        end;
      readln;
    end;
  close(input); close(output);
end;

begin
  Main;
end.
