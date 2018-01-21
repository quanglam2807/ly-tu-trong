const
  finp='photo.inp';
  fout='photo.out';
  maxn=100000;
var
  p: array [1..maxn,1..5] of longint;
  x: array [1..maxn] of longint;
  n: longint;

procedure init;
var i,j,k: longint;
begin
  assign(input,finp);reset(input);
  readln(n);
  for k:=1 to 5 do
    begin
      for j:=1 to n do
        begin
          read(i);
          p[i,k]:=j;
        end;
      readln;
    end;
  close(input);
  for i:=1 to n do x[i]:=i;
end;

function less(x,y: longint): boolean;
var k,count: longint;
begin
  count:=0;
  for k:=1 to 5 do
    if p[x,k]<p[y,k] then
      begin
        inc(count);
        if count = 3 then exit(true);
      end;
  exit(false);
end;

procedure solve(l,r: longint);
var i,j,t,p: longint;
begin
  if l>=r then exit;
  i:=l;j:=r;
  p:=x[(i+j) div 2];
  repeat
    while less(x[i],p) do inc(i);
    while less(p,x[j]) do dec(j);

    if i<=j then
      begin
        t:=x[i];
        x[i]:=x[j];
        x[j]:=t;
        inc(i);
        dec(j);
      end;
  until i>j;

  solve(l,j);
  solve(i,r);
end;

procedure print;
var i: longint;
begin
  assign(output,fout);rewrite(output);
  for i:=1 to n do write(x[i],' ');
  close(output);
end;

begin
  init;
  solve(1,n);
  print;
end.
