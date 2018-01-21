const fileinp = 'tarjan.inp';
      fileout = 'tarjan.out';

var n,m,top,count,ccount:integer;
    number,stack,low:array[1..1000] of integer;
    free:array[1..1000] of boolean;
    a:array[1..1000,1..1000] of boolean;

function Min(x,y:integer):integer;
begin
  if x > y then exit(y)
  else exit(x);
end;

function Pop:integer;
begin
  Pop:=stack[top];
  dec(top);
end;

procedure Tarjan(u:integer);
var v:integer;
begin
  inc(count);
  number[u]:=count;
  low[u]:=number[u];
  inc(top);
  stack[top]:=u;
  for v:=1 to n do
    if free[v] and a[u,v] then
      begin
        if number[v] <> 0 then
          low[u]:=min(low[u],number[v])
        else
          begin
            Tarjan(v);
            low[u]:=min(low[u],low[v]);
          end;
      end;
  if number[u] = low[u] then
    begin
      inc(ccount);
      repeat
        v:=Pop;
        writeln(v);
        free[v]:=false;
      until v=u;
      writeln;
    end;
end;

procedure Main;
var i,t1,t2:integer;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m);
  fillchar(a,sizeof(a),false);
  for i:=1 to m do
    begin
      readln(t1,t2);
      a[t1,t2]:=true;
    end;
  fillchar(number,sizeof(number),0);
  fillchar(free,sizeof(free),true);
  top:=0;
  count:=0;
  ccount:=0;
  for i:=1 to n do
    if number[i] = 0 then Tarjan(i);
  writeln(ccount);
  close(input);  close(output);
end;

begin
  Main;
end.

