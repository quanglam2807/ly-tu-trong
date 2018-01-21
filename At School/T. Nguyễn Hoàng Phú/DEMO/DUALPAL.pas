{
ID: nghoang4
PROG: dualpal
LANG: PASCAL
}
const fi = 'dualpal.in';
      fo = 'dualpal.out';

var i, b, c1, c2, s, n: longint;
    str: string;

function Change(i, b: longint): string;
var s: string;
    r: longint;
begin
  s:='';
  while i > 0 do
    begin
      r:=i mod b;
      s:=chr(r+48)+s;
      i:=i div b;
    end;
  exit(s);
end;

function Check(s: string): boolean;
var l, r: integer;
begin
  l:=1; r:=length(s);
  while l < r do
    begin
      if s[l] <> s[r] then exit(false);
      inc(l); dec(r);
    end;
  exit(true);
end;

begin
  assign(input,fi); reset(input);
  assign(output,fo); rewrite(output);
  readln(n,s);
  c1:=0;
  i:=s+1;
  while c1 < n do
    begin
      c2:=0;
      for b:=2 to 10 do
        begin
          str:=Change(i,b);
          if Check(str) then inc(c2);
          if c2 >= 2 then break;
        end;
      if c2 >= 2 then
        begin
          writeln(i);
          inc(c1);
        end;
      inc(i);
    end;
  close(input); close(output);
end.