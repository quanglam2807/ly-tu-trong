const fileinp = 'mine.inp';
      fileout = 'mine.out';
      maxN = 80;
      dx:array[1..4] of longint = (-1,1,0,0);
      dy:array[1..4] of longint = (0,0,-1,1);

var n,m:longint;
    a,q:array[1..maxN,1..maxN] of longint;


procedure Init;
var i,j:longint;
    c:char;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  for i:=1 to n do
    begin
      for j:=1 to m do
        begin
          read(c);
          a[i,j]:=ord(c) - 60;
        end;
      readln;
    end;
  close(input);
end;

function OK:boolean;
var i,j,k,count:longint;
begin
  for i:=1 to n do
    for j:=1 to m do
      begin
        count:=0;
        for k:=1 to 4 do
          if (i+dx[k] > 0) and (i+dy[k] < n)
          and (j+dy[k] > 0) and (j+dy[k] < m)
          and (q[i+dx[k],j+dy[k]]=1) then
            inc(count);
        if a[i,j] <> count then exit(false);
      end;
  exit(true);
end;

procedure Print;
var i,j:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to n do
    begin
      for j:=1 to m do
        write(q[i,j]);
      writeln;
    end;
  close(output);
end;

procedure Generate(x,y:longint);
var i:longint;
begin
  if x > n then
    begin
      if Ok then Print;
      exit;
    end;
  for i:=0 to 1 do
    begin
      q[x,y]:=i;
      if y = m then
        begin
          Generate(x+1,1);
        end
      else
        Generate(x,y+1);
    end;
end;

procedure Analyse;
begin
  Generate(1,1);
end;

begin
  Init;
  Analyse;
end.