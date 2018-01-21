const fileinp = '';
      fileout = '';
      maxN = 17000;

var a:array[0..maxN] of longint;
    n,k:longint;

procedure Analyse;
var l,f,i:longint;
    q:array[1..maxN] of longint;
begin
  l:=0;
  f:=1;
  a[0]:=-1;
  for i:=1 to n do
    begin
      while (l >= f) and (a[i] <= a[q[l]]) do
        dec(l);
      inc(l);
      q[l]:=i;
      while (q[l] - q[f] >= k) do
        inc(f);
      if i >= k then
        write(a[q[f]],' ');
    end;
  writeln;
end;

procedure Init;
var i:longint;
begin
  readln(n,k);
  for i:=1 to n do read(a[i]);
  readln;
end;

procedure Main;
var i,t:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(t);
  for i:=1 to t do
    begin
      Init;
      Analyse;
    end;
  close(input); close(output);
end;

begin
  Main;
end.

