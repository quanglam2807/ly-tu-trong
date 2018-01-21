const fileinp = 'MSEQ.inp';
      fileout = 'MSEQ.out';
      maxN = 100000;

var n,m,max,c:longint;
    a,q:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  for i:=1 to n do
    read(a[i]);
  close(input);
end;

procedure Check;
var i,j:longint;
begin
  for i:=1 to n-1 do
    for j:=i+1 to n do
       if (q[i]=1) and (q[j]=1) and ((a[i] + a[j]) mod m = 0) then
         exit;
  if c > max then max:=c;
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > n then
    begin
      Check;
      exit;
    end;
  for j:=0 to 1 do
    begin
      q[i]:=j;
      if j = 1 then inc(c);
      Generate(i+1);
      if j = 1 then dec(c);
    end;
end;

procedure Analyse;
begin
  max:=0;
  c:=0;
  Generate(1);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(max);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.