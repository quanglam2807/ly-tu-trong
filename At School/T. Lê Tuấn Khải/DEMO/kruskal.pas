const   fi = 'kruskal.inp';
        fo = 'kruskal.out';
        maxN = 10000;
        maxM = 1000000;

type    TEdge = record
          u,v,w : longint;
        end;

var     ck : array [1..maxM] of boolean;
        lab,count : array [1..maxN] of longint;
        e : array [1..maxM] of TEdge;
        n,m : longint;
        res,t : longint;

procedure Init;
var     i : longint;
begin
  assign(input,fi);  reset(input);
  readln(n,m);
  for i:=1 to m do readln(e[i].u,e[i].v,e[i].w);
  close(input);
end;

procedure sort(l,r : longint);
var     i,j,p : longint;
        tmp : TEdge;
begin
  if l>=r then exit;
  i:=l;
  j:=r;
  p:=e[random(r-l+1)+l].w;
  repeat
    while e[i].w<p do inc(i);
    while e[j].w>p do dec(j);
    if i<=j then
      begin
        tmp:=e[i];
        e[i]:=e[j];
        e[j]:=tmp;
        inc(i);
        dec(j);
      end;
  until i>j;
  sort(l,j);
  sort(i,r);
end;

function getRoot(u : longint):longint;
begin
  while lab[u]>0 do u:=lab[u];
  exit(u);
end;

procedure wedding(u,v : longint);
begin
  if count[u]>count[v] then
    begin
      lab[v]:=u;
      count[u]:=count[u]+count[v];
    end
  else
    begin
      lab[u]:=v;
      count[v]:=count[u]+count[v];
    end;
end;

procedure Solve;
var     i,u,v : longint;
begin
  sort(1,m);
  fillchar(ck,n,false);
  fillword(count,n,1);
  res:=0;
  fillchar(lab,n,255);
  for i:=1 to m do
    begin
      u:=getRoot(e[i].u);
      v:=getRoot(e[i].v);
      if u<>v then
        begin
          ck[i]:=true;
          res:=res+e[i].w;
          wedding(u,v);
        end;
    end;
end;

procedure Print;
begin
  assign(output,fo);  rewrite(output);
  writeln(res);
  close(output);
end;

begin
  Init;
  Solve;
  Print;
end.
