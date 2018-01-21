const fileinp = 'photo1.inp';
      fileout = 'photo1.out';
      maxK = 1000;

type xy = record
            x,y:longint;
          end;

var a:array[1..maxK] of xy;
    n,k,count:longint;

procedure Init;
var i,tmp:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,k);
  for i:=1 to k do
    begin
      readln(a[i].x,a[i].y);
      if a[i].x > a[i].y then
        begin
          tmp:=a[i].x;
          a[i].x:=a[i].y;
          a[i].y:=tmp;
        end;
    end;
  close(input);
end;

procedure Sort;
var tmp:xy;
    i,j:longint;
begin
  for i:=1 to k-1 do
    for j:=i+1 to k do
      if a[i].y > a[j].y then
        begin
          tmp:=a[i];
          a[i]:=a[j];
          a[j]:=tmp;
        end;
end;

procedure Analyse;
var t,i:longint;
begin
  count:=1;
  t:=1;
  for i:=1 to k do
    if a[i].x >= t then
      begin
        inc(count);
        t:=a[i].y;
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
  Sort;
  Analyse;
  Print;
end.
