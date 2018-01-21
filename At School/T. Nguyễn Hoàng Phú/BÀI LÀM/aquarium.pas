const fileinp = 'aquarium.inp';
      fileout = 'aquarium.out';
      maxN = 100000;

var res:extended;
    m,h,n,maxY:longint;
    y,k:array[0..maxN+1] of longint;
    save:array[0..maxN] of extended;

procedure Analyse(x:longint);
var i,max,min:longint;
    t:extended;
begin
  res:=0;
  for i:=1 to m do
    begin
      if y[i] >= y[i+1] then
        begin
          max:=y[i];
          min:=y[i+1];
        end
      else
        begin
          max:=y[i+1];
          min:=y[i];
        end;
      if (min < x) and (max <= x) then
        begin
          res:=res + abs(max - x);
          res:=res + (max-min)/2;
        end;
      if (min < x) and (max > x) then
        begin
          t:=(max - min) / (x - min);
          res:=res + ((x - min)*(1/t)/2);
        end;
    end;
  save[x]:=res;
end;

procedure Main;
var i,x:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(m,h);
  maxY := 0;
  for i:=1 to m+1 do
    begin
      read(y[i]);
      if maxY < y[i] then maxY:=y[i];
    end;
  readln;
  readln(n);
  for i:=1 to n do
    begin
      readln(k[i]);
      if k[i] > maxY then
        res:=save[k[i]-1] + m
      else Analyse(k[i]);
      writeln(res:0:4);
    end;
  close(input); close(output);
end;

begin
  Main;
end.
