const fileinp = 'triple.inp';
      fileout = 'triple.out';
      maxN = 5000;

var n,mini,minj,mink:longint;
    a:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  close(input);
end;

procedure Analyse;
var i,j,k,tmp:longint;
begin
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if a[i] > a[j] then
        begin
          tmp:=a[i];
          a[i]:=a[j];
          a[j]:=tmp;
        end;
  for i:=1 to n-2 do
    for j:=i+1 to n-1 do
      for k:=j+1 to n do
        if (a[k]-a[j] = a[j]-a[i]) and (a[k]-a[j]<>0) then
          begin
            mini:=i;
            minj:=j;
            mink:=k;
            exit;
          end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(a[mini],' ',a[minj],' ',a[mink]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.