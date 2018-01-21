const fileinp = 'prize.inp';
      fileout = 'prize.out';

var n,sum:longint;
    a:array[1..100000] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  close(input);
end;

procedure Analyse;
var i,min:longint;
begin
  min:=maxlongint;
  sum:=0;
  for i:=1 to n do
    begin
      if a[i] < min then
        min:=a[i];
      sum:=sum + a[i];
    end;
  sum:=sum - min;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(sum);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
