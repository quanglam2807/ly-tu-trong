const fileinp = 'lt2509.inp';
      fileout = 'lt2509.out';

var n,m,i,x,y,count,i2:integer;
    a:array[1..10000,1..10000] of boolean;
    d:array[1..100000] of boolean;
    b,c:array[1..10000] of integer;

procedure dfs(t:integer);
var j:integer;
begin
  d[t]:=false;
  b[t]:=count;
  inc(c[count]);
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
  count:=0;
  for i:=1 to n do
    if d[i] then
      begin
        inc(count);
        c[count]:=0;
        dfs(i);
      end;
  writeln(count);
  for i:=1 to count do
    begin
      write(c[i],' ');
      for i2:=1 to n do
        if b[i2] = i then
          write(i2,' ');
      writeln;
    end;
  close(input); close(output);
end.
