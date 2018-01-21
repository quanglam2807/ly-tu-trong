const fileinp = 'ngto.inp';
      fileout = 'ngto.out';

var a:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(a);
  close(input);
end;

procedure Print;
var n,i:longint;
    found:boolean;
begin
  n:=a;
  repeat
    inc(n);
    found:=true;
    for i:=2 to trunc(sqrt(n)) do
      if n mod i = 0 then
        begin
          found:=false;
          break;
        end;
    if found then
      begin
        assign(output,fileout); rewrite(output);
        writeln(n);
        close(output);
        halt;
      end;
  until false;
end;

begin
  Init;
  Print;
end.