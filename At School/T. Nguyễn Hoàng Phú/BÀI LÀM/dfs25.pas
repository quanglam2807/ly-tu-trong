const fileinp = 'dfs25.inp';
      fileout = 'dfs25.out';

var n,m,i,x,y:integer;
    a:array[1..10000,1..10000] of boolean;
    d:array[1..100000] of boolean;

procedure dfs(t:integer);
var j:integer;
begin
  writeln(t);
  d[t]:=false;
  for j:=1 to n do
    if a[t,j] and d[j] then dfs(j);
end;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  fillchar(a,sizeof(a),false);
  fillchar(d,sizeof(d),true);
  readln(n,m);
  for i:=1 to m do
    begin
      readln(x,y);
      a[x,y]:=true;
      a[y,x]:=true;
    end;
  for i:=1 to n do
    if d[i] then
      dfs(i);
  close(input); close(output);
end.
