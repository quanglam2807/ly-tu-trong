const fileinp = 'homework.inp';
      fileout = 'homework.out';
      maxN = 1000;

var i,u,v,n,m,s,max:longint;
    t:array[1..maxN] of longint;
    free:array[1..maxN] of boolean;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m);
  s:=0;
  for i:=1 to n do
    begin
      read(t[i]);
      s:=s + t[i];
    end;
  fillchar(free,sizeof(free),true);
  for i:=1 to m do
    begin
      readln(u,v);
      free[u]:=false;
    end;
  max:=0;
  for i:=1 to n do
    if (free[i]) and (t[i] > max) then
      max:=t[i];
  writeln(s-max);
  close(input); close(output);
end.

