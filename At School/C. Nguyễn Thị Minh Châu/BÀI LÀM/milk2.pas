{
ID: nhutqua1
PROG: milk2
LANG: PASCAL
}

const fileinp = 'milk2.in';
      fileout = 'milk2.out';

var n,max1,max2:longint;
    s,e:array[1..5000] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    readln(s[i],e[i]);
  close(input);
end;

procedure Sort;
var i,j,t1,t2:longint;
begin
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if s[i] > s[j] then
        begin
          t1:=s[i];
          t2:=e[i];
          s[i]:=s[j];
          e[i]:=e[j];
          s[j]:=t1;
          e[j]:=t2;
        end;
end;

procedure Analyse;
var i:longint;
begin
  max1:=e[1] - s[1];
  max2:=0;
  for i:=2 to n do
    begin
      if (s[i] <= e[i-1]) then
        begin
          s[i]:=s[i-1];
          if e[i-1] > e[i] then e[i]:=e[i-1];
          if (e[i] - s[i] > max1) then max1:=e[i]-s[i];
        end;
      if (s[i] > e[i-1]) then
        begin
          if s[i] - e[i-1] > max2 then max2:=s[i]-e[i-1];
        end;
    end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(max1,' ',max2);
  close(output);
end;

begin
  Init;
  Sort;
  Analyse;
  Print;
end.
