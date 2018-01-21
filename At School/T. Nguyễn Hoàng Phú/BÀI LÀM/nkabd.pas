const fileinp = 'nkabd.inp';
      fileout = 'nkabd.out';
      maxN = 1000000;

var l,r,count,cf:longint;
    f,ff:array[1..maxN] of longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(l,r);
  close(input);
end;

procedure Analyse;
var i,j:longint;
begin
  fillchar(f,sizeof(f),0);
  for i:=1 to r do f[i]:=1;
  for i:=2 to r do
    begin
      j:=2*i;
      while j <= r do
        begin
          f[j]:=f[j]+i;
          j:=j+i;
        end;
    end;
  count:=0;
  for i:=l to r do
    if f[i] > i then
      inc(count);
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
