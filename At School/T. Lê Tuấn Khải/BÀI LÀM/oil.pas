uses windows;

const fileinp = 'oil.inp';
      fileout = 'oil.out';
      maxN = 1500;

var m,n,k,s,max,time:longint;
    a,d:array[1..maxN,1..maxN] of longint;
    free:array[1..maxN,1..maxN] of boolean;
    qx,qy:array[1..maxN] of longint;
    aa:array[1..maxN*2] of longint;

procedure Init;
var i,j:longint;
begin
  time:=gettickcount;
  assign(input,fileinp); reset(input);
  readln(m,n,k);
  for i:=1 to n do
    begin
      for j:=1 to n do read(a[i,j]);
      readln;
    end;
  close(input);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(max);
  close(output);
  halt;
end;

procedure TurnFree(i,j:longint);
var i2,j2:longint;
begin
  for i2:=i to i+k-1 do
    for j2:=j to j+k-1 do
      begin
      if (i2 > n) or (j2 > n) then
        break
      else
        free[i2,j2]:=not free[i2,j2];
      end;
end;

function OK(i,j:longint):boolean;
var i2,j2:longint;
begin
  for i2:=i to i+k-1 do
    for j2:=j to j+k-1 do
      begin
        if (i2 > n) or (j2 > n) then
          break;
        if free[i2,j2] = false then exit(false);
      end;
  exit(true);
end;

procedure Generate(x:longint);
var i2,j2,i,j,ii,jj:longint;
begin
  if x > 3 then
    begin
      if s > max then max:=s;
      exit;
    end;
  for i:=1 to n do
    for j:=1 to n do
       if OK(i,j) then
         begin
           qx[x]:=i;
           qy[x]:=j;
           if gettickcount - time > 500 then Print;
           inc(s,d[i,j]);
           TurnFree(i,j);
           Generate(x+1);
           dec(s,d[i,j]);
           TurnFree(i,j);
         end;
end;



procedure Analyse;
var i,j,i2,j2:longint;
begin
  for i:=1 to n do
    for j:=1 to n do
      begin
        d[i,j]:=0;
        for i2:=i to i+k-1 do
          for j2:=j to j+k-1 do
            if (i2 > n) or (j2 > n) then break
            else
              inc(d[i,j],a[i2,j2]);
      end;
  fillchar(free,sizeof(free),true);
  max:=0;
  s:=0;
end;

begin
  Init;
  Analyse;
  Generate(1);
  Print;
end.
