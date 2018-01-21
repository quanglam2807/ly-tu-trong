const fileinp = 'beads.inp';
      fileout = 'beads.out';
      maxN = 100000;

var n,max:longint;
    a,q:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    read(a[i]);
  close(input);
end;

procedure Check;
var l,r,count,i:longint;
begin
  l:=0;
  r:=0;
  count:=0;
  for i:=1 to n do
    begin
      if (a[i] = 1) and (l=0) and (r=0) then
        begin
          l:=i;
          r:=i;
          continue;
        end;
      if (a[i] = 1) and (a[i] >= a[l]) and (a[i] <= a[r]) then exit;
      if (a[i] = 1) and (a[i] < a[l]) then
        begin
          l:=i;
          inc(count);
          continue;
        end;
      if (a[i] = 1) and (a[i] > a[r]) then
        begin
          r:=i;
          inc(count);
          continue;
        end;
    end;
  if count > max then max:=count;
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
      Generate(i+1);
    end;
end;

procedure Analyse;
begin
  max:=0;
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
