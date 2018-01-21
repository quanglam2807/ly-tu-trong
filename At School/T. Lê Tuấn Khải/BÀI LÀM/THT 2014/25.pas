const fileinp = 'bfs.inp';
      fileout = 'bfs.out';

var n,m,i,u,v,rear,front,t:longint;
    a:array[1..10000,1..10000] of boolean;
    free:array[1..10000] of boolean;
    q:array[1..10000] of longint;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m);
  fillchar(a,sizeof(a),false);
  fillchar(free,sizeof(free),true);
  fillchar(q,sizeof(q),0);
  for i:=1 to m do
    begin
      readln(u,v);
      a[u,v]:=true;
      a[v,u]:=true;
    end;
  free[1]:=false;
  rear:=0;
  front:=1;
  q[1]:=1;
  repeat
    begin
      inc(rear);
      t:=q[rear];
      writeln(t);
      for i:=1 to n do
        if a[i,t] and free[i] then
          begin
            inc(front);
            q[front]:=i;
            free[i]:=false;
          end;
    end;
  until rear >= front;
  close(input); close(output);
end.
