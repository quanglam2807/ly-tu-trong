const fileinp = '11518.inp';
      fileout = '11518.out';

var n,m,l,count:integer;
    a:array[1..10000,1..10000] of integer;
    free:array[1..10000] of boolean;
    q,kt:array[1..10000] of integer;

procedure BFS;
var front,rear,i,tmp:integer;
begin
  front:=l;
  rear:=0;
  repeat
    inc(rear);
    inc(count);
    tmp:=q[rear];
    for i:=1 to kt[tmp] do
      if free[a[tmp,i]] then
        begin
          free[a[tmp,i]]:=false;
          inc(front);
          q[front]:=a[tmp,i];
        end;
  until rear >= front;
end;

procedure BFSt(x:longint);
var front,rear,i,tmp:integer;
begin
  front:=1;
  rear:=0;
  q[1]:=x;
  repeat
    inc(rear);
    inc(count);
    tmp:=q[rear];
    for i:=1 to kt[tmp] do
      if free[a[tmp,i]] then
        begin
          free[a[tmp,i]]:=false;
          inc(front);
          q[front]:=a[tmp,i];
        end;
  until rear >= front;
end;

procedure Print;
var i:integer;
begin
  count:=0;
  for i:=1 to n do
    if free[i]=false then
      inc(count);
  writeln(count);
end;

procedure Main;
var t,i,j,x,y,tmp:integer;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(t);
  for i:=1 to t do
    begin
      fillchar(free,sizeof(free),true);
      fillchar(kt,sizeof(kt),0);
      readln(n,m,l);
      for j:=1 to m do
        begin
          readln(x,y);
          inc(kt[x]);
          a[x,kt[x]]:=y;
        end;
      count:=0;
      {
      for j:=1 to l do
        begin
          readln(tmp);
          if free[tmp] then
            begin
              free[tmp]:=false;
              BFSt(tmp);
            end;
        end; }

      for j:=1 to l do
        begin
          readln(q[j]);
          free[q[j]]:=false;
        end;
      count:=0;
      BFS;
      Print;
    end;
  close(input);  close(output);
end;

begin
  Main;
end.