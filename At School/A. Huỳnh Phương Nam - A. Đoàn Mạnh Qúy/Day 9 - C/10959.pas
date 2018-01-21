const fileinp = '10959.inp';
      fileout = '10959.out';
      maxN = 10000;

var a:array[0..maxN,0..maxN] of boolean;
    g:array[0..maxN] of integer;
    free:array[0..maxN] of boolean;
    p,d,t,test:integer;

procedure Print;
var i:integer;
begin
  for i:=1 to p-1 do writeln(g[i]);
  if test < t then
    writeln;
end;

procedure BFS;
var i,t,front,rear,s:integer;
    q:array[1..maxN] of integer;
begin
  front:=1;
  rear:=0;
  q[1]:=0;
  free[0]:=false;
  repeat
    inc(rear);
    s:=q[rear];
    for i:=0 to p-1 do
      if a[i,s] and free[i] then
        begin
          free[i]:=false;
          g[i]:=g[s]+1;
          inc(front);
          q[front]:=i;
        end;
  until rear >= front;
end;

procedure Main;
var i,j,tmp1,tmp2:integer;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(t);
  for test:=1 to t do
    begin
      readln;
      readln(p,d);
      fillchar(g,sizeof(g),0);
      fillchar(a,sizeof(a),false);
      fillchar(free,sizeof(free),true);
      for j:=1 to d do
        begin
          readln(tmp1,tmp2);
          a[tmp1,tmp2]:=true;
          a[tmp2,tmp1]:=true;
        end;
      BFS;
      Print;
    end;
  close(input);  close(output);
end;

begin
  Main;
end.
