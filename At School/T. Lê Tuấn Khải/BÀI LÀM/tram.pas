const fileinp = 'tram.inp';
      fileout = 'tram.out';
      maxN = 200000;

var n,m,c,res:longint;
    h:array[1..maxN+1] of longint;
    a:array[1..(maxN+1)*2] of longint;
    f:array[1..maxN] of boolean;
    x,y:array[1..maxN] of longint;

procedure Init;
var i,u,v:longint;
begin
  assign(input,fileinp);
  reset(input);
  readln(n);
  for i:=1 to n-1 do
    begin
      readln(u,v);
      inc(h[u]);
      inc(h[v]);
    end;
  for i:=2 to n+1 do h[i]:=h[i] + h[i-1];
  readln(m);
  for i:=1 to m do
    readln(x[i],y[i]);
  reset(input);
  readln;
  for i:=1 to n-1 do
    begin
      readln(u,v);
      a[h[u]]:=v;
      a[h[v]]:=u;
      dec(h[u]);
      dec(h[v]);
    end;
  close(input);
end;

procedure Disable(u,v:longint);
var i:longint;
begin
  if (u=0) or (v=0) then exit;
  for i:=h[u]+1 to h[u+1] do
    if (a[i] = v) then
      begin
        if f[i] = false then exit;
        f[i]:=false;
        break;
      end;
  for i:=h[v]+1 to h[v+1] do
    if (a[i] = u) then
      begin
        if f[i] = false then exit;
        f[i]:=false;
        break;
      end;
  dec(c);
end;

procedure BFS(s,t:longint);
var free:array[1..maxN] of boolean;
    q,trace:array[1..maxN] of longint;
    rear,front,u,v,i:longint;
begin
  fillchar(free,sizeof(free),true);
  q[1]:=s;
  rear:=1;
  front:=1;
  free[s]:=false;
  trace[s]:=0;
  repeat
    u:=q[rear]; inc(rear);
    for i:=h[u]+1 to h[u+1] do
      begin
        v:=a[i];
        if free[v] then
          begin
            trace[v]:=u;
            if v = t then
              begin
                rear:=front+1;
                break;
              end;
            inc(front);
            free[v]:=false;
            q[front]:=v;
          end;
      end;
  until rear > front;
  u:=t;
  while u <> 0 do
    begin
      Disable(u,trace[u]);
      u:=trace[u];
    end;
end;

procedure Analyse;
var i:longint;
begin
  fillchar(f,sizeof(f),true);
  c:=n-1;
  for i:=1 to m do
    begin
      BFS(x[i],y[i]);
      if c = 0 then break;
    end;
  for i:=1 to n do
    if f[i] then
      begin
        res:=i;
        exit;
      end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(c);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
