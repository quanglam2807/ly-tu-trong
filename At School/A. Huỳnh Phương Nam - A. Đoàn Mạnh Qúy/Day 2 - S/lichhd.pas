const fileinp = 'lichhd.inp';
      fileout = 'lichhd.out';

var n:longint;
    s,f:array[1..1000] of longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  n:=0;
  while not eof do
    begin
      inc(n);
      readln(s[n],f[n]);
    end;
  close(input);
end;

procedure AnalysePrint;
var min,min2,i,j,b,tmp:longint;
    free:array[1..1000] of boolean;
begin
  assign(output,fileout); rewrite(output);
  min:=maxlongint;
  min2:=maxlongint;
  fillchar(free,sizeof(free),true);
  for i:=1 to n do
    if (s[i] <= min) and (f[i] < min2) then
      begin
        min:=s[i];
        min2:=f[i];
        b:=i;
      end;
  free[b]:=false;
  writeln(s[b],' ',f[b]);
  for i:=1 to n do
    begin
      min:=maxlongint;
      min2:=maxlongint;
      for j:=1 to n do
        if (free[j]) and ((f[j] - s[j]) < min) and (s[j] >= f[b]) then
          begin
            min:=f[j] - s[j];
            tmp:=j;
         end;
      writeln(s[tmp],' ',f[tmp]);
      free[tmp]:=false;
      b:=tmp;
    end;
  close(output);
end;

begin
  Init;
  AnalysePrint;
end.
