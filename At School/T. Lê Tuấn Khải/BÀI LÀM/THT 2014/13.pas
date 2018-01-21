var n, i, j, dem, l: longint;
    a, b, c: array[0..1000] of longint;
function ngto(n: integer): boolean;
var i: longint;
begin
  for i:=2 to trunc(sqrt(n)) do
    if n mod i = 0 then exit(false);
  exit(true);
end;

begin
  write('n = '); readln(n);
  l:=-1;
  for i:=2 to n do
    if ngto(i) then
      begin
        write(i,' ');
        inc(l);
        a[l]:=i;
        inc(b[i]);
      end;
  writeln;
  for i:=1 to l - 1 do
    for j:=i + 1 to l do
      begin
        if c[(a[i] + a[j]) div 2] = 0 then
          begin
            inc(c[(a[i] + a[j]) div 2]);
            inc(dem);
            write((a[i] + a[j]) div 2,' ');
          end;
      end;
  writeln;
  writeln(dem);
  readln
end.
