const fileinp = 'network.inp';
      fileout = 'network.out';
      maxN = 10000;

var n:longint;
    u,v:array[1..maxN] of longint;
    d:array[1..maxN,1..maxN] of longint;


procedure TyP;
var a,b,c,res:longint;
    count:longint;
    free:array[1..maxN] of boolean;

  procedure DFS(u:longint);
  var v:longint;
  begin
    free[u]:=false;
    for v:=1 to n do
      if (free[v]) and (d[u,v] > -1) then
        begin
          if d[u,v] <= c then inc(count);
          if v = b then
            begin
              res:=count;
              exit;
            end
          else DFS(v);
          if d[u,v] <= c then dec(count);
        end;
  end;

begin
  readln(a,b,c);
  count:=0;
  fillchar(free,sizeof(free),true);
  res:=0;
  DFS(a);
  writeln(res);
end;

procedure TyT;
var k,c,tmp,rear,front,i,j,count:longint;
    free:array[1..maxN] of boolean;
    q:array[1..maxN] of longint;
begin
  readln(k,c);
  tmp:=d[u[k],v[k]];
  d[u[k],v[k]]:=-1;
  d[v[k],u[k]]:=-1;
  rear:=1;
  front:=1;
  q[1]:=v[k];
  fillchar(free,sizeof(free),true);
  free[v[k]]:=false;
  count:=0;
  repeat
    i:=q[rear]; inc(rear);
    for j:=1 to n do
      if (free[j]) and (d[i,j] > -1) then
        begin
          if d[i,j] <= c then inc(count);
          inc(front);
          q[front]:=j;
          free[j]:=false;
        end;
  until rear > front;
  d[u[k],v[k]]:=tmp;
  d[v[k],u[k]]:=tmp;
  writeln(count);
end;

procedure Main;
var i,m:longint;
    t:char;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m);
  fillchar(d,sizeof(d),255);
  for i:=1 to n-1 do
    begin
      readln(u[i],v[i],d[u[i],v[i]]);
      d[v[i],u[i]]:=d[u[i],v[i]];
    end;
  for i:=1 to m do
    begin
      read(t);
      if t = 'P' then TyP;
      if t = 'T' then TyT;
    end;
  close(input); close(output);
end;

begin
  Main;
end.
