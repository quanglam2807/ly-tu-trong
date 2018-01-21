const fileinp = '10684.inp';
      fileout = '10684.out';

var n:longint;
    a:array[1..100000] of longint;

procedure Analyse;
var max,i,j,sum:longint;
begin
  max:=-maxlongint;
  for i:=1 to n do
    begin
      sum:=0;
      for j:=i to n do
        begin
          sum:=sum+a[j];
          if sum > max then max:=sum;
        end;
    end;
  if max > 0 then writeln('The maximum winning streak is ',max,'.')
  else writeln('Losing streak.');
end;

procedure Main;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  while not eof do
    begin
      readln(n);
      if n = 0 then exit;
      i:=0;
      while i < n do
        begin
          while not eoln do
            begin
              inc(i);
              read(a[i]);
            end;
          readln;
        end;
      Analyse;
    end;
  close(input); close(output);
end;


begin
  Main;
end.
