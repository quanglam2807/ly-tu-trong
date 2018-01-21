const fileinp = 'queue.inp';
      fileout = 'queue.out';

var t,count,x:longint;
    n,f,e,a:array[1..1000] of longint;
    free:array[1..1000] of boolean;


procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(t);
  for i:=1 to t do readln(n[i],f[i],e[i]);
  close(input);
  fillchar(free,sizeof(free),true);
end;

procedure Check;
var front,fend,i,tmp:longint;
begin
  front:=1;
  fend:=1;
  tmp:=a[1];
  for i:=2 to n[x] do
    begin
      if a[i] > tmp then
        begin
          inc(front);
          tmp:=a[i];
        end;
    end;
  tmp:=a[n[x]];
  for i:=n[x]-1 downto 1 do
    begin
      if tmp < a[i] then
         begin
           inc(fend);
           tmp:=a[i];
         end;
    end;
  if (front =  f[x]) and (fend = e[x]) then
    begin
      inc(count);  {
      for i:=1 to n[x] do write(a[i],' ');
      writeln;      }
    end;
end;

procedure Generate(i:longint);
var j:longint;
begin
  for j:=n[x] downto 1 do
    if free[j] then
      begin
        a[i]:=j;
        free[j]:=false;
        if i=n[x] then Check
        else Generate(i+1);
        free[j]:=true;
      end;
end;

procedure AnalysePrint;
begin
  assign(output,fileout); rewrite(output);
  for x:=1 to t do
    begin
      count:=0;
      Generate(1);
      writeln(count);
    end;
  close(output);
end;

begin
  Init;
  AnalysePrint;
end.
