const fileinp = 'zeros.inp';
      fileout = 'zeros.out';

var m:longint;
    i:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(m);
  close(input);
end;

procedure Analyse;
var x,c:longint;
begin
  i:=0;
  c:=0;
  repeat
    inc(i);
    x:=i;
    while x <> 0 do
      begin
        if (x mod 10) = 0 then
          begin
            inc(c);
            if c >= m then exit;
          end;
        x:=x div 10;
      end;
  until false;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(i);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
