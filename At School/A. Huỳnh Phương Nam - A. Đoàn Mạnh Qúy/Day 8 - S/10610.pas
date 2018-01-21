const fileinp = '10610.inp';
      fileout = '10610.out';
      maxN = 1000;

var v,m,n:integer;
    xt,yt:real;
    x,y:array[1..maxN] of real;
    free:array[1..maxN] of boolean;
    a:array[1..maxN,1..maxN] of boolean;
    trace:array[1..maxN] of integer;


procedure Print;
var i,count:integer;
begin
  if free[n]=false then writeln('No.')
  else
    begin
      i:=n;
      count:=0;
      while i <> 0 do
        begin
          inc(count);
          i:=trace[i];
        end;
      writeln(count);
    end;
end;

procedure BFS;
var front,rear,i,tmp:integer;
    q:array[1..maxN] of integer;
begin
  front:=1;
  rear:=0;
  q[1]:=1;
  free[1]:=false;
  repeat
    inc(rear);
    tmp:=q[rear];
    for i:=1 to n do
      if free[i] and a[tmp,i] then
        begin
          free[i]:=false;
          inc(front);
          q[front]:=i;
          trace[i]:=tmp;
        end;
  until (rear >= front);
end;

procedure Analyse;
var require,tmp:real;
    i,j:integer;
begin
  fillchar(a,sizeof(a),false);
  require:=v*m*60;
  for i:=1 to n do
    for j:=1 to n do
    if i <> j then
      begin
        tmp:=sqrt(sqr(x[j]-x[i]) + sqr(y[j]-y[i]));
        if tmp <= require then a[i,j]:=true;
      end;
  BFS;
end;

procedure Main;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  repeat
    fillchar(trace,sizeof(trace),0);
    fillchar(free,sizeof(free),true);
    readln(v,m);
    if (v=0) and (m=0) then break;
    readln(x[1],y[1]);
    readln(xt,yt);
    n:=1;
    while not eoln do
      begin
        inc(n);
        read(x[n],y[n]);
        if eoln then readln;
        if eoln then break;
      end;
    inc(n);
    x[n]:=xt;
    y[n]:=yt;
    readln;
    Analyse;
    Print;
  until false;
  close(input); close(output);
end;



begin
  Main;
end.
