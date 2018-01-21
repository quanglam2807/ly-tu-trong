const fileinp = 'dfs.inp';
      fileout = 'dfs.out';

var a:array[1..1000,1..1000] of boolean;
    d:array[1..1000] of boolean;
    n,m:integer;

procedure dfs(i:integer);
var j:integer;
begin
  writeln(i);
  d[i]:=false;
  for j:=1 to n do
    if (a[i,j]) and (d[j]) then dfs(j);
end;

procedure Init;
var i,u,v:integer;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m);
  for i:=1 to m do
    begin
      readln(u,v);
      a[u,v]:=true;
      a[v,u]:=true;
    end;
  fillchar(d,sizeof(d),true);
  dfs(1);
  close(input); close(output);
end;

begin
  Init;
end.
