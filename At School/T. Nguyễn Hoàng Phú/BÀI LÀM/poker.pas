const fileinp = 'poker.inp';
      fileout = 'poker.out';
      maxN = 100000;

var n,s:longint;
    a:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    readln(a[i]);
  close(input);
end;

procedure Analyse;
var i,j,min,c:longint;
begin
  s:=0;
  i:=1;
  repeat
    while a[i] = 0 do
      inc(i);
    c:=0;
    min:=maxN;
    for j:=i to n do
      begin
        if a[j] = 0 then break;
        if a[j] < min then min:=a[j];
        inc(c);
     end;
    for j:=i to i+c-1 do
      a[j]:=a[j] - min;
    s:=s + min;
  until i = n;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(s);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.