const fileinp = 'bai2.inp';
      fileout = 'bai2.out';

var n,count:longint;
    a:array[1..1000] of integer;
    result:array[1..1000,1..1000] of integer;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

procedure Check;
var sum,i:longint;
begin
  sum:=1;
  for i:=2 to n do
    begin
      if a[i-1]=0 then sum:=sum-i;
      if a[i-1]=1 then sum:=sum+i;
    end;
  if sum = 0 then
    begin
      inc(count);
      for i:=1 to n-1 do result[count,i]:=a[i];
    end;
end;

procedure Generate(i:longint);
var j:longint;
begin
  for j:=0 to 1 do
    begin
      a[i]:=j;
      if (i = n-1) then Check
      else Generate(i+1);
    end;
end;

procedure Print;
var i,j:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  for i:=1 to count do
    begin
      write('1');
      for j:=2 to n do
        begin
          if result[i,j-1]=0 then write('-',j);
          if result[i,j-1]=1 then write('+',j);
        end;
      writeln;
    end;
  close(output);
end;

begin
  Init;
  Generate(1);
  Print;
end.