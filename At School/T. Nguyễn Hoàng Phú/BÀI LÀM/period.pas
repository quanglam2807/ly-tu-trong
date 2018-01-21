const fileinp = 'period.inp';
      fileout = 'period.out';
      maxN = 5000000;


var n,delta,p,q,m:qword;
    a:array[0..maxN*2] of int64;
    queue:array[0..maxN*2] of longint;
    min:int64;


procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,delta);
  readln(p,q,m);
  for i:=1 to n do
    a[i]:=((p*i) mod m + q);
  for i:=n+1 to 2*n-1 do
    a[i]:=a[i-n] + i*delta;
  for i:=1 to n do
    a[i]:=a[i] + delta*i;
  close(input);
end;

procedure Analyse;
var l,f,i:longint;
begin
  l:=1;
  f:=1;
  queue[1]:=1;
  for i:=2 to 2*n-1 do
    begin
      if (i-queue[f]+1 > n) then inc(f);
      while (l >= f) and (a[i] >= a[queue[l]]) do
        dec(l);
      inc(l);
      queue[l]:=i;
      if i >= n then
        begin
          if i-n+1 = 1 then
            min:=a[queue[f]] - (i-n)*delta
          else if a[queue[f]] - (i-n)*delta < min then
            min:=a[queue[f]] - (i-n)*delta;
        end;
    end;
end;



procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(min);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
