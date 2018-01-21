const fileinp = 'Bai1.inp';
      fileout = 'Bai1.out';

var n,count:longint;
    free:boolean;
    a:array[1..1000] of integer;
    result:array[1..1000,1..1000] of integer;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

procedure WriteResult;
var i:longint;
begin
  inc(count);
  for i:=1 to n do result[count,i]:=a[i];
end;

procedure Generate(i:longint);
var j:longint;
begin
  for j:=0 to 1 do
    begin
      if (j=0) and (free=false) then continue;
      a[i]:=j;
      if (j=1) and (free=false) then free:=true;
      if j = 0 then free:=false;
      if i = n then WriteResult
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
      for j:=1 to n do write(result[i,j],' ');
      writeln;
    end;
  close(output);
end;

begin
  Init;
  free:=true;
  count:=0;
  Generate(1);
  Print;
end.