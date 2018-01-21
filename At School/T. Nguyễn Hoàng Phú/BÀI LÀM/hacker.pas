const fileinp = 'hacker.in';
      fileout = 'hacker.out';
      dx:array[1..4] of integer = (-1,1,0,0);
      dy:array[1..4] of integer = (0,0,-1,1);
      maxN = 100;

var count,n:longint;
    s:string;
    a:array[1..maxN,1..maxN] of char;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  readln(s);
  for i:=1 to n do
    begin
      for j:=1 to n do read(a[i,j]);
      readln;
    end;
  close(input);
end;

procedure Next(k,i,j:longint);
var t:longint;
begin
  if k > length(s) then
    begin
      inc(count);
      exit;
    end;
  for t:=1 to 4 do
    if (i+dx[t] > 0) and (i+dx[t] <= n)
    and (j+dy[t] > 0) and (j+dy[t] <= n)
    and(a[i+dx[t],j+dy[t]]=s[k]) then
      begin
        Next(k+1,i+dx[t],j+dy[t]);
      end;
end;

procedure Analyse;
var i,j:longint;
begin
  count:=0;
  for i:=1 to n do
    for j:=1 to n do
      if a[i,j] = s[1] then
        begin
          Next(2,i,j);
        end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.