uses windows;
const fileinp = 'ksubset.inp';
      fileout = 'ksubset.out';
      maxN = 10;

var n,k,time:longint;
    a,s,f:array[0..maxN] of longint;
    r:array[0..maxN] of int64;

procedure Init;
var i:longint;
begin
  time:=gettickcount;
  assign(input,fileinp); reset(input);
  readln(n,k);
  for i:=1 to n do read(a[i]);
  readln;
  for i:=1 to n do read(s[i]);
  close(input);
end;

procedure Print(str:string);
begin
  assign(output,fileout); rewrite(output);
  writeln(str);
  close(output);
  halt;
end;

function OK:boolean;
var i:longint;
begin
  for i:=1 to k do
    if (r[i] <> s[i]) or (f[i] = 0) then
      exit(false);
  exit(true);
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > n then
    begin
      if (OK) then Print('YES');
      exit;
    end;
  for j:=1 to k do
    begin
      if gettickcount - time > 900 then Print('NO');
      inc(f[j]);
      r[j]:=r[j] + a[i];
      Generate(i+1);
      dec(f[j]);
      r[j]:=r[j] - a[i];
    end;
end;

begin
  Init;
  Generate(1);
  Print('NO');
end.
