const fileinp = 'count.inp';
      fileout = 'count.out';
      maxN = 1000;

var m,max:longint;
    q,f:array[1..maxN] of longint;

procedure Init;
var c:char;
begin
  m:=1;
  fillchar(q,sizeof(q),0);
  while not eoln do
    begin
      read(c);
      if (c = ' ') then
        begin
         if (q[m] > 0) then
           inc(m)
        end
      else
        inc(q[m]);
    end;
  readln;
end;

procedure Analyse;
var i:longint;
begin
  f[1]:=1;
  max:=1;
  for i:=2 to m do
    begin
      if q[i] = q[i-1] then
        f[i]:=f[i-1] + 1
      else
        f[i]:=1;
      if f[i] > max then max:=f[i];
    end;
end;

procedure Print;
begin
  writeln(max);
end;

procedure Main;
var i,n:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n);
  for i:=1 to n do
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
