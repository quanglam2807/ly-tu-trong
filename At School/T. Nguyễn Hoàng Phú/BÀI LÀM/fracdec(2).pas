{
ID: nhutqua1
PROG: fracdec
LANG: PASCAL
}

const fileinp = 'fracdec.in';
      fileout = 'fracdec.out';

var num,den:longint;
    s,v:ansistring;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(num,den);
  close(input);
end;

procedure Analyse;
var t,r,x,count:longint;
    f:array[1..10000] of longint;
    tmp:string;
begin
  assign(output,fileout); rewrite(output);
  fillchar(f,sizeof(f),0);
  t:=num div den;
  v:='';
  if t = 0 then v:='0.'
  else
    begin
      while t <> 0 do
        begin
          v:=chr(t + 48) + v;
          t:=t div 10;
        end;
    end;
  r:=num mod den;
  if r = 0 then
    begin
     s:='0';
     exit;
    end;
  count:=1;
  f[r]:=1;
  repeat
    x:=r*10;
    r:=x mod den;
    tmp:='';
    str(x div den,tmp);
    s:=s + tmp;
    if r = 0 then break;
    if f[r] > 0 then break;
    inc(count);
    f[r]:=count;
  until false;
  if r > 0 then
    begin
      insert('(',s,f[r]);
      s:=s+')';
    end;
  close(output);
end;

procedure Print;
var l,i:longint;
begin
  assign(output,fileout); rewrite(output);
  l:=0;
  for i:=1 to length(v) do
    begin
      inc(l);
      if l > 76 then
        begin
          writeln;
          l:=0;
        end;
      write(v[i]);
    end;
  for i:=1 to length(s) do
    begin
      inc(l);
      if l > 76 then
        begin
          writeln;
          l:=0;
        end;
      write(s[i]);
    end;
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
