const fileinp = 'clan.inp';
      fileout = 'clan.out';

var n,i,count,x,max:longint;
    a:array[1..100000] of longint;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n);
  max:=0;
  for i:=1 to n do
    begin
      readln(x);
      inc(a[x]);
      if x > max then max:=x;
    end;
  count:=0;
  for i:=1 to max do
    if a[i] > 0 then
      count:=count + a[i] div i;
  writeln(count);
  close(input); close(output);
end.