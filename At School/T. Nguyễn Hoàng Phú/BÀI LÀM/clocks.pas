{
ID: nhutqua1
PROG: clocks
LANG: PASCAL
}


const fileinp = 'clocks.in';
      fileout = 'clocks.out';

type listclock = array[1..3,1..3] of integer;
var a:listclock;
    b,kq: array[1..9] of integer;
    i,j,sum,min,tmp,count:integer;
    check0:boolean;
    q:array[1..3000] of integer;


function Check(x:listclock):boolean;
begin
  x[1,1] := (x[1,1] + b[1]) mod 4;
  x[1,2] := (x[1,2] + b[1]) mod 4;
  x[2,1] := (x[2,1] + b[1]) mod 4;
  x[2,2] := (x[2,2] + b[1]) mod 4;
  x[1,1] := (x[1,1] + b[2]) mod 4;
  x[1,2] := (x[1,2] + b[2]) mod 4;
  x[1,3] := (x[1,3] + b[2]) mod 4;
  x[1,2] := (x[1,2] + b[3]) mod 4;
  x[1,3] := (x[1,3] + b[3]) mod 4;
  x[2,2] := (x[2,2] + b[3]) mod 4;
  x[2,3] := (x[2,3] + b[3]) mod 4;
  x[1,1] := (x[1,1] + b[4]) mod 4;
  x[2,1] := (x[2,1] + b[4]) mod 4;
  x[3,1] := (x[3,1] + b[4]) mod 4;
  x[1,2] := (x[1,2] + b[5]) mod 4;
  x[2,1] := (x[2,1] + b[5]) mod 4;
  x[2,2] := (x[2,2] + b[5]) mod 4;
  x[2,3] := (x[2,3] + b[5]) mod 4;
  x[3,2] := (x[3,2] + b[5]) mod 4;
  x[1,3] := (x[1,3] + b[6]) mod 4;
  x[2,3] := (x[2,3] + b[6]) mod 4;
  x[3,3] := (x[3,3] + b[6]) mod 4;
  x[2,1] := (x[2,1] + b[7]) mod 4;
  x[2,2] := (x[2,2] + b[7]) mod 4;
  x[3,1] := (x[3,1] + b[7]) mod 4;
  x[3,2] := (x[3,2] + b[7]) mod 4;
  x[3,1] := (x[3,1] + b[8]) mod 4;
  x[3,2] := (x[3,2] + b[8]) mod 4;
  x[3,3] := (x[3,3] + b[8]) mod 4;
  x[2,2] := (x[2,2] + b[9]) mod 4;
  x[2,3] := (x[2,3] + b[9]) mod 4;
  x[3,2] := (x[3,2] + b[9]) mod 4;
  x[3,3] := (x[3,3] + b[9]) mod 4;

  for i:=1 to 3 do
    for j:=1 to 3 do
      if x[i,j] <> 0 then exit(false);
  exit(true);
end;

procedure CheckMin;
begin
  sum:=0;
  for i:=1 to 9 do
    sum:=sum + b[i];
  if sum < min then
    begin
      min:=sum;
      kq:=b;
    end;
end;

procedure Generate(t:integer);
var y:integer;
begin
  for y:=0 to 3 do
    begin
      b[t]:=y;
      if t=9 then
        begin
          if Check(a) then CheckMin;
        end
      else Generate(t+1);
    end;
end;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  check0:=true;
  for i:=1 to 3 do
    begin
      for j:=1 to 3 do
        begin
          read(tmp);
          if tmp = 12 then a[i,j]:=0;
          if tmp = 3 then a[i,j]:=1;
          if tmp = 6 then a[i,j]:=2;
          if tmp = 9 then a[i,j]:=3;
          if a[i,j] <> 0 then check0:=false;
        end;
      readln;
    end;
  if check0 then writeln(0)
  else
    begin
      min:=100;
      Generate(1);
      count:=0;
      for i:=1 to 9 do
        if kq[i] > 0 then
          for j:=1 to kq[i] do
             begin
               inc(count);
               q[count]:=i;
             end;
      for i:=1 to count-1 do
        write(q[i],' ');
      write(q[count]);
      writeln;
    end;
  close(input); close(output);
end.