const fileinp = 'daycon.inp';
      fileout = 'daycon.out';
      maxN = 1000;

var a: array[1..maxN] of longint;
    n, max: longint;

function findmax(x: longint): longint;
var curr, count, max, i: longint;
begin
  curr:=-1;
  count:=0;
  max:=-1;
  for i:=1 to n do
    begin
      if a[i] <> x then
          if a[i] = curr then inc(count)
          else
            begin
              curr:=a[i];
              count:=1;
            end;
      if count > max then max:=count
    end;
  exit(max);
end;

procedure Init;
var i: longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do readln(a[i]);
  close(input);
end;

procedure Solve;
var i, t: longint;
begin
  max:=-1;
  for i:=1 to n do
    begin
      t:=findmax(a[i]);
      if t  > max then max:=t;
    end;
end;

procedure PrintResult;
begin
  assign(output,fileout); rewrite(output);
  write(max);
  close(output)
end;

begin
  Init;
  Solve;
  PrintResult;
end.
