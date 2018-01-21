const fileinp = 'johnson1.inp';
      fileout = 'johnson1.out';
      maxN = 10000;

var n,cn1,cn2,ta,tb:longint;
    a,b,n1,n2:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  readln;
  for i:=1 to n do read(b[i]);
  close(input);
end;

procedure Analyse;
var i,j,tmp:longint;
begin
  cn1:=0;
  cn2:=0;
  for i:=1 to n do
    if a[i] <= b[i] then
      begin
        inc(cn1);
        n1[cn1]:=i;
      end
    else
      begin
        inc(cn2);
        n2[cn2]:=i;
      end;
  for i:=1 to cn1-1 do
    for j:=i+1 to cn1 do
      if a[n1[i]] > a[n1[j]] then
        begin
          tmp:=n1[i];
          n1[i]:=n1[j];
          n1[j]:=tmp;
        end;
  for i:=1 to cn2-1 do
    for j:=i+1 to cn2 do
      if b[n2[i]] < b[n2[j]] then
        begin
          tmp:=n2[i];
          n2[i]:=n2[j];
          n2[j]:=tmp;
        end;

  for i:=1 to cn2 do
    begin
      inc(cn1);
      n1[cn1]:=n2[i];
    end;

  ta:=a[n1[1]];
  tb:=ta + b[n1[1]];

  for i:=2 to n do
    begin
      ta:=ta + a[n1[i]];
      if ta >= tb then
        tb:=ta + b[n1[i]]
      else
        tb:=tb + b[n1[i]];
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(tb);
  for i:=1 to cn1 do
    write(n1[i],' ');
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.