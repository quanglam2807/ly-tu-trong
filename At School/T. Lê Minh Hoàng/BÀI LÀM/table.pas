const fileinp = 'TABLE.inp';
      fileout = 'TABLE.out';

var i,j,a:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(a);
  close(input);
end;

procedure Analyse;
begin
  i:=round(sqrt(a));
  j:=i;
  a:=a - i*j;
  while a > 0 do
    begin
      if i > j then
        begin
          inc(j);
          a:=a-i;
        end
      else
        begin
          inc(i);
          a:=a -i;
        end;

    end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(i,' ',j);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
