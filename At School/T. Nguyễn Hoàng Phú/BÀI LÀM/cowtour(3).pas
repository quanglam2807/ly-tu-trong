const fileinp = 'cowtour.in';
      fileout = 'cowtour.out';
      maxN = 150;
      maxC = 100000;

type td = record
           x,y:longint;
          end;

var h,b:array[1..maxN] of longint;
    a:array[1..maxN*maxN] of longint;
    n:longint;
    p:array[1..maxN] of td;

procedure Init;
var i,j:longint;
    s:string;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    readln(p[i].x,p[i].y);
  h[1]:=0;
  for i:=1 to n do
    begin
      readln(s);
      h[i+1]:=h[i];
      for j:=1 to n do
        if ord(s[j]) - 48 = 1 then
          begin
            inc(h[i+1]);
            a[h[i+1]]:=j;
          end;
    end;
  close(input);
end;

procedure DFS(i,c:longint);
var j:longint;
begin
  b[i]:=c;
  for j:=h[i]+1 to h[i+1] do
    if b[a[j]] = 0 then
      DFS(a[j],c);
end;

procedure DetectField;
var c,i:longint;
begin
  fillchar(b,sizeof(b),0);
  c:=0;
  for i:=1 to n do
    if b[i] = 0 then
      begin
        inc(c);
        DFS(i,c);
      end;
end;

procedure Check;
begin
  for u:=1 to n do
    for v:=1 to n do
      if u = v then c[u,v]:=0 else c[u,v]:=maxC;

  for u:=1 to n do
    for i:=h[u]+1 to h[u+1] do
      begin
        v:=a[i];
        x1:=p[u].x;
        y1:=p[u].y;
        x2:=p[v].x;
        y2:=p[v].y;
        c[u,v]:=sqrt(sqr(x2-x2) + sqr(y2-y1));
        c[v,u]:=c[u,v];
      end;

  for i:=1 to c do
    for j:=1 to c do



  for k:=1 to n do
    for u:=1 to n do
      for v:=1 to n do
        if c[u,v] > c[u,k] + c[k,v] then
        c[u,v]:=min(c[u,v],c[u,k] + c[k,v]);
end;

procedure Generate(i:longint);
begin
  if i > c then
    begin
      Check;
      exit;
    end;
  for j:=1 to n do
    if b[j] = i then
      begin
        q[i]:=j;
        Generate(i+1);
      end;
end;

procedure Analyse;
begin
  DetectField;
end;

begin
  Init;
  Analyse;
end.
