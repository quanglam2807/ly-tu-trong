{
ID: nhutqua1
PROG: milk
LANG: PASCAL
}


const fileinp = 'milk.in';
      fileout = 'milk.out';

type farmer = record
                p,a:longint;
              end;

var n,m,c:longint;
    f:array[1..5000] of farmer;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  for i:=1 to m do
    readln(f[i].p,f[i].a);
  close(input);
end;

procedure Sort;
var i,j:longint;
    tmp:farmer;
begin
  for i:=1 to m-1 do
    for j:=i+1 to m do
      if f[i].p > f[j].p then
        begin
          tmp:=f[i];
          f[i]:=f[j];
          f[j]:=tmp;
        end;
end;

procedure Analyse;
var r,i:longint;
begin
  r:=n;
  c:=0;
  for i:=1 to m do
    begin
      if r >= f[i].a then
         begin
           r:=r - f[i].a;
           c:=c + f[i].p * f[i].a;
         end
      else if r < f[i].a then
        begin
          c:=c + f[i].p * (r);
          r:=0;
        end;
      if r = 0 then exit;
    end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(c);
  close(output);
end;

begin
  Init;
  Sort;
  Analyse;
  Print;
end.
