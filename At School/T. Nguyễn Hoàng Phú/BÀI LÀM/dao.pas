const fileinp = 'dao.inp';
      fileout = 'dao.out';
      maxN = 200;

type TDao = record
              x,y:integer;
            end;

var dao:array[1..maxN] of TDao;
    n,m,u,v:integer;
    trace:array[1..maxN] of integer;
    a:array[1..maxN,1..maxN] of boolean;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m,u,v);
  for i:=1 to n do readln(dao[i].x,dao[i].y);
  fillchar(a,sizeof(a),false);
  for i:=1 to n do
    for j:=1 to n do
      if sqrt(sqr(dao[i].x - dao[j].x) + sqr(dao[i].y - dao[j].y)) < m then
        begin
          a[i,j]:=true;
          a[j,i]:=true;
        end;
  close(input);
end;

procedure Bfs;
var way:array[1..maxN] of integer;
    free:array[1..maxN] of boolean;
    rear,front,i,j:integer;
    stop:boolean;
begin
  fillchar(trace,sizeof(trace),0);
  fillchar(free,sizeof(free),true);
  rear:=0;
  front:=1;
  way[1]:=u;
  free[1]:=false;
  stop:=false;
  repeat
    inc(rear);
    i:=way[rear];
    for j:=1 to n do
      if a[i,j] and free[j] then
        begin
          inc(front);
          way[front]:=j;
          free[j]:=false;
          trace[j]:=i;
          if j = v then stop:=true;
        end;
  until (rear >= front) or stop;
end;


procedure Print;
var s,count,i:integer;
    tmp:array[1..maxN] of integer;
begin
  assign(output,fileout); rewrite(output);
  s:=trace[v];
  count:=0;
  while s <> u do
    begin
      inc(count);
      tmp[count]:=s;
      s:=trace[s];
    end;
  writeln(count);
  for i:=count downto 1 do write(tmp[i],' ');
  close(output);
end;

begin
  Init;
  Bfs;
  Print;
end.