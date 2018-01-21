uses math;

const fileinp = 'maxprod.inp';
      fileout = 'maxprod.out';

var kq:int64;
    n:longint;
    a:array[1..100000] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  close(input);
end;

procedure Analyse;
var min1,min2,max1,max2:longint;
    i:longint;
begin
  min1:=maxlongint;
  min2:=maxlongint;
  max1:=-maxlongint;
  max2:=-maxlongint;
  for i:=1 to n do
    begin
      if a[i] > max1 then
        begin
          max2:=max1;
          max1:=a[i];
        end
      else if a[i] > max2 then
        max2:=a[i];
      if a[i] < min1 then
        begin
          min2:=min1;
          min1:=a[i];
        end
      else if a[i] < min2 then
        min2:=a[i];
    end;
  kq:=math.max(int64(min1)*min2,int64(max1)*max2);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(kq);
  close(output);
end;

begin
   Init;
   Analyse;
   Print;
end.