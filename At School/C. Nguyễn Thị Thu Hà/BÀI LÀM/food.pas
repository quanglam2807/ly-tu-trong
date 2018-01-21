const fileinp = 'food.inp';
      fileout = 'food.out';
      maxN = 100;

type td = record
            x,y:longint;
          end;

var m,n,sum,max:longint;
    a:array[1..maxN,1..maxN] of longint;
    free:array[1..maxN,1..maxN] of boolean;
    q,res:array[1..maxN*maxN] of td;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(m,n);
  for i:=1 to m do
    begin
      for j:=1 to n do read(a[i,j]);
      readln;
    end;
  close(input);
end;

procedure Next(i:longint);
var x,y:longint;
begin
  x:=q[i-1].x;
  y:=q[i-1].y;
  if x = m then
    begin
      if sum > max then
        begin
          res:=q;
          max:=sum;
        end;
      exit;
    end;
  if (y+1 <= n) then
    begin
      q[i].x:=x;
      q[i].y:=y+1;
      sum:=sum + a[x,y+1];
      free[x,y+1]:=false;
      Next(i+1);
      sum:=sum - a[x,y+1];
      free[x,y+1]:=true;
    end;
  if (x+1 <= m) then
    begin
      q[i].x:=x+1;
      q[i].y:=y;
      sum:=sum + a[x+1,y];
      free[x+1,y]:=false;
      Next(i+1);
      sum:=sum - a[x+1,y];
      free[x+1,y]:=true;
    end;
end;

procedure Analyse;
begin
  max:=0;
  sum:=0;
  q[1].x:=1;
  q[1].y:=1;
  sum:=a[1,1];
  Next(2);
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(max);
  i:=0;
  repeat
    inc(i);
    write('(',res[i].x,',',res[i].y,') ');
    if (res[i].x=m) then break;
  until false;
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.