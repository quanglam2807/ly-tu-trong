const fileinp = 'ucln.inp';
      fileout = 'ucln.out';
      maxM = 150000;
      maxN = 50000;

var n,m,count:longint;
    h:array[1..maxN] of longint;
    a,d,k:array[1..maxM] of longint;

procedure PrintFail;
begin
  assign(output,fileout); rewrite(output);
  writeln('-1');
  close(output);
  halt;
end;

procedure Init;
var i,u,v,c:longint;
begin
  assign(input,fileinp);
  reset(input);
  readln(n,m);
  fillchar(h,sizeof(h),0);
  fillchar(k,sizeof(k),0);
  for i:=1 to m do
    begin
      readln(u,v);
      inc(h[u]);  inc(h[v]);
    end;
  c:=0;
  for i:=2 to n do
    begin
      if h[i] = 1 then inc(c);
      if c >= 2 then PrintFail;
      h[i]:=h[i-1] + h[i];
    end;
  h[n]:=m;
  reset(input);
  readln;
  for i:=1 to m do
    begin
      readln(u,v);
      a[h[u]]:=v;
      a[h[v]]:=u;
      d[h[u]]:=i;
      d[h[v]]:=i;
      dec(h[u]);
      dec(h[v]);
    end;
  close(input);
end;


procedure DFS(i:longint);
var j:longint;
begin
  for j:=h[i]+1 to h[i+1] do
    if k[d[j]] = 0 then
      begin
        inc(count);
        k[d[j]]:=count;
        DFS(a[j]);
      end
end;


procedure Analyse;
var i:longint;
begin
  count:=0;
  for i:=1 to n do
    DFS(i);
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to m do
    begin
      if k[i] = 0 then
        begin
          inc(count);
          k[i]:=count;
        end;
      writeln(k[i]);
    end;
  close(output);
end;

begin
  Init;
  Analyse;
  Print;

end.
