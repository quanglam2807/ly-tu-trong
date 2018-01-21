const fileinp = 'wildlife.inp';
      fileout = 'wildlife.out';
      maxN    = 100000;
      maxM    = 200000;

type edge = record u,v,w: longint; end;
     vector = array [1..maxN] of longint;

var head,lab: vector;
    link: array [-maxM..maxM] of longint;
    e: array [-maxM..maxM] of edge;
    res,n,m: longint;

procedure Init;
var i,u,v: longint;
    t: vector;
begin
  assign(input,fileinp);reset(input);
  readln(n,m);
  for i:=1 to n do
    read(t[i]);
  for i:=1 to m do
    begin
      readln(u,v);
      e[i].u:=u;
      e[i].v:=v;
      e[i].w:=abs(t[u]-t[v]);
    end;

  filldword(head,n,0);
  filldword(link,2*m,0);

  close(input);
end;

procedure sort(low,high: longint);
var i,j: longint;
    p,t: edge;
begin
  if low>=high then
    exit;
  i:=low;
  j:=high;

  p:=e[(i+j) div 2];
  repeat
    while p.w > e[i].w do
      i:=i+1;
    while p.w < e[j].w do
      j:=j-1;

    if i<=j then
      begin
        t:=e[i];
        e[i]:=e[j];
        e[j]:=t;

        i:=i+1;
        j:=j-1;
      end;
  until i>j;

  sort(low,j);
  sort(i,high);
end;

function getRoot(u: longint): longint;
begin
  if lab[u]<0 then exit(u);
  getRoot:=getRoot(lab[u]);
  lab[u]:=getRoot;
end;

function union(i: longint): boolean;
var r,s,x: longint;
begin
  union:=false;
  with e[i] do
    begin
      r:=getRoot(u);
      s:=getRoot(v);
      x:=lab[r]+lab[s];
      union:=r<>s;

      if union then
        if lab[r]>lab[s] then
          begin
            lab[r]:=s;
            lab[s]:=x;
          end
        else
          begin
            lab[s]:=r;
            lab[r]:=x;
          end;
      end;
end;

procedure addEdge(i: longint);
begin
  with e[i] do
    begin
      link[i]:=head[u];
      head[u]:=i;
    end;

  e[-i].v:=e[i].u;
  e[-i].u:=e[i].v;
  e[-i].w:=e[i].w;

  with e[-i] do
    begin
      link[-i]:=head[u];
      head[u]:=-i;
    end;
end;

procedure buildTree;
var i,count: longint;
begin
  filldword(lab,n,dword(-1));
  count:=0;

  for i:=1 to m do
    if union(i) then
      begin
        addEdge(i);
        inc(count);
        if count=n-1 then
          break;
      end;
end;

function preorder(u,p: longint; var tr: vector): boolean;
var i: longint;
begin
  preorder:=false;
  if u=n then exit(true);

  i:=head[u];
  while i<>0 do
    begin
      if e[i].v<>p then
        begin
          tr[e[i].v]:=i;
          if preorder(e[i].v,u,tr) then
            exit(true);
        end;
      i:=link[i];
    end;
end;

procedure solve;
var tr: vector;
    u: longint;
begin
  filldword(tr,n,0);
  preorder(1,0,tr);
  u:=n;
  while u<>1 do
    begin
      if res<e[tr[u]].w then
        res:=e[tr[u]].w;
      u:=e[tr[u]].u;
    end;
end;

procedure print;
begin
  assign(output,fileout);rewrite(output);
  writeln(res);
  close(output);
end;

begin
  Init;
  Sort(1,m);
  BuildTree;
  Solve;
  Print;
end.
