const fileinp='xauabc.inp';
      fileout='xauabc.out';
      maxN=10000;

var n,minc:longint;
    x,s:array [1..maxN] of char;
    t:array [0..maxN] of longint;

procedure init;
var i:longint;
begin
  assign(input,fileinp);reset(input);
  readln(n);
  close(input);
end;

Function Check1(i,j:longint):boolean;
var l,k:longint;
begin
  l:=i-j;
  for k:=0 to j-1 do
    if x[i-k]<>x[l-k] then  exit(false);
  exit(true);
end;

Function Check(i:longint):boolean;
var j:longint;
begin
   for j:=1 to i div 2 do
     if check1(i,j) then exit(false);
   exit(true);
end;

Procedure Resulting;
var i:longint;
begin
  minc:=t[n];
  for i:=1 to n do s[i]:=x[i];
end;

Procedure Processing(i:longint);
var j:char;
begin
  for j:='A' to 'C' do
    begin
      x[i]:=j;
      if check (i) then
        begin
          if j='C' then t[i]:=t[i-1]+1
          else t[i]:=t[i-1];
          if t[i]+(n-i) div 4<minc then
            if i=n then Resulting
            else Processing(i+1);
        end;
    end;
end;

Procedure Analyse;
begin
  t[0]:=0;
  minc:=n;
  Processing(1);
end;

Procedure Print;
var i:longint;
begin
  assign(output,fileout);rewrite(output);
  for i:=1 to n do write(s[i]);
  writeln;
  writeln(minc);
  close(output);
end;

begin
  init;
  analyse;
  print;
end.
