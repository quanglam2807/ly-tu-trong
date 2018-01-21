const fileinp = 'mien.inp';
      fileout = 'mien.out';
      di:array[1..4] of integer = (0,-1,0,1);
      dj:array[1..4] of integer = (1,0,-1,0);
      maxN = 101;
var a:array[0..maxN,0..maxN] of integer;
    m,n,smax,sl:integer;
    free:array[0..maxN,0..maxN] of boolean;

procedure Init;
var i,j:integer;
begin
  assign(input,fileinp); reset(input);
  readln(m,n);
  for i:=1 to m do
    begin
      for j:=1 to n do read(a[i,j]);
      readln;
    end;
  for i:=0 to m+1 do
    begin
      a[i,0]:=1;
      a[i,n+1]:=1;
    end;
  for j:=0 to n+1 do
    begin
      a[0,j]:=1;
      a[m+1,j]:=1;
    end;
end;

function BFS(i,j:integer):integer;
var count,rear,front,i1,i2,j1,j2,t:integer;
    qi,qj:array[1..maxN*maxN] of integer;
begin
  count:=0;
  rear:=1;
  front:=1;
  qi[front]:=i;
  qj[front]:=j;
  repeat
    inc(count);
    i1:=qi[rear];
    j1:=qj[rear];
    inc(rear);
    for t:=1 to 4 do
      begin
        i2:=i1+di[t];
        j2:=j1+dj[t];
        if (a[i2,j2]=0) and (free[i2,j2]) then
          begin
            free[i2,j2]:=false;
            inc(front);
            qi[front]:=i2;
            qj[front]:=j2;
          end;
      end;
  until rear > front;
  exit(count);
end;

procedure Solve;
var i,j,s:integer;
begin
  fillchar(free,sizeof(free),true);
  for i:=1 to m do
    for j:=1 to n do
      if (free[i,j]) and (a[i,j]=0) then
        begin
          free[i,j]:=false;
          s:=BFS(i,j);
          if s > smax then smax:=s;
          inc(sl);
        end;
end;

procedure WriteResult;
begin
  assign(output,fileout); rewrite(output);
  writeln(sl);
  writeln(smax);
  close(output);
end;

begin
  Init;
  Solve;
  WriteResult;
end.
