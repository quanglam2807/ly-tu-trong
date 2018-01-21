const fileinp = 'asummin.inp';
      fileout = 'asummin.out';
      maxN = 100000;

var m,n,x,resi,resj,min:longint;
    a,b,pos:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(m,n);
  for i:=1 to m do
    begin
      pos[i]:=i;
      read(a[i]);
    end;
  for i:=1 to n do read(b[i]);
  close(input);
end;

procedure QSort(l,r:longint);
var i,j,p,tmp:longint;
begin
  if l >= r then exit;
  i:=l;
  j:=r;
  p:=a[(l+r) div 2];
  while i<=j do
    begin
      while (i<r) and (a[i]<p) do inc(i);
      while (j>0) and (a[j]>p) do dec(j);
      if i<=j then
        begin
          tmp:=a[i];
          a[i]:=a[j];
          a[j]:=tmp;
          tmp:=pos[i];
          pos[i]:=pos[j];
          pos[j]:=tmp;
          inc(i); dec(j);
        end;
    end;
  Qsort(l,j);Qsort(i,r);
end;

function FindMin(l,r:longint):longint;
var i,j:longint;
begin
   if l=r then
    begin
      exit(l);
      exit;
    end;
  i:=(l+r-1) div 2;
  j:=i+1;
  if abs(x+a[i])<abs(x+a[j]) then exit(FindMin(l,i))
  else exit(FindMin(j,r));;

end;

procedure Analyse;
var i,j:longint;
begin
  QSort(1,m);
  min:=maxlongint;
  for j:=1 to n do
    begin
      x:=b[j];
      i:=FindMin(1,m);
      if abs(a[i] + b[j]) < min then
        begin
          min:=abs(a[i]+b[j]);
          resi:=pos[i];
          resj:=j;
        end;
    end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(resi,' ',resj);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.