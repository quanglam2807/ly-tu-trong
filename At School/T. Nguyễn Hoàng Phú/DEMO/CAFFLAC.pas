{
ID: nghoang4
PROG: calfflac
LANG: PASCAL
}
const fi = 'calfflac.in';
      fo = 'calfflac.out';
      maxN = 20001;

var a: array[1..maxN] of char;
    nl: array[1..maxN] of boolean;
    n, max, l, r, lmax, rmax: integer;

procedure Init;
begin
  assign(input,fi); reset(input);
  n:=0;
  fillchar(nl,sizeof(nl),false);
  while not eof do
    begin
      while not eoln do
        begin
          inc(n);
          read(a[n]);
        end;
      inc(n);
      a[n]:='.';
      nl[n]:=true;
      readln;
    end;
  close(input);
end;

function min2(a, b: integer): integer;
begin
  if a>b then min2:=b else min2:=a;
end;

procedure Solve;
var count, i: integer;
begin
  max:=0; lmax:=-1; rmax:=-1;
  for i:=1 to n-1 do
    begin
      l:=i-1; r:=i+1;
      if upcase(a[i]) in ['A'..'Z'] then count:=1 else count:=0;
      while true do
        begin
          while (l > 0) and (not (upcase(a[l]) in ['A'..'Z'])) do dec(l);
          while (r <= n) and (not (upcase(a[r]) in ['A'..'Z'])) do inc(r);
          if not ((l > 0) and (r <= n) and (r-l < 2000) and (upcase(a[l]) = upcase(a[r]))) then break;
          inc(count,2);
          dec(l);
          inc(r);
        end;
      if count > max then
        begin
          max:=count;
          lmax:=l+1;
          rmax:=r-1;
        end;
      l:=i; r:=i+1;
      count:=0;
      while true do
        begin
          while (l > 0) and (not (upcase(a[l]) in ['A'..'Z'])) do dec(l);
          while (r <= n) and (not (upcase(a[r]) in ['A'..'Z'])) do inc(r);
          if not ((l > 0) and (r <= n) and (r-l+1 < 2001) and (upcase(a[l]) = upcase(a[r]))) then break;
          inc(count,2);
          dec(l);
          inc(r);
        end;
      if count > max then
        begin
          max:=count;
          lmax:=l+1;
          rmax:=r-1;
        end;
    end;
end;

procedure PrintResult;
var i: integer;
begin
  assign(output,fo); rewrite(output);
  writeln(max);
  while not (upcase(a[lmax]) in ['A'..'Z']) do inc(lmax);
  while not (upcase(a[rmax]) in ['A'..'Z']) do dec(rmax);
  for i:=lmax to rmax do
    begin
      if nl[i] then writeln
      else write(a[i]);
    end;
  writeln;
  close(output);
end;

begin
  Init;
  Solve;
  PrintResult;
end.
