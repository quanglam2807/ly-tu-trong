const fileinp = 'range.inp';
      fileout = 'range.out';
      maxN = 10000;

var n,h,count:longint;
    a:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,h);
  for i:=1 to n do
    readln(a[i]);
  close(input);
end;

procedure Analyse;
var i,j,k,w,x:longint;
    q:array[1..maxN] of longint;
begin
  count:=0;
  for i:=1 to n-1 do
    begin
      k:=1;
      q[k]:=i;
      for j:=i+1 to n do
        begin
          for w:=1 to k do
            if abs(a[j] - a[q[w]]) <= h then
              begin
                inc(k);
                q[k]:=j;
                inc(count);
              end;
        end;
    end;
end;

procedure Print;
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
