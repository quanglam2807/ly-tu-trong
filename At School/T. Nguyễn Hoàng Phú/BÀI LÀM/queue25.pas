const fileinp = 'queue25.inp';
      fileout = 'queue25.out';

var a:array[1..10000,1..10000] of boolean;
    free:array[1..10000] of boolean;
    n,m,s,t,i,u,v,front,rear,count:longint;
    b,trace:array[1..10000] of longint;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m,s,t);
  fillchar(a,sizeof(a),false);
  fillchar(free,sizeof(free),true);
  for i:=1 to m do
    begin
      readln(u,v);
      a[u,v]:=true;
      a[v,u]:=true;
    end;
  b[1]:=s;
  rear:=0;
  front:=1;
  repeat
    begin
      inc(rear);
      write(b[rear],' ');
      for i:=1 to n do
        if a[rear,i] and free[i] then
          begin
            free[i]:=false;
            inc(front);
            b[front]:=i;
          end;
    end;
  until rear >= front;
  count:=0;
  for i:=2 to front do
    begin
      if b[i] <> t then inc(count)
      else break;
    end;
  writeln(count);
  close(input); close(output);
end.