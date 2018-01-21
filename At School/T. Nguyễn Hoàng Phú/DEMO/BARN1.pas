{
ID: nghoang4
PROG: barn1
LANG: PASCAL
}
const fi = 'barn1.in';
      fo = 'barn1.out';
      maxN = 200;

type MyArr = array[1..maxN] of integer;

var a, b: MyArr;
    m, s, c: integer;

procedure Init;
var i: integer;
begin
  assign(input,fi); reset(input);
  readln(m,s,c);
  for i:=1 to c do readln(a[i]);
  close(input);
end;

procedure Sort(var a: MyArr; n: integer);
var i, j, t: integer;
begin
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if a[i] > a[j] then
        begin
          t:=a[i];
          a[i]:=a[j];
          a[j]:=t;
        end;
end;

procedure Solve;
var i: integer;
begin
  Sort(a,c);
  for i:=1 to c-1 do b[i]:=a[i+1]-a[i]-1;
  Sort(b,c-1);
  s:=0;
  for i:=c-1 downto c-m+1 do s:=s+b[i];
  s:=a[c]-a[1]+1-s;
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