uses math;

const fileinp = 'cowgirl.inp';
      fileout = 'cowgirl.out';

var m,n,count,res:longint;
    s:array[1..6] of longint;
    q:array[1..6] of longint;
    c:array[1..64] of longint;
    f:array[0..6,0..126] of longint;

procedure Init;
begin
  readln(m,n);
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

function Sum(i,x:longint):longint;
var k:longint;
begin
  Sum:=0;
  for k:=1 to m do
    if (x shr k) and 1 = 1 then
      Sum:=Sum + 1;
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
  s[1]:=2;
  for i:=2 to m-1 do
    s[i]:=s[i-1]*2;
  count:=0;
  Generate(1);
  fillchar(f,sizeof(f),0);
  for i:=1 to n do
    for j:=1 to count do
      for k:=1 to count do
        if OK(c[j],c[k]) then
          f[i,c[j]]:=math.max(f[i,c[j]],f[i-1,c[k]] + sum(i,c[j]));
  res:=0;
  for i:=1 to n do
    for j:=1 to count do
      if f[i,c[j]] > res then
        res:=f[i,c[j]];
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