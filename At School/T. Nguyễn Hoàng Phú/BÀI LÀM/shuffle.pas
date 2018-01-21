const fileinp = 'shuffle.inp';
      fileout = 'shuffle.out';
      maxN = 100000;

var p,d,a,b,xx,yy:array[1..maxN] of longint;
    n,m,q:longint;
    f:array[1..maxN] of boolean;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m,q);
  for i:=1 to m do
    readln(p[i]);
  for i:=1 to q do
    readln(d[i]);
  close(input);
end;

procedure Analyse;
var i,j,c,u,t,tmp,count:longint;
begin
  for i:=1 to n do a[i]:=i;
  count:=n;
  for i:=1 to n do
    begin
      c:=0;
      for j:=i to n do
        begin
          inc(c);
          b[c]:=a[j];
          if c = m then break;
        end;
      if c < m then
        begin
          yy[count]:=b[1];
          dec(count);
          continue;
        end;
      for t:=1 to c do
        xx[p[t]]:=b[t];
      yy[count]:=xx[1];
      dec(count);
      for t:=2 to c do
        a[i+t-1]:=xx[t];
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to q do
    writeln(yy[d[i]]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
