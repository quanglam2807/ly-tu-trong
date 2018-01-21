const fileinp = 'mapping.inp';
      fileout = 'mapping.out';
      maxN = 100000000;

var x,y,resx,resy:longint;
    z,res:qword;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(x,y);
  readln(z);
  close(output);
end;

function Sum(i:longint):qword;
begin
  if i <= 0 then exit(0);
  Sum:=(sqr(i) + i) div 2;
end;

procedure Mission_1;
var xx,yy:longint;
begin
  yy:=abs(y - 1);
  xx:=x + yy;
  res:=Sum(xx-1) + y;
end;

procedure Mission_2;
var i:longint;
begin
  i:=0;
  repeat
    inc(i);
    if (z - Sum(i-1) <= i) and (z - Sum(i-1) >= 1) then
      begin
        resy:=z - Sum(i-1);
        resx:=i - resy + 1;
        exit;
      end;
  until false;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  writeln(resx,' ',resy);
  close(output);
end;

begin
  Init;
  Mission_1;
  Mission_2;
  Print;
end.
