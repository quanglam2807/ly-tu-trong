uses math;

const fileinp='lares.inp';
      fileout='lares.out';

var m,n,k,kq:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(m,n,k);
  close(input);
end;

procedure Analyse;
begin
  kq:=0;
  if k = 0 then kq:=math.min(n,m div 2)+1;
  if kq > 0 then exit;
  kq:=math.min(n,m div 2)+1;
  repeat
    dec(kq);
    if ((kq*2 <= m) and (kq <= n) and (kq*3+k <= m + n)) then
      exit;
  until false;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(kq);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.


