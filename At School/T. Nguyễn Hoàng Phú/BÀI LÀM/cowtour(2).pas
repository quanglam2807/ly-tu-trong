{
ID: nhutqua1
PROG: cowtour
LANG: PASCAL
}

uses math;

const fileinp = 'cowtour.in';
      fileout = 'cowtour.out';
      maxN = 150;
      maxC = 100000;

type td = record
           x,y:longint;
          end;

var h,b,q:array[1..maxN] of longint;
    f,d:array[1..maxN] of real;
    a:array[1..maxN*maxN] of longint;
    c:array[1..maxN,1..maxN] of real;
    n,count:longint;
    res:real;
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
var i:longint;
begin
  fillchar(b,sizeof(b),0);
  count:=0;
  for i:=1 to n do
    if b[i] = 0 then
      begin
        inc(count);
        DFS(i,count);
      end;
end;

function Dist(u,v:longint):real;
begin
  exit(sqrt(sqr(p[u].x - p[v].x) + sqr(p[u].y - p[v].y)));
end;

procedure Check;
var i,j,u,v:longint;
    t1,t2:real;
begin
  for i:=1 to count-1 do
    for j:=i+1 to count do
      begin
        u:=q[i];
        v:=q[j];
        t1:=dist(u,v) + f[u] + f[v];
        t2:=math.max(d[i],d[j]);
        if math.max(t1,t2) < res then
          res:=math.max(t1,t2);
      end;
end;


procedure Generate(i:longint);
var j:longint;
begin
  if i > count then
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

procedure CalcF;
var u,v,k,i:longint;
begin
  for u:=1 to n do
    for v:=1 to n do
      if u = v then c[u,v]:=0 else c[u,v]:=maxC;

  for u:=1 to n do
    for i:=h[u]+1 to h[u+1] do
      begin
        v:=a[i];
        c[u,v]:=sqrt(sqr(p[u].x - p[v].x) + sqr(p[u].y - p[v].y));
        c[v,u]:=c[u,v];
      end;

  for k:=1 to n do
    for u:=1 to n do
      for v:=1 to n do
        c[u,v]:=math.min(c[u,v],c[u,k]+c[k,v]);

   for i:=1 to n do
    begin
      f[i]:=0;
      d[i]:=0;
    end;

  for u:=1 to n do
    for v:=1 to n do
      if c[u,v] < maxC then
        f[u]:=math.max(f[u],c[u,v]);

  for i:=1 to count do
    for u:=1 to n do
      if b[u] = i then
        d[i]:=math.max(d[i],f[u]);

end;

procedure Analyse;
var i:longint;
begin
  DetectField;
  CalcF;
  res:=maxlongint;
  Generate(1);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res:0:6);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
