const fileinp = 'permutation.inp';
      fileout = 'permutation.out';
      maxN = 20;

var n,loc1:longint;
    y,kq,count:int64;
    a,q:array[1..maxN] of longint;
    free:array[1..maxN] of boolean;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  n:=0;
  while not eoln do
    begin
      inc(n);
      read(a[n]);
    end;
  readln;
  readln(y);
  close(input);
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(kq);
  for i:=1 to n do write(q[i],' ');
  close(output);
  halt;
end;

procedure IncCount(t:longint);
var i:longint;
    s:int64;
begin
  s:=1;
  for i:=n-t downto 1 do
    s:=s*i;
  count:=count + s;
end;

procedure IncCount2(var count:int64; t,c:longint);
var i:longint;
    s:int64;
begin
  s:=1;
  for i:=n-t downto 1 do
    s:=s*i;
  count:=count + s*c;
end;

function NewCount(t:longint):int64;
var i:longint;
    s:int64;
begin
  s:=1;
  for i:=n-t downto 1 do
    s:=s*i;
  exit(count + s);
end;


procedure Generate(i:longint);
var j:longint;
begin
  if i > n then
    begin
      inc(count);
      if count = y then Print;
    end;
  for j:=1 to n do
    if free[j] then
      begin
        if NewCount(i) < y then
          begin
            IncCount(i);
            continue;
          end;
        q[i]:=j;
        free[j]:=false;
        Generate(i+1);
        free[j]:=true;
      end;
end;

procedure FindSC1;
var i,c,j:longint;
begin
  fillchar(free,sizeof(free),true);
  kq:=1;
  for i:=1 to n-1 do
     begin
        c:=0;
        for j:=1 to a[i]-1 do
          if free[j] then inc(c);
        free[a[i]]:=false;
        if c > 0 then
          IncCount2(kq,i,c) ;
      end;
end;

procedure FindSC2;
var i:longint;
begin
  fillchar(free,sizeof(free),true);
  count:=0;
  Generate(1);
end;

begin
  Init;
  FindSC1;
  FindSC2;
  Print;
end.
