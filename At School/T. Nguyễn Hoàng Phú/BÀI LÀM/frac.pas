const fileinp='frac.inp';
      fileout='frac.out';
      maxN = 1000000;

type phanso = record
               tu,mau:longint;
              end;

var a:array[1..maxN] of phanso;
    b:phanso;
    n,i,j,t:longint;

function OK(c,d:longint):boolean;
var r:longint;
begin
  while d<>0 do
    begin
      r:=c mod d;
      c:=d;
      d:=r;
    end;
  if c=1 then exit(true)
  else exit(false);
end;

procedure QSort(l,r:longint);
var i,j:longint;
    pivot:real;
    tmp:phanso;
begin
  if l>=r then exit;
  i:=l; j:=r;
  pivot:=a[(j+i) div 2].tu / a[(j+i) div 2].mau;
  repeat
    begin
      while (a[i].tu/a[i].mau) < pivot do inc(i);
      while (a[j].tu/a[j].mau) > pivot do dec(j);
      if i<=j then
        begin
          tmp:=a[i];
          a[i]:=a[j];
          a[j]:=tmp;
          inc(i); dec(j);
        end;
    end;
  until i>j;
  QSort(l,j);
  QSort(i,r);
end;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n);
  a[1].tu:=1;
  a[1].mau:=1;
  a[2].tu:=0;
  a[2].mau:=1;
  t:=2;
  for i:=1 to n do
    for j:=1 to i-1 do
      begin
        if Ok(i,j) then
          begin
            inc(t);
            a[t].tu:=j;
            a[t].mau:=i;
          end;
      end;    {
    for i:=1 to t-1 do
    for j:=i+1 to t do
      if (a[i].tu/a[i].mau) > (a[j].tu/a[j].mau) then
        begin
          b:=a[i];
          a[i]:=a[j];
          a[j]:=b;
        end;   }
 QSort(1,t);

  for i:=1 to t do writeln(a[i].tu,' ',a[i].mau);
  close(input); close(output);
end.
