const fileinp = 'testtime.inp';
      fileout = 'testtime.out';

var d,h,m,sm:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(d,h,m);
  close(input);
end;

procedure Analyse;
var nd,nh,nm:longint;
begin
  nd:=d - 11;
  nh:=h - 11;
  nm:=m - 11;
  sm:=nd*24*60 + nh*60 + nm;
  if sm < 0 then sm:=-1;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(sm);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.