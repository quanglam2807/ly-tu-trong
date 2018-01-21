const fileinp = 'bfs09.inp';
      fileout = 'bfs09.out';

var n,m,front,rear,i,x,y,t:integer;
    free:array[1..10000] of boolean;
    a:array[1..10000,1..10000] of boolean;
    b:array[1..10000] of integer;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m);
  fillchar(free,sizeof(free),true);
  fillchar(a,sizeof(a),false);
  for i:=1 to m do
    begin
      readln(x,y);
      a[x,y]:=true;
      a[y,x]:=true;
    end;
  for t:=1 to n do
    if free[t] then
      begin
        b[1]:=t;
        front:=1;
        rear:=0;
        free[t]:=false;
        repeat
          begin
            inc(rear);
            writeln(b[rear]);
            for i:=1 to n do
            if a[b[rear],i] and free[i] then
              begin
                inc(front);
                b[front]:=i;
                free[i]:=false;
              end;
            end;
        until rear >= front;
      end;
  close(input); close(output);
end.