const fileinp = 'coinchange.inp';
      fileout = 'coinchange.out';

var t,max,m,n:longint;
    a,s:array[0..10000] of longint;
    w:array[0..10000,0..10000] of longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  while not eof do
    begin
      readln(n);
      writeln(w[n,5]);
    end;
  close(input); close(output);
end;

procedure Analyse;
var i,j:longint;
begin
  a[0]:=1;
  a[1]:=1;
  m:=5;
  s[1]:=1;
  s[2]:=5;
  s[3]:=10;
  s[4]:=25;
  s[5]:=50;
  for i:=0 to 7489 do
    for j:=0 to m do
      begin
        if i= 0 then w[i,j]:=1
        else if j=0 then w[i,j]:=0
        else if s[j] > i then w[i,j]:=w[i,j-1]
        else w[i,j]:=w[i-s[j],j]+w[i,j-1];
      end;
  {
  for i:=0 to 5 do
    for j:=2 to 7489 do
      if (j>=s[i]) then
        begin
          a[j]:=a[j]+a[j-s[i]];
        end; }
end;

begin
  Analyse;
  Init;
end.