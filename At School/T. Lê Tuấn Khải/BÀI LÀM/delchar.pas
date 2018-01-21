uses windows;

const fileinp = 'delchar.inp';
      fileout = 'delchar.out';
      maxN = 1500;

var w,lx,ly,min,l,time:longint;
    x,y:array[1..maxN] of char;
    q:array[1..maxN*2] of longint;
    res:array[1..maxN] of char;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  if l = 0 then writeln('No solution')
  else
    begin
      for i:=1 to l do
        write(res[i]);
    end;
  close(output);
  halt;
end;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(w);
  lx:=0;
  while not eoln do
    begin
      inc(lx);
      read(x[lx]);
    end;
  readln;
  ly:=0;
  while not eoln do
    begin
      inc(ly);
      read(y[ly]);
    end;
  time:=gettickcount;
  close(input);
end;

procedure Check;
var count,c,i,lxt,lyt:longint;
    xt,yt:array[1..maxN] of char;
begin
  count:=0;
  c:=0;
  for i:=1 to lx do
    begin
      if q[i] = 1 then
        begin
          inc(c);
          inc(count);
        end;
      if q[i] = 0 then c:=0;
      if c > w then exit;
    end;
  if count > min then exit;
  c:=0;
  for i:=lx+1 to lx+ly do
    begin
      if q[i] = 1 then
        begin
          inc(c);
          inc(count);
        end;
      if q[i] = 0 then c:=0;
      if c > w then exit;
    end;
  if count > min then exit;
  lxt:=0;
  for i:=1 to lx do
    if q[i] = 0 then
      begin
        inc(lxt);
        xt[lxt]:=x[i];
      end;
  lyt:=0;
  for i:=lx+1 to lx+ly do
    if q[i] = 0 then
      begin
        inc(lyt);
        yt[lyt]:=y[i-lx];
      end;
  if lxt <> lyt then exit;
  for i:=1 to lxt do
    if xt[i] <> yt[i] then
      exit;
  min:=count;
  l:=lxt;
  res:=xt;
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > lx+ly then
    begin
      Check;
      exit;
    end;
  for j:=0 to 1 do
    begin
      q[i]:=j;
      if gettickcount - time > 800 then Print;
      Generate(i+1);
    end;
end;

procedure Analyse;
var i:longint;
begin
  min:=maxlongint;
  l:=0;
  Generate(1);
end;

begin
  Init;
  Analyse;
  Print;
end.


