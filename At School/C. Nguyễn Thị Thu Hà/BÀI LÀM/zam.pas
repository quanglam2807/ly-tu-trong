const fileinp = 'zam.inp';
      fileout = 'zam.out';
      maxN = 100;
      maxC = maxN * 1000;

var n,m,w,k,s,c,sum:longint;
    free:array[1..maxN] of boolean;
    o,q:array[1..maxN] of longint;
    a:array[1..maxN,1..maxN] of boolean;

procedure Init;
var i,x,y:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m,w,k,s);
  for i:=1 to n do read(o[i]);
  for i:=1 to m do
    begin
      readln(x,y);
      a[x,y]:=true;
      a[y,x]:=true;
    end;
  close(input);
end;

procedure Print(c:longint);
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to c do write(q[i],' ');
  close(output);
  halt;
end;

procedure Next(i:longint);
var u,v:longint;
begin
  u:=q[i-1];
  for v:=1 to n do
    if (free[v]) and (a[u,v]) then
      begin
        free[v]:=false;
        sum:=sum + o[v];
        q[i]:=v;
        if v = k then
          begin
            if sum = s then Print(i);
          end
        else Next(i+1);
        free[v]:=true;
        sum:=sum - o[v];
      end;
end;

procedure Analyse;
begin
  fillchar(free,sizeof(free),true);
  q[1]:=w;
  free[w]:=false;
  sum:=o[w];
  Next(2);
end;

begin
  Init;
  Analyse;
end.
