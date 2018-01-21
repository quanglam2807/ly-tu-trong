const fileinp = 'qbmst.inp';
      fileout = 'qbmst.out';
      maxN = 10000;
      maxM = 15000;
      maxC = 10000*maxM;

var n,nheap,m,s,t,res:longint;
    a,wa:array[1..maxM*2] of longint;
    head,h,d,p,trace:array[1..maxN] of longint;
    free:array[1..maxN] of boolean;



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
      if (w < nheap) and (d[h[w]] > d[h[w+1]]) then inc(w);
      if d[h[w]] >= d[tmp] then break;
      h[u]:=h[w];
      p[h[u]]:=u;
      u:=w;
    end;
  h[u]:=tmp;
  p[tmp]:=u;
end;

procedure Init;
var u,v,w,i:longint;
    bx,by,bw:array[1..maxM] of longint;
begin
  assign(input,fileinp);
  reset(input);
  readln(n,m);
  s:=1;
  t:=n;
  for i:=1 to m do
    begin
      readln(u,v,w);
      inc(head[u]);
      inc(head[v]);
      bx[i]:=u;
      by[i]:=v;
      bw[i]:=w;
    end;
  for i:=2 to n+1 do
    head[i]:=head[i-1] + head[i];
  for i:=1 to m do
    begin
      u:=bx[i];
      v:=by[i];
      w:=bw[i];
      a[head[u]]:=v;
      a[head[v]]:=u;
      wa[head[u]]:=w;
      wa[head[v]]:=w;
      dec(head[u]);
      dec(head[v]);
    end;
  close(input);
end;

procedure Dijkstra;
var u,i,v:longint;
begin
  fillchar(free,sizeof(free),true);
  for u:=1 to n do d[u]:=maxC;
  d[1]:=0;
  h[1]:=1;
  nheap:=1;
  p[1]:=1;
  res:=0;
  repeat
    u:=h[1];
    h[1]:=h[nheap];
    dec(nheap);
    DownHeap(1);
    free[u]:=false;
    res:=res + d[u];
    for i:=head[u]+1 to head[u+1] do
      begin
        v:=a[i];
        if free[v] and (d[v] > wa[i]) then
          begin
            d[v]:=wa[i];
            if p[v] = 0 then
              begin
                inc(nheap);
                p[v]:=nheap;
                trace[v]:=u;
                h[nheap]:=v;
              end;
            UpHeap(p[v]);
          end;
      end;
  until nheap = 0;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  close(output);
end;

begin
  Init;
  Dijkstra;
  Print;
end.