const fileinp = 'short.inp';
      fileout = 'short.out';

var n,m,s,t,i,u,v,j,count:longint;
    a:array[1..1000,1..1000] of longint;
    tmp:array[1..3] of longint;
    d,p,b:array[1..10000] of longint;
    stop:boolean;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m,s,t);
  for i:=1 to n do
    for j:=1 to n do
       a[i,j]:=maxint;
  for i:=1 to n do a[i,i]:=0;
  for i:=1 to m do
    begin
      readln(tmp[1],tmp[2],tmp[3]);
      a[tmp[1],tmp[2]]:=tmp[3];
    end;
  for i:=1 to n do
    begin
      d[i]:=maxint;
      p[i]:=0;
    end;
  d[s]:=0;
  for i:=1 to n-1 do
    begin
      for u:=1 to  n do
        for v:=1 to n do
          begin
            if (d[v] > (d[u] + a[u,v])) then
              begin
                d[v]:=d[u]+a[u,v];
                p[v]:=u;
              end;
          end;
    end;
  writeln(d[t]);
  i:=t;
  count:=0;
  while i <> s do
    begin
      inc(count);
      b[count]:=i;
      i:=p[i];
    end;
  write(s,' ');
  for i:=count downto 1 do write(b[i],' ');
  close(input); close(output);
end.
