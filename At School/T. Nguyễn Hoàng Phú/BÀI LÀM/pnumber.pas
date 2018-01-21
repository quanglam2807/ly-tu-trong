const fileinp = 'pnumber.inp';
      fileout = 'pnumber.out';

var a,b:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(a,b);
  close(input);
end;

function OK(i:longint):boolean;
var j:longint;
begin
  if i = 1 then exit(false);
  for j:=2 to trunc(sqrt(i)) do
    if i mod j = 0 then
      exit(false);
  exit(true);
end;

procedure Print;
var i,count:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=a to b do
    if OK(i) then
      begin
        write(i,',');
        inc(count);
      end;
  writeln;
  writeln('SL ',count);
  close(output);
end;

begin
  Init;
  Print;
end.
