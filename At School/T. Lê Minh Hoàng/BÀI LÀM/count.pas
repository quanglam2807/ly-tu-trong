const fileinp = 'count.inp';
      fileout = 'count.out';


var n:int64;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

function Power(i,n:int64):int64;
begin
  if n = 0 then exit(1 mod 123456789)
  else
    begin
      Power:=sqr(Power(i,n div 2));
      if n mod 2 = 1 then exit(Power*i mod 123456789)
      else exit(Power mod 123456789);
    end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(Power(2,int64(n-1)));
  close(output);
end;

begin
  Init;
  Print;
end.
