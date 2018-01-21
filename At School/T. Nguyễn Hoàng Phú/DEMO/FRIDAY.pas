{
  ID: nghoang4
  PROG: friday
  LANG: PASCAL
}
const fi = 'friday.in';
      fo = 'friday.out';

var i, d, m, y, n: integer;
    count: array[1..7] of integer;

function isleapYear(y: integer): boolean;
begin
  if ((y mod 4 = 0) and (y mod 100 <> 0)) or (y mod 400 = 0) then exit(true);
  exit(false);
end;

procedure IncDay;
var endmonth: boolean;
begin
  i:=i mod 7 + 1;
  endmonth:=false;
  if d = 31 then endmonth:=true;
  if (d = 30) and (m in [4,6,9,11]) then endmonth:=true;
  if (d = 29) and (m = 2) and isleapYear(y) then endmonth:=true;
  if (d = 28) and (m = 2) and (not isleapYear(y)) then endmonth:=true;
  if endmonth then
    begin
      d:=1;
      inc(m);
    end
  else inc(d);
  if m = 13 then
    begin
      m:=1;
      inc(y);
    end;
end;

begin
  assign(input,fi); reset(input);
  assign(output,fo); rewrite(output);
  readln(n);
  i:=2;
  d:=1; m:=1; y:=1900;
  n:=1900+n-1;
  fillchar(count,sizeof(count),0);
  while y <= n do
    begin
      if d = 13 then inc(count[i]);
      IncDay;
    end;
  for i:=1 to 6 do write(count[(i+5) mod 7 + 1],' ');
  writeln(count[6]);
  close(input); close(output);
end.
