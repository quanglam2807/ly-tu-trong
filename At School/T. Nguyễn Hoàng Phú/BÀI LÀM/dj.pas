const fi='short.inp';
      fo='short.out';
      max=10000;


var c:array [1..max,1..max] of integer;
    d,trace:array [1..max] of integer;
    free:array [1..max] of boolean;
    n,s,t,min:integer;

procedure init;
var i, m,u,v:integer;
begin
  assign(input,fi);
  reset(input);
  readln(n,m,s,t);
  for u:=1 to n do
    for v:=1 to m do
      if u0=v then c[u,v]:=0
        else c[u,v]:=maxint;
  for i:=1 to m do readln(u,v,c[u,v]);
  close(input);
  fillchar(free, sizeof(free),true);
  for i:=1 to n do d[i]:=maxint;
  d[s]:=0;
end;

procedure dijkstra;
var i,u,v,min:integer;
begin
  repeat
    u:=0;
    min:=maxint;
    for i:=1 to n do
      if (free[i]) and (d[i]<min) then
        begin
          min:=d[i];
          u:=i;
        end;
    if (u=0)or (u=t) then break;
    free[u]:=false;
    for v:=1 to n do
      if (free [v])and (d[v]>d[u]+c[u,v]) then
        begin
          d[v]:=d[u]+c[u,v];
          trace[v]:=u;
        end;
  until false;
end;

procedure printresult;
var b:array [1..max] of integer;
    u,v,min:integer;
begin
  assign(output,fo);rewrite(output);
  v:=0;
  if d[t]=maxint then write('khong co duong do tu ',s,' den ',t)
  else begin
    while t<>s do
      begin
        inc(v);
        b[v]:=t;
        t:=trace[t];
      end;
      b[v+1]:=s;
      min:=0;
      for u:=v downto 1 do min:=min+c[b[u+1],b[u]];
      writeln(min);
      for u:=v+1 downto 1 do write(b[u],' ');
    end;
    close(output);
end;

begin
   init;
   dijkstra;
   printresult;
end.
