const fileinp = 'screen.inp';
      fileout = 'screen.out';
      maxK = 10000000;

var n,m,k:longint;
    maxX,maxY,minX,minY:array[0..maxK] of longint;

procedure INit;
var i,j,t:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m,k);
  for i:=0 to k do
    begin
      maxX[i]:=-maxlongint;
      maxY[i]:=-maxlongint;
      minX[i]:=maxlongint;
      minY[i]:=maxlongint;
    end;
  for i:=n downto 1 do
    begin
      for j:=1 to m do
        begin
          read(t);
          if i > maxX[t] then maxX[t]:=i;
          if i < minX[t] then minX[t]:=i;
          if j > maxY[t] then maxY[t]:=j;
          if j < minY[t] then minY[t]:=j;
        end;
    end;
  close(input);
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to k do
    writeln(minY[i]-1,' ',minX[i]-1,' ',maxY[i],' ',maxX[i]);
  close(output);
end;

begin
  Init;
  Print;
end.