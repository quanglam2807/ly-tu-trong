const fileinp = 'digits.inp';
      fileout = 'digits.out';

var n,i:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

procedure Analyse;
var t,cur,c,j:longint;
    q:array[1..18] of longint;
begin
  i:=1;
  if n = 1 then exit;
  t:=1;
  cur:=1;
  repeat
    inc(i);
    c:=0;
    j:=i;
    while j <> 0 do
      begin
        inc(c);
        q[c]:=j mod 10;
        j:=j div 10;
      end;
    for j:=c downto 1 do
      if q[j] <> cur then
        begin
          cur:=q[j];
          inc(t);
          if t = n then exit;
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