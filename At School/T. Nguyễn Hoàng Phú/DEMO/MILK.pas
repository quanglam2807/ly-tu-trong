{
ID: nghoang4
PROG: milk
LANG: PASCAL
}
const fi = 'milk.in';
      fo = 'milk.out';
      maxN = 5000;

type MyData = record
                v, c: longint;
              end;

var a: array[1..maxN] of MyData;
    n, m, s: longint;

procedure Init;
var i: integer;
begin
  assign(input,fi); reset(input);
  readln(n,m);
  for i:=1 to m do
    readln(a[i].v,a[i].c);
  close(input);
end;

procedure Sort;
var i, j: integer;
    tmp: MyData;
begin
  for i:=1 to m-1 do
    for j:=i+1 to m do
      if a[i].v > a[j].v then
        begin
          tmp:=a[i];
          a[i]:=a[j];
          a[j]:=tmp;
        end;
end;

procedure Solve;
var i: integer;
begin
  Sort;
  s:=0; i:=0;
  while true do
    begin
      inc(i);
      if a[i].c >= n then
        begin
          s:=s+a[i].v*n;
          break;
        end;
      s:=s+a[i].v*a[i].c;
      n:=n-a[i].c;
    end;
end;

procedure PrintResult;
begin
  assign(output,fo); rewrite(output);
  writeln(s);
  close(output);
end;

begin
  Init;
  Solve;
  PrintResult;
end.