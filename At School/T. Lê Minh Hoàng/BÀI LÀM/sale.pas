const fileinp = 'sale.inp';
      fileout = 'sale.out';

var n,k,p:longint;
    kq:int64;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n,k,p);
  close(input);
end;

procedure Analyse;
var f:longint;
begin
  if k > 0 then
    begin
      f:=n div (k+1);
      n:=n - f;
    end;
  kq:=int64(n)*p;
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
