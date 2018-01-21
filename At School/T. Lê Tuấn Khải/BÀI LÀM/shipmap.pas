const fileinp = 'shipmap.inp';
      fileout = 'shipmap.out';
      dx:array[1..4] of longint = (-1,1,0,0);
      dy:array[1..4] of longint = (0,0,-1,1);

var n,m,res:longint;
    a:array[1..100,1..100] of char;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  for i:=1 to n do
    begin
      for j:=1 to m do read(a[i,j]);
      readln;
    end;
  close(input);
end;

procedure Analyse;
var i,j,k:longint;
begin
  res:=0;
  for i:=1 to n do
    for j:=1 to m do
      if a[i,j] = '.' then
        begin
          inc(res);
          for k:=1 to 4 do
            if (i+dx[k] > 0) and (i+dx[k] <= n)
            and (j+dy[k] > 0) and (j+dy[k] <= m)
            and (a[i+dx[k],j+dy[k]] = '*') then
              begin
                dec(res);
                break;
              end;
        end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
