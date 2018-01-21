const fileinp = 'dayso.in';
      fileout = 'dayso.out';
      maxN = 1000;

var n,m:longint;
    s:int64;
    a:array[1..maxN*2] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to m do
    read(a[n+i]);
  close(input);
end;

procedure Sort;
var i,j,tmp:longint;
begin
  for i:=1 to n+m-1 do
    for j:=i+1 to n+m do
      if a[i] < a[j] then
        begin
          tmp:=a[i];
          a[i]:=a[j];
          a[j]:=tmp;
        end;
end;

procedure Sum;
var i:longint;
begin
  s:=0;
  for i:=1 to n do
     s:=s+a[i];
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(s);
  close(output);
end;

begin
  Init;
  Sort;
  Sum;
  Print;
end.
