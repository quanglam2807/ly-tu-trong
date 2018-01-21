const
  finp='fair.inp';
  fout='fair.out';
  maxn=1000;
  maxc=maxlongint;
  hx: array [1..4] of longint=(0,1,0,-1);
  hy: array [1..4] of longint=(1,0,-1,0);
  hc: string[4]='RDLU';
var
  m,n: longint;
  d,a: array [1..maxn,1..maxn] of longint;
  free: array [1..maxn,1..maxn] of boolean;
  tr: array [1..maxn,1..maxn] of byte;

procedure init;
var i,j,u,v: longint;
begin
  assign(input,finp);reset(input);
  readln(m,n);
  for i:=1 to m do
    begin
      for j:=1 to n do
        begin
          read(a[i,j]);
          free[i,j]:=true;
          d[i,j]:=maxc;
          tr[i,j]:=0;
        end;
      readln;
    end;
  close(input);
end;

procedure solve;
var
  u,v,x,y,i: longint;
  min: longint;
begin
  for u:=1 to m do
    d[u,1]:=a[u,1];

  repeat
    u:=0;v:=0;min:=maxc;
    for x:=1 to m do
      for y:=1 to n do
        if free[x,y] and (min>d[x,y]) then
          begin
            min:=d[x,y];
            u:=x;
            v:=y;
          end;

    if u=0 then break;
    free[u,v]:=false;

    for i:=1 to 4 do
      begin
        x:=u+hx[i];
        y:=v+hy[i];
        if (x>0) and (y>0) and (x<=m) and (y<=n) then
          if free[x,y] and (d[x,y]>d[u,v]+a[x,y]) then
            begin
              tr[x,y]:=i;
              d[x,y]:=d[u,v]+a[x,y];
            end;
      end;
  until false;
end;

procedure print;
var
  u,v,x,y,min: longint;
  s: string;
begin
  assign(output,fout);rewrite(output);
  min:=maxc;u:=0;
  for v:=1 to m do
    if min>d[v,n] then
      begin
        min:=d[v,n];
        u:=v;
      end;
  writeln(min);
  v:=n;
  repeat
    s:=hc[tr[u,v]]+s;
    x:=u-hx[tr[u,v]];
    y:=v-hy[tr[u,v]];
    u:=x;
    v:=y;
  until v=1;
  writeln(u,' ',v);
  writeln(s);
  close(output);
end;

begin
 init;
 solve;
 print;
end.
