uses windows;

const fileinp = 'photo2.inp';
      fileout = 'photo2.out';
      maxM = 100000;
      maxN = 200000;

type st = record
           s,t:longint;
          end;

var a:array[1..maxM] of st;
    n,m,time,max:longint;
    q:array[1..maxN] of longint;

procedure Init;
var k:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  for k:=1 to m do
    readln(a[k].s,a[k].t);
  close(input);
end;

procedure PrintFail;
begin
  assign(output,fileout); rewrite(output);
  writeln(1);
  close(output);
  halt;
end;

procedure Check;
var i,j,t,count:longint;
begin
  for i:=1 to m do
    for j:=a[i].s to a[i].t do
      for t:=a[i].s to a[i].t do
        if (j <> t) and (q[j]=1) and (q[t] = 1) then
          exit;
  for i:=1 to m do
    begin
      count:=0;
      for j:=a[i].s to a[i].t do
        if q[j] = 1 then
          begin
            inc(count);
            if count > 1 then exit;
          end;
      if count = 0 then exit;
    end;
  count:=0;
  for i:=1 to n do
    if q[i] = 1 then
      inc(count);
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
      if gettickcount - time > 750 then PrintFail;
    end;
end;

procedure Analyse;
begin
  time:=gettickcount;
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
