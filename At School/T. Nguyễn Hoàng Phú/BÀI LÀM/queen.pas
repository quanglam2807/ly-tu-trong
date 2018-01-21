const fileinp = 'queen.inp';
      fileout = 'queen.out';
      maxN = 1000;

var a:array[1..maxN,1..maxN] of char;
    row,col,cr1,cr2:array[1..maxN,1..maxN] of longint;
    m,n:longint;

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
  close(input);
end;

procedure CRow(i,j:longint);
var s,u,t,count:longint;
begin
  s:=j;
  count:=0;
  for u:=j-1 downto 1 do
    if a[i,u] <> '#' then
      begin
        s:=u;
        inc(count);
      end
    else
      break;
  t:=j;
  for u:=j+1 to n do
    if a[i,u] <> '#' then
      begin
        t:=u;
        inc(count);
      end
    else
      break;
  for u:=j downto s do row[i,u]:=count;
  for u:=j to t do row[i,u]:=count;
end;

procedure CCol(i,j:longint);
var s,u,t,count:longint;
begin
  s:=i;
  count:=0;
  for u:=i-1 downto 1 do
    if a[u,j] <> '#' then
      begin
        s:=u;
        inc(count);
      end
    else
      break;
  t:=i;
  for u:=i+1 to m do
    if a[u,j] <> '#' then
      begin
        t:=u;
        inc(count);
      end
    else
      break;
  for u:=i downto s do col[u,j]:=count;
  for u:=i to t do col[u,j]:=count;
end;

procedure CCr1(i,j:longint);
var x,y,sx,sy,tx,ty,count:longint;
begin
  x:=i-1;
  y:=j+1;
  count:=0;
  sx:=i;
  sy:=j;
  while (x > 0) and (y > 0) and (x <= m) and (y <= n) and (a[x,y] <> '#') do
    begin
      inc(count);
      sx:=x;
      sy:=y;
      dec(x); inc(y);
    end;
  x:=i+1;
  y:=j-1;
  tx:=i;
  ty:=j;
  while (x > 0) and (y > 0) and (x <= m) and (y <= n) and (a[x,y] <> '#') do
    begin
      inc(count);
      tx:=x;
      ty:=y;
      inc(x); dec(y);
    end;
  x:=sx; y:=sy;
  while (x <= i) do
    begin
      Cr1[x,y]:=count;
      inc(x); dec(y);
    end;
  x:=tx; y:=ty;
  while (x >= i) do
    begin
      Cr1[x,y]:=count;
      dec(x); inc(y);
    end;
end;

procedure CCr2(i,j:longint);
var x,y,sx,sy,tx,ty,count:longint;
begin
  x:=i-1;
  y:=j-1;
  count:=0;
  sx:=i;
  sy:=j;
  while (x > 0) and (y > 0) and (x <= m) and (y <= n) and (a[x,y] <> '#') do
    begin
      inc(count);
      sx:=x;
      sy:=y;
      dec(x); dec(y);
    end;
  x:=i+1;
  y:=j+1;
  tx:=i;
  ty:=j;
  while (x > 0) and (y > 0) and (x <= m) and (y <= n) and (a[x,y] <> '#') do
    begin
      inc(count);
      tx:=x;
      ty:=y;
      inc(x); inc(y);
    end;
  x:=sx; y:=sy;
  while (x <= i) do
    begin
      Cr2[x,y]:=count;
      inc(x); inc(y);
    end;
  x:=tx; y:=ty;
  while (x >= i) do
    begin
      Cr2[x,y]:=count;
      dec(x); dec(y);
    end;
end;

procedure Analyse;
var i,j:longint;
begin
  fillchar(row,sizeof(row),255);
  fillchar(col,sizeof(col),255);
  fillchar(cr1,sizeof(cr1),255);
  fillchar(cr2,sizeof(cr2),255);
  for i:=1 to m do
    for j:=1 to n do
      if a[i,j] <> '#' then
         begin
           if row[i,j] = -1 then CRow(i,j);
           if col[i,j] = -1 then CCol(i,j);
           if cr1[i,j] = -1 then CCr1(i,j);
           if cr2[i,j] = -1 then CCr2(i,j);
         end;
end;

procedure Print;
var i,j:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to m do
    begin
      for j:=1 to n do
        if a[i,j] <> '#' then write(row[i,j]+col[i,j]+cr1[i,j]+cr2[i,j]+1,' ')
        else write('0 ');
      writeln;
    end;
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
