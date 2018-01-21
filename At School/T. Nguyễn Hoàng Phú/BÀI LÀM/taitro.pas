const fileinp='taitro.inp';
      fileout='taitro.out';
      maxN = 10000;

var d,c,t,l:array [1..maxN] of longint;
    n,res:longint;

Procedure Init;
var i:longint;
begin
  assign(input,fileinp);reset(input);
  readln(n);
  for i:=1 to n do readln(d[i],c[i],t[i]);
  close(input);
end;

procedure Sort;
var i,j,tmp:longint;
begin
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if c[i]>c[j] then
        begin
          tmp:=d[i];
          d[i]:=d[j];
          d[j]:=tmp;
          tmp:=c[i];
          c[i]:=c[j];
          c[j]:=tmp;
          tmp:=t[i];
          t[i]:=t[j];
          t[j]:=tmp;
        end;
end;

Procedure Analyse;
var i,j:longint;
begin
  Sort;
  for i:=1 to n do
    begin
      l[i]:=t[i];
      for j:=1 to i-1 do
        if (c[j]<d[i]) and (l[i]<l[j]+t[i]) then l[i]:=l[j]+t[i];
    end;
  for i:=1 to n do
    if res<l[i] then res:=l[i];
end;

Procedure Print;
begin
  assign(output,fileout);rewrite(output);
  writeln(res);
  close(output);
end;

begin
  init;
  analyse;
  print;
end.
