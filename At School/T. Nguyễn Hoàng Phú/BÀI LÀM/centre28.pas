const fileinp = 'centre28.inp';
      fileout = 'centre28.out';
      maxM = 100000;
      maxN = 30000;
      maxC = 1000*maxM;

var n,nheap,m,res,min:longint;
    head,h,d,p,trace,b:array[1..maxN+1] of longint;
    a,wa:array[1..maxM*2] of longint;
    free,Ok:array[1..maxN] of boolean;

procedure Init;
var u,v,w:array[1..maxM] of longint;
    i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  for i:=1 to m do
    begin
      readln(u[i],v[i],w[i]);
      inc(head[u[i]]);
      inc(head[v[i]]);
    end;
  for i:=2 to n+1 do head[i]:=head[i-1] + head[i];
  for i:=1 to m do
    begin
      a[head[u[i]]]:=v[i];
      a[head[v[i]]]:=u[i];
      wa[head[u[i]]]:=w[i];
      wa[head[v[i]]]:=w[i];
      dec(head[u[i]]);
      dec(head[v[i]]);
    end;
  close(input);
end;

procedure UpHeap(u:longint);
var tmp,w:longint;
begin
  tmp:=h[u];
  while u >= 2 do
    begin
      w:=u div 2;
      if d[h[w]] <= d[tmp] then break;
      h[u]:=h[w];
      p[h[u]]:=u;
      u:=w;
    end;
  h[u]:=tmp;
  p[tmp]:=u;
end;

procedure DownHeap(u:longint);
var tmp,w:longint;
begin
  tmp:=h[u];
  while u*2 <= nheap do
    begin
      w:=u*2;
      if (w < nheap) and (d[h[w+1]] < d[h[w]]) then inc(w);
      if d[h[w]] >= d[tmp] then break;
      h[u]:=h[w];
      p[h[u]]:=u;
      u:=w;
    end;
  h[u]:=tmp;
  p[tmp]:=u;
end;

procedure Dijkstra;
var i,u,v:longint;
begin
  for i:=1 to n do
    begin
      d[i]:=maxC;
      p[i]:=0;
    end;
  d[1]:=0;
  nheap:=1;
  p[1]:=1;
  h[1]:=1;
  trace[1]:=0;
  repeat
    u:=h[1];
    h[1]:=h[nheap];
    dec(nheap);
    DownHeap(1);
    if u = n then break;
    free[u]:=false;
    for i:=head[u]+1 to head[u+1] do
      begin
        v:=a[i];
        if (free[v]) and (d[v] > d[u] + wa[i]) then
          begin
            d[v]:=d[u] + wa[i];
            trace[v]:=u;
            if p[v] = 0 then
              begin
                inc(nheap);
                p[v]:=nheap;
                h[nheap]:=v;
              end;
            UpHeap(p[v]);
          end;
      end;
  until nheap = 0;
end;

procedure Analyse;
var i:longint;
begin
  min:=maxlongint;
  for i:=2 to n-1 do
    begin
      fillchar(free,sizeof(free),true);
      free[i]:=false;
      Dijkstra;
      b[i]:=d[n];
      if b[i] = min then
        inc(res);
      if b[i] < min then
        begin
          min:=b[i];
          res:=1;
        end;
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  for i:=1 to n do
    if b[i] = min then
      writeln(i);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
