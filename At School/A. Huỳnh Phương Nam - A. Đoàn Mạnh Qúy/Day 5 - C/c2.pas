const fileinp = 'coinchange.inp';
      fileout = 'coinchange.out';

var t,max,m,n:longint;
    a,s:array[0..100000] of longint;
    w:array[0..10000,0..10000] of longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  max:=0;
  t:=0;
  while not eof do
    begin
      inc(t);
      readln(a[t]);
      if a[t] > max then max:=a[t];
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
  for i:=0 to 6489 do
    for j:=0 to m do
      begin
        if i= 0 then w[i,j]:=1
        else if j=0 then w[i,j]:=0
        else if s[j] > i then w[i,j]:=w[i,j-1]
        else w[i,j]:=w[i-s[j],j]+w[i,j-1];
      end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to t do writeln(w[a[i],5]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
