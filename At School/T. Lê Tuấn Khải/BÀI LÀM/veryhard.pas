const fileinp = 'veryhard.inp';
      fileout = 'veryhard.out';


function C(x:qword):char;
begin
  if sqr(trunc(sqrt(x))) = x then
      exit('1');
  exit('0');
end;

procedure Main;
var n,i:longint;
    x:int64;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      read(x);
      write(C(x),' ');
    end;
  close(input); close(output);
end;


begin
  Main;
end.
