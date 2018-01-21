const
  finp='wedding.inp';
  fout='wedding.out';
  maxn=1000;
var
  a: array [1..2*maxn,1..2*maxn] of boolean;
  x: array [1..2*maxn] of integer;
  n: integer;

procedure init;
var u,v,k: integer;
begin
  assign(input,finp);reset(input);
  readln(n);
  for u:=1 to n do
    begin
      read(k);
      while k>0 do
        begin
          read(v);
          a[u,v]:=true;
          a[v,u]:=true;
          dec(k);
        end;
    end;
  n:=2*n;
  for u:=1 to n do x[u]:=u;
  close(input);
end;

procedure tang(var i: integer);
begin
  i:=i+1;
  if i>n then i:=1;
end;

procedure giam(var i: integer);
begin
  i:=i-1;
  if i<0 then i:=n;
end;

procedure daodoan(i,k: integer);
var m,t: integer;
begin
  if k<i then
    begin
      m:=n-i+k;
      while m>0 do
        begin
          t:=x[i];
          x[i]:=x[k];
          x[k]:=t;

          tang(i);
          giam(k);
          dec(m,2);
        end;
    end
  else if k>i then
    begin
      while i<k do
        begin
          t:=x[i];
          x[i]:=x[k];
          x[k]:=t;
          dec(k);
          inc(i);
        end;
    end;
end;

procedure solve;
var i,k: integer;
begin
  for i:=1 to n-1 do
    begin
      if not a[x[i],x[i+1]] then
        begin
          k:=i+1;
          repeat
             tang(k);
          until (k=i) or (a[x[k],x[i]] and  a[x[i+1],x[k+1]]);
          daodoan(i+1,k);
        end;
    end;
end;

procedure print;
var i: integer;
begin
  assign(output,fout);rewrite(output);
  for i:=1 to n do
    write(x[i],' ');
  close(output);
end;

begin
  init;
  solve;
  print;
  readln;
end.
