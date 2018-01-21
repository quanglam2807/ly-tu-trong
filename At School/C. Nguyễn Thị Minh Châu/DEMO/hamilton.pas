const fileinp='hamilton.inp';
      fileout='hamilton.out';
      maxN=1000;
      maxM=10000;

type diem = record
     v,gtri,link: longint;
     end;

var e: array [-maxM..maxM] of diem;
    xres,x,head: array [1..maxN] of longint;
    free: array [1..maxN] of boolean;
    i,n,m,res: longint;

procedure init;
var u,v,i,w: longint;
begin
  assign(input,fileinp);reset(input);
  readln(n,m);
  for i:=1 to m do
    begin
      readln(u,v,w);
      e[i].v:=v;
      e[i].gtri:=w;
      e[i].link:=head[u];
      head[u]:=i;
      e[-i].v:=u;
      e[-i].gtri:=w;
      e[-i].link:=head[v];
      head[v]:=-i;
    end;
  res:=high(longint);
  fillchar(free,sizeof(free),true);
  close(input);
end;

procedure solve(i,w: longint);
var j: longint;
begin
  if i>n then
    begin
      if res>w then
        begin
          res:=w;
          xres:=x;
        end;
      exit;
    end;
  j:=head[x[i-1]];
  while j<>0 do
    begin
      if free[e[j].v] and (w+e[j].gtri<=res) then
        begin
          x[i]:=e[j].v;
          free[e[j].v]:=false;
          solve(i+1,w+e[j].gtri);
          free[e[j].v]:=true;
        end;
      j:=e[j].link;
    end;
end;

procedure print;
var i: longint;
begin
  assign(output,fileout);rewrite(output);
  writeln(res);
  for i:=1 to n do write(xres[i],' ');
  close(output);
end;

begin
  init;
  for i:=1 to n do
    begin
      x[1]:=i;
      free[i]:=false;
      solve(2,0);
    end;
  print;
end.
