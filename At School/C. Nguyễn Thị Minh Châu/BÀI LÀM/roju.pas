const fileinp = 'roju.inp';
      fileout = 'roju.out';
      maxK = 200;
      maxM = 20;
      maxN = 60;

var m,n,xx,yy,z,t,k:longint;
    q,res:array[1..maxK] of longint;
    r:array[1..maxK] of char;
    a:array[1..maxM,1..maxN] of char;
    x,y:array[1..2] of longint;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(m,n);
  for i:=1 to m do
    begin
      for j:=1 to n do read(a[i,j]);
      readln;
    end;
  readln(xx,yy,z,t);
  readln(k);
  for i:=1 to k do read(r[i]);
  close(input);
end;

procedure Next(i:longint;s:char);
begin
  if s = 'E' then
    inc(y[i]);
  if s = 'W' then
    dec(y[i]);
  if s = 'N' then
    dec(x[i]);
  if s=  'S' then
    inc(x[i]);
end;

procedure Back(i:longint;s:char);
begin
  if s = 'E' then
    dec(y[i]);
  if s = 'W' then
    inc(y[i]);
  if s = 'N' then
    inc(x[i]);
  if s=  'S' then
    dec(x[i]);
end;

function OK:boolean;
begin
  if (x[1] > m) or (x[2] > m) or (y[1] > n) or (y[2] > n) or
     (x[1] < 1) or (x[2] < 1) or (y[1] < 1) or (y[2] < 1) then
    exit(false);
  if (a[x[1],y[1]]='1') then exit(false);
  if (a[x[2],y[2]]='1') then exit(false);
  exit(true);
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to k do
    begin
      if q[i] = 1 then write('R');
      if q[i] = 2 then write('J');
    end;
  close(output);
  halt;
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > k then
    begin
      if (x[1]=xx) and (y[1]=yy) and (x[2]=z) and (y[2]=t) then Print;
      exit;
    end;
  for j:=1 to 2 do
      begin
        q[i]:=j;
        Next(j,r[i]);
        if not OK then
          begin
            Back(j,r[i]);
            continue;
          end;
        Generate(i+1);
        Back(j,r[i]);
      end;
end;

procedure Analyse;
begin
  x[1]:=1;
  y[1]:=1;
  x[2]:=m;
  y[2]:=n;
  Generate(1);
end;

begin
  Init;
  Analyse;
end.