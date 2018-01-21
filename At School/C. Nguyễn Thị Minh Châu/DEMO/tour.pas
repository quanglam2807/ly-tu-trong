const fileinp = 'tour.inp';
      fileout = 'tour.out';
      maxN = 100;
      maxC = 1000000;

var n,m,l,k,t,min,minC:longint;
    c:array[1..maxN,1..maxN] of longint;
    free:array[1..maxN] of boolean;
    q,res:array[1..maxN] of longint;

procedure Init;
var u,v,i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  for u:=1 to n do
    for v:=1 to n do
      c[u,v]:=maxC;
  minC:=maxlongint;
  for i:=1 to m do
    begin
      readln(u,v,c[u,v]);
      c[v,u]:=c[u,v];
      if c[u,v] < minC then minC:=c[u,v];
    end;
  close(input);
end;

procedure Next(i:longint);
var u,v:longint;
begin
  u:=q[i-1];
  for v:=1 to n do
    if (free[v]) and (c[u,v] < maxC) then
      begin
        l:=l + c[u,v];
        q[i]:=v;
        if (v = t) then
          begin
            if (i >=4) and (l < min) then
              begin
                 min:=l;
                 k:=i;
                 res:=q;
              end;
            l:=l - c[u,v];
            continue;
          end;
        free[v]:=false;
        if l+minC*(n-i) < min then Next(i+1);
        l:=l - c[u,v];
        free[v]:=true;
      end;
end;

procedure Analyse;
begin
  min:=maxlongint;
  k:=0;
  for t:=2 to n do
    begin
      fillchar(free,sizeof(free),true);
      q[1]:=t;
      l:=0;
      Next(2);
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  if k = 0 then
    begin
      writeln(k);
      exit;
    end;
  writeln(1);
  writeln(min);
  writeln(k-1);
  for i:=1 to k-1 do write(res[i],' ');
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
