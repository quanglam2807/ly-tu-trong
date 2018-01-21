const fileinp = 'cowgirl.inp';
      fileout = 'cowgirl.out';

var m,n,count,res:longint;
    s:array[0..6] of longint;
    q:array[1..6] of longint;
    c:array[1..64] of longint;
    f:array[0..30,0..126] of longint;

procedure Init;
var tmp:longint;
begin
  readln(m,n);
  if (m > n) then
    begin
      tmp:=m;
      m:=n;
      n:=tmp;
    end;
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > m then
    begin
      inc(count);
      c[count]:=0;
      for j:=1 to m do
        if q[j] = 1 then
          inc(c[count],s[j]);
      exit;
    end;
  for j:=0 to 1 do
    begin
      q[i]:=j;
      Generate(i+1);
    end;
end;

function OK(x,y:longint):boolean;
var k:longint;
begin
  for k:=1 to m-1 do
    if (((x shr k) and 1)=((y shr k) and 1))
    and (((x shr (k-1)) and 1)=((y shr (k-1)) and 1))
    and (((x shr k) and 1)=((x shr (k-1)) and 1)) then
      exit(false);
  exit(true);
end;

procedure Analyse;
var i,j,k:longint;
begin
  s[0]:=0;
  s[1]:=1;
  s[2]:=2;
  s[3]:=4;
  s[4]:=8;
  s[5]:=16;
  s[6]:=32;
  count:=0;
  Generate(1);
  fillchar(f,sizeof(f),0);
  for i:=1 to count do
    f[1,c[i]]:=1;
  for i:=2 to n do
    for j:=1 to count do
      for k:=1 to count do
        if OK(c[j],c[k]) then
          f[i,c[j]]:=f[i,c[j]] + f[i-1,c[k]];
  res:=0;
  for j:=1 to count do
      res:=res + f[n,c[j]];
end;

procedure Print;
begin
  writeln(res);
end;

procedure Main;
var t,i:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(t);
  for i:=1 to t do
    begin
      Init;
      Analyse;
      Print;
    end;
  close(input); close(output);
end;

begin
  Main;
end.
