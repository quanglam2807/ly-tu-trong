uses windows;

const fileinp = 'sorting.inp';
      fileout = 'sorting.out';
      maxN = 100000;

var a:array[1..maxN] of longint;
    n,m,time:longint;
    res:string;

procedure Init;
var i:longint;
begin
  time:=gettickcount;
  assign(input,fileinp); reset(input);
  readln(n,m);
  for i:=1 to n do
    read(a[i]);
  close(input);
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  close(output);
  halt;
end;

procedure Analyse;
var i,j,tmp:longint;
begin
  res:='YES';
  for i:=1 to n-1 do
    for j:=1 to n-i do
      begin
       if gettickcount - time > 900 then
            Print;
      if a[j] > a[j+1] then
        begin
          if (a[j]+a[j+1]) > m then
            begin
              res:='NO';
              Print;
            end;
          tmp:=a[j];
          a[j]:=a[j+1];
          a[j+1]:=tmp;
        end;
      end;
end;

begin
  Init;
  Analyse;
  Print;
end.
