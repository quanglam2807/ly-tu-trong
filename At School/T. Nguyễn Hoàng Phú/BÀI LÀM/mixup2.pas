const fileinp = 'mixup2.inp';
      fileout = 'mixup2.out';
      maxN = 16;

var n,k,count:longint;
    a,q:array[1..maxN] of longint;
    free:array[1..maxN] of boolean;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,k);
  for i:=1 to n do
    readln(a[i]);
  close(input);
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > n then
    begin
      inc(count);
      exit;
    end;
  for j:=1 to n do
    if free[j] and (abs(a[j] - q[i-1]) > k) then
      begin
        free[j]:=false;
        q[i]:=a[j];
        Generate(i+1);
        free[j]:=true;
      end;
end;

procedure Analyse;
var i:longint;
begin
  count:=0;
  for i:=1 to n do
    begin
      fillchar(free,sizeof(free),true);
      free[i]:=false;
      q[1]:=a[i];
      Generate(2);
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