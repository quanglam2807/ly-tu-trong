uses math;

const maxN = 200;
      fileinp = 'restore2.inp';
      fileout = 'restore2.out';

var f:array[1..maxN+1,0..maxN,0..maxN] of int64;
    s:string;
    k:longint;

function Tinh(i,dem,bac:longint):int64;
var c:int64;
begin
  if f[i,dem,bac]>-1 then exit(f[i,dem,bac]);
  if i > length(s) then exit(ord((dem=0) and (bac=k)));
  c:=0;
  if s[i] <> ')' then
    c:=c + tinh(i+1,dem+1,math.max(dem+1,bac));
  if (dem > 0) and (s[i] <> '(') then
    c:=c + tinh(i+1,dem-1,bac);
  f[i,dem,bac]:=c;
  exit(C);
end;

begin
  assign(input,fileinp); reset(input);
  readln(k);
  readln(s);
  close(input);
  fillchar(f,sizeof(f),255);
  assign(output,fileout); rewrite(output);
  writeln(Tinh(1,0,0));
  close(output);
end.
