const fileinp = 'chiakeo.inp';
      fileout = 'chiakeo.out';
      maxN = 100;

var n,m,sum,max,count:longint;
    free:array[1..maxN] of boolean;
    q:array[1..maxN] of longint;


procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  close(input);
end;

procedure Generate(x:longint);
var i:longint;
begin
  if x > m then
    begin
      if sum = n then
        begin
          inc(count);
          write(n,' --> ');
          for i:=1 to m do write('( ',q[i],') ');
          writeln;
        end;
      exit;
    end;
  for i:=1 to max do
    if (free[i]) and (sum + i <= n) and ((x=1) or (i > q[x-1])) then
      begin
        q[x]:=i;
        free[i]:=false;
        sum:=sum + i;
        Generate(x+1);
        free[i]:=true;
        sum:=sum - i;
      end;
end;

procedure Analyse;
begin
  assign(output,fileout); rewrite(output);
  max:=n - m + 1;
  count:=0;
  fillchar(free,sizeof(free),true);
  sum:=0;
  Generate(1);
  if count = 0 then
    writeln('khong chia duoc')
  else
    writeln('chia duoc ',count,' cach');
  close(output);
end;

begin
  Init;
  Analyse;
end.