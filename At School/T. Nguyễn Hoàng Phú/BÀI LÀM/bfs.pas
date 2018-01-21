type
  canh=record u,v: longint; end;
const
  finp='bfs.inp';
  fout='bfs.out';
  maxn=1000;
  maxm=1000000;
var
  n,m,s,t,i: longint;
  link,e: array [1..maxm] of longint;
  tr,head: array [1..maxn] of longint;
  free: array [1..maxn] of boolean;

  dsc: array [1..maxm] of canh;

procedure qsort(l,r: longint);
var
  i,j: longint;
  x,t: canh;
begin
  if l>=r then exit;
  i:=l;j:=r;
  x:=dsc[(i+j) div 2];

  repeat
    while (dsc[i].u<x.u) or ((dsc[i].u=x.u) and (dsc[i].v>x.v)) do inc(i);
    while (dsc[j].u>x.u) or ((dsc[j].u=x.u) and (dsc[j].v<x.v)) do dec(j);

    if i<=j then
      begin
        t:=dsc[i];
        dsc[i]:=dsc[j];
        dsc[j]:=t;

        inc(i);
        dec(j);
      end;
  until i>j;
  qsort(l,j);
  qsort(i,r);
end;

procedure init;
var i,u,v: longint;
begin
  assign(input,finp);reset(input);
  readln(n,m,s,t);
  for i:=1 to m do
    readln(dsc[i].u,dsc[i].v);
  close(input);
  qsort(1,m);

  for i:=1 to m do
    begin
      u:=dsc[i].u;
      v:=dsc[i].v;
      e[i]:=v;
      link[i]:=head[u];
      head[u]:=i;
    end;

  for i:=1 to n do
    free[i]:=true;
end;

procedure solve(u: longint);
var i,first,last,v: longint;
begin
  first:=1;last:=1;dsc[last].u:=u;free[u]:=false;
  free[u]:=false;

  repeat
    u:=dsc[first].u;first:=first+1;

    i:=head[u];
    while i<>0 do
      begin
        v:=e[i];
        if free[v] then
          begin
            free[v]:=false;
            inc(last);
            dsc[last].u:=v;
            tr[v]:=u;
          end;
        i:=link[i];
      end;
  until first>last;
end;

procedure print;
var count,u: longint;
begin
  assign(output,fout);rewrite(output);
  u:=t;count:=0;
  while u<>s do
    begin
      inc(count);
      link[count]:=u;
      u:=tr[u];
    end;
  write(s);
  while count>0 do
    begin
      write(' ',link[count]);
      dec(count);
    end;
  close(output);
end;

begin
  init;
  solve(s);
  print;
end.
