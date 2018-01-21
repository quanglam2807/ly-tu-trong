const fileinp = 'milktemp.in';
      fileout = 'milktemp.out';
      maxN = 20000;

type temp = record
              a,b:longint;
            end;


var n,x,y,z,max:longint;
    cow:array[1..maxN] of temp;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,x,y,z);
  for i:=1 to n do
    readln(cow[i].a,cow[i].b);
  close(input);
end;

procedure QSort(l,r:longint);
var i,j,p:longint;
    tmp:temp;
begin
  if l >= r then exit;
  i:=l;
  j:=r;
  p:=cow[(i+j) div 2].a;
  while i <= j do
    begin
      while cow[i].a < p do inc(i);
      while cow[j].a > p do dec(j);
      if i <= j then
        begin
          tmp:=cow[i];
          cow[i]:=cow[j];
          cow[j]:=tmp;
          inc(i);
          dec(j);
        end;
    end;
  QSort(l,j); QSort(i,r);
end;

procedure Analyse;
var sum,i,j:longint;
begin
  QSort(1,n);
  max:=0;
  for i:=cow[1].a to cow[n].b do
    begin
      sum:=0;
      for j:=1 to n do
        begin
          if (i >= cow[j].a) and (i <= cow[j].b) then
            inc(sum,y)
          else if (i < cow[j].a) then
            inc(sum,x)
          else
            inc(sum,z);
        end;
      if sum > max then max:=sum;
    end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(max);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.

