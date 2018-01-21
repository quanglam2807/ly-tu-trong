const fileinp = 'oil.inp';
      fileout = 'oil.out';
      maxN = 1000000;

var m,n,k:longint;
    c:array[1..maxN] of longint;
    s:int64;

procedure Analyse;
var f,l,i:longint;
    q:array[1..maxN] of longint;
begin
  f:=1;
  l:=1;
  q[1]:=1;
  s:=c[1];
  for i:=2 to n do
    begin
      while (l >= f) and (c[i] <= c[q[l]])  do
        dec(l);
      inc(l);
      q[l]:=i;
     while (q[l] - q[f] >= k)  do
        inc(f);
      s:=s + c[q[f]];
    end;
end;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m,k);
  s:=0;
  for i:=1 to n do
    begin
      read(c[i]);
    end;
  close(input);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(s/n:0:4);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
