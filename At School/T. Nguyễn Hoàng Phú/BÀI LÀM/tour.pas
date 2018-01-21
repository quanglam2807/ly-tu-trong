const fileinp = 'tour.inp';
      fileout = 'tour.out';
      maxN = 1000;

var n,m,p,s,t,l,wonder,min:longint;
    a:array[1..maxN,1..maxN] of longint;
    q:array[1..maxN] of longint;
    free,x:array[1..maxN] of boolean;

procedure Init;
var i,u,v:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m,p,s,t);
  fillchar(a,sizeof(a),255);
  for i:=1 to m do
    begin
      readln(u,v,a[u,v]);
      a[v,u]:=a[u,v];
    end;
  fillchar(x,sizeof(x),false);
  while not eoln do
    begin
      read(i);
      x[i]:=true;
    end;
  close(input);
end;

procedure DFS(i:longint);
var u,v:longint;
begin
  u:=q[i-1];
  if u = t then
    begin
      if (l < min) and (wonder >= 1) then
        min:=l;
      exit;
    end;
  for v:=1 to n do
    if (free[v]) and (a[u,v] >= 0) then
      begin
        free[v]:=false;
        q[i]:=v;
        l:=l+a[u,v];
        if x[v] then inc(wonder);
        DFS(i+1);
        free[v]:=true;
        l:=l-a[u,v];
        if x[v] then dec(wonder);
      end;
end;

procedure Analyse;
begin
  fillchar(free,sizeof(free),true);
  min:=maxlongint;
  wonder:=0;
  l:=0;
  q[1]:=s;
  free[s]:=false;
  DFS(2);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(min);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
