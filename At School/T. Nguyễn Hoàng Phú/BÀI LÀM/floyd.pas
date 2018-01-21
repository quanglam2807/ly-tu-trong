const fileinp = 'floyd.inp';
      fileout = 'floyd.out';
      maxC = 100;
      maxN = 100;

var n,m,s,t:longint;
    c:array[1..maxN,1..maxN] of longint;
    trace:array[1..maxN,1..maxN] of longint;
    free:array[1..maxN] of boolean;

procedure Init;
var u,v,i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m,s,t);
  for u:=1 to n do
    for v:=1 to n do
      begin
        c[u,v]:=maxC;
        trace[u,v]:=v;
      end;
  for u:=1 to n do c[u,u]:=0;
  for i:=1 to m do
    begin
      readln(u,v,c[u,v]);
      //c[v,u]:=c[u,v];
    end;
  close(input);
end;

procedure Floyd;
var w,u,v:longint;
begin
  for w:=1 to n do
    for u:=1 to n do
      for v:=1 to n do
        if (c[u,v] > c[u,w] + c[w,v]) then
          begin
            c[u,v]:=c[u,w]+c[w,v];
            trace[u,v]:=trace[u,w];
          end;
end;


procedure WriteResult;
begin
  assign(output,fileout); rewrite(output);
  if c[s,t] = maxC then writeln('-1')
  else
    begin
      writeln(c[s,t]);
      repeat
        write(s,' ');
        s:=trace[s,t];
      until s = t;
      write(t);
    end;
  close(output);
end;

begin
  Init;
  Floyd;
  WriteResult;
end.
