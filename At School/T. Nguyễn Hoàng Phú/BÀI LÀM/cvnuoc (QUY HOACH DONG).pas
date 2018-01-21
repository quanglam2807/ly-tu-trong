const fileinp = 'cvnuoc.inp';
      fileout = 'cvnuoc.out';
      maxN = 100;

var a: array[1..maxN,1..maxN] of integer;
    x, d, f: array[1..maxN] of integer;
    n, m: integer;

procedure Init;
var u, v, i: integer;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  fillchar(a,sizeof(a),0);
  fillchar(d,sizeof(d),0);
  for i:=1 to m do
    begin
      readln(u,v);
      a[u,v]:=1;
      inc(d[v]);
    end;
  close(input);
end;

procedure Sort;
var i, u, v: integer;
    free: array[1..maxN] of boolean;
begin
  fillchar(x,sizeof(x),0);
  fillchar(free,sizeof(free),true);
  for i:=1 to n do
    begin
      for u:=1 to n do
        if free[u] and (d[u] = 0) then
          begin
            x[i]:=u;
            free[u]:=false;
            for v:=1 to n do
              if (a[u,v]=1) then dec(d[v]);
            break;
          end;
    end;
end;

procedure Solve;
var i, j: integer;
begin
  fillchar(f,sizeof(f),0);
  for i:=1 to n do
    begin
      for j:=1 to n do
        if f[x[i]] < f[j] + a[j,x[i]] then
          f[x[i]]:=f[j] + a[j,x[i]];
    end;
end;

procedure PrintResult;
var u, umax: integer;
begin
  assign(output,fileout); rewrite(output);
  umax:=1;
  for u:=2 to n do
    if f[u] > f[umax] then umax:=u;
  writeln(f[umax]);
  close(output);
end;

begin
      Init;
      Sort;
      Solve;
      PrintResult;
end.
