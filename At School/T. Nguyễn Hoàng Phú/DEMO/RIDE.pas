{
ID: nghoang4
PROG: ride
LANG: PASCAL
}
var s1, s2: string[6];
    n1, n2, i: longint;
begin
  assign(input,'ride.in'); reset(input);
  assign(output,'ride.out'); rewrite(output);
  readln(s1);
  read(s2);
  n1:=1;
  for i:=1 to length(s1) do n1:=n1*(ord(s1[i])-64);
  n2:=1;
  for i:=1 to length(s2) do n2:=n2*(ord(s2[i])-64);
  if n1 mod 47 = n2 mod 47 then writeln('GO') else writeln('STAY');
  close(input); close(output);
end.
