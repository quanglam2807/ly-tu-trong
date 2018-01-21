const fileinp='valy.inp';
      fileout='valy.out';
      maxN=1000;

var f:array [0..maxN,0..maxN] of longint;
    w,c,d:array [1..maxN] of longint;
    n,m,s,count:longint;

procedure init;
var i:longint;
begin
  assign(input,fileinp);reset(input);
  readln(n,m);
  for i:=1 to n do readln(w[i],c[i]);
  close(input);
end;

Procedure Analyse;
var i,j:longint;
begin
  count:=0;
  fillchar(f,sizeof(f),0);
  for i:=1 to n do
    for j:=0 to m do
      begin
        f[i,j]:=f[i-1,j];
        if (j>=w[i]) and (f[i,j]<f[i-1,j-w[i]]+c[i]) then
          begin
            f[i,j]:=f[i-1,j-w[i]]+c[i];
          end;
      end;
  fillchar(d,sizeof(d),0);
  for i:=1 to n do
    for j:=1 to m do
      if f[i,j]<>0 then inc(d[f[i,j]]);
  for i:=1 to m do
    if d[i]<>0 then inc(count);
  s:=f[n,m];
end;

procedure print;
begin
  assign(output,fileout);rewrite(output);
  writeln(count);writeln(s);
  close(output);
end;

begin
  init;
  analyse;
  print;
end.