const fileinp = 'hamz.inp';
      fileout = 'hamz.out';
      maxN = 1000000;

var s:string;
    z:array[1..maxN] of longint;
    n,m,count:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  readln(s);
  close(input);
end;

function min(a,b:longint):longint;
begin
  if a < b then exit(a)
  else exit(b);
end;

procedure Analyse;
var r,l,i:longint;
begin
  fillchar(z,sizeof(z),0);
  r:=1;
  l:=1;
  z[1]:=0;
  count:=0;
  for i:=n+2 to n+m+1 do
    begin
      if i<r then
        z[i]:=min(z[i-l+1],r-i+1);
      while (i+z[i] <= n+m+1) and (s[i+z[i]]=s[z[i]+1]) do
        inc(z[i]);
      if i+z[i]-1>r then
        begin
          r:=i+z[i]-1;
          l:=i;
        end;
      if z[i] = n then inc(count);
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
