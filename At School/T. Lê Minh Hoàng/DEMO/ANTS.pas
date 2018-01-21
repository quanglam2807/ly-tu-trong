uses
  math;
const
  finp='ants.inp';
  fout='ants.out';
var
  k: int64;
  am,duong: int64;

procedure init;
var
  n,number: int64;
  i: longint;
begin
  assign(input,finp);reset(input);
  readln(n,k);
  duong:=high(int64);
  am:=high(int64);
  for i:=1 to n do
    begin
      read(number);
      if (number<0) and (am>number) then
        am:=number;
      if (number>0) and (duong>number) then
        duong:=number;
    end;
  close(input);
end;

procedure print;
begin
  assign(output,fout);rewrite(output);
  writeln(math.max(k-duong,0-am));
  close(output);
end;

begin
  init;
  print;
end.