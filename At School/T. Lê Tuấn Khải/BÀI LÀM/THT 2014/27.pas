const fileinp = 'racing.inp';
      fileout = 'racing.out';
      maxN    = 1000;
      maxC    = maxlongint div 2;

var n,m,all:longint;
    c:array[1..maxN,1..maxN] of longint;


procedure Init;
var i,j,u,v:longint;
begin
  assign(input,fileinp); reset(input);
  all:=0;
  readln(n,m);
  for i:=1 to n do
    for j:=1 to n do
      if i = j then
        c[i,j]:=0
      else
        c[i,j]:=-maxC;
  for i:=1 to m do
    begin
      readln(u,v,c[u,v]);
      c[v,u]:=c[u,v];
      inc(all,c[u,v]);
    end;
  close(input);
end;

procedure Prim;
var i,u,v,k,min:longint;
    d:array[1..maxN] of longint;
    free:array[1..maxN] of boolean;
begin
  for i:=2 to n do d[i]:=-maxC;
  d[1]:=0;
  fillchar(free,sizeof(free),true);
  for k:=1 to n do
    begin
      u:=0; min:=-maxC;
      for i:=1 to n do
        if (free[i]) and (d[i] > min) then
          begin
            min:=d[i];
            u:=i;
          end;
      if u = 0 then
        break;
      free[u]:=false;
      for v:=1 to n do
        if (free[v]) and (d[v] < c[u,v]) then
          d[v]:=c[u,v];
    end;
  for i:=1 to n do dec(all,d[i]);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(all);
  close(output);
end;

begin
  Init;
  Prim;
  Print;
end.