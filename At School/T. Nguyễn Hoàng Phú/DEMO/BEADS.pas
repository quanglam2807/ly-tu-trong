{
ID: nghoang4
PROG: beads
LANG: PASCAL
}
const fi = 'beads.in';
      fo = 'beads.out';
      maxN = 350;

var b: array[0..maxN-1] of char;
    n, i, max, l, r, cl, cr: integer;
    bl, br: char;

procedure Optimize(i: integer);
begin
          l:=(i-1+n) mod n;
          r:=(i+2) mod n;
          cl:=1; cr:=1;
          while (b[l] = b[i]) or (b[l] = 'w') do
            begin
              inc(Cl);
              l:=(l+n-1) mod n;
            end;
          while (b[r] = b[(i+1) mod n]) or (b[r] = 'w') do
            begin
              inc(cr);
              r:=(r+1) mod n;
            end;
          if cl + cr > max then max:=cl+cr;
end;

begin
  assign(input,fi); reset(input);
  assign(output,fo); rewrite(output);
  readln(n);
  for i:=0 to n-1 do read(b[i]);
  max:=0;
  for i:=0 to n-1 do
    begin
      if (b[i] <> b[(i+1) mod n]) then
        begin
          if (b[i] = 'w') and (b[(i+1) mod n] = 'w') then continue;
          if (b[i] <> 'w') and (b[(i+1) mod n] <> 'w') then Optimize(i);
          if b[i] = 'w' then
              begin
                b[i]:='r';
                Optimize(i);
                b[i]:='b';
                Optimize(i);
                b[i]:='w';
              end;
          if b[(i+1) mod n] = 'w' then
              begin
                b[(i+1) mod n]:='r';
                Optimize(i);
                b[(i+1) mod n]:='b';
                Optimize(i);
                b[(i+1) mod n]:='w';
              end;
        end;
    end;
  if (max = 0) or (max > n) then writeln(n) else writeln(max);
  close(input); close(output);
end.