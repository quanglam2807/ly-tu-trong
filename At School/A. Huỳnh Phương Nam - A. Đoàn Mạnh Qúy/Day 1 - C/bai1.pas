{LAM NGUYEN NHUT QUANG}

const fileinp = 'bai1.inp';
      fileout = 'bai1.out';

var count,m,n:longint;
    a:array[-1..10000,-1..10000] of integer;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(m,n);
  for i:=1 to m do
    begin
      for j:=1 to n do
        read(a[i,j]);
      readln;
    end;
  close(input);
  for i:=-1 to m+1 do
    begin
      a[i,-1]:=0;
      a[i,n+1]:=0;
    end;
  for j:=-1 to n+1 do
    begin
      a[-1,j]:=0;
      a[m+1,j]:=0;
    end;
end;

procedure Analyse;
var i,j:longint;
begin
  count:=0;
  for i:=1 to m do
    for j:=1 to n do
      begin
        if (a[i,j-1]=0) and (a[i+1,j]=0) and (a[i+1,j-1]=0) and (a[i+1,j+1]=0) and (a[i,j]=1) then
          inc(count);
      end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
