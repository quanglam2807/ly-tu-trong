{
ID: nghoang4
PROG: crypt1
LANG: PASCAL
}
const fi = 'crypt1.in';
      fo = 'crypt1.out';

var a: array[1..9] of byte;
    n: byte;
    count: longint;

procedure Init;
var i: byte;
begin
  assign(input,fi); reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  close(input);
end;

function Check(x: longint; i: byte): boolean;
var j, r: byte;
    kt: boolean;
begin
  if (i=3) and (x > 999) then exit(false);
  if (i=4) and (x > 9999) then exit(false);
  while x > 0 do
    begin
      r:=x mod 10;
      kt:=false;
      for j:=1 to n do
        if r = a[j] then
          begin
            kt:=true;
            break;
          end;
      if not kt then exit(false);
      x:=x div 10;
    end;
  exit(true);
end;

procedure Solve;
var i1, i2, i3, j1, j2: byte;
    x, y: longint;
begin
  count:=0;
  for i1:=1 to n do
    for i2:=1 to n do
      for i3:=1 to n do
        begin
          x:=a[i1]*100+a[i2]*10+a[i3];
          for j1:=1 to n do
            for j2:=1 to n do
              begin
                y:=a[j1]*10+a[j2];
                if Check(x*a[j1],3) and Check(x*a[j2],3) and Check(x*y,4) then inc(count);
              end;
        end;
end;

procedure PrintResult;
begin
  assign(output,fo); rewrite(output);
  writeln(count);
  close(output);
end;

begin
  Init;
  Solve;
  PrintResult;
end.
