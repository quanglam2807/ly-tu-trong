const fileinp = 'names.inp';
      fileout = 'names.out';
      maxN = 100000;

var s,t,q:array[1..maxN] of char;
    ls,lt,l:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  ls:=0;
  while not eoln do
    begin
      inc(ls);
      read(s[ls]);
    end;
  lt:=0;
  readln;
  while not eoln do
    begin
      inc(lt);
      read(t[lt]);
    end;
  close(input);
end;

procedure Analyse;
var k:char;
    i,u,v,f1,f2:longint;
begin
  k:='z';
  l:=0;
  u:=1;
  v:=1;
  repeat
    f1:=0;
    f2:=0;
    for i:=u to ls do
      if k = s[i] then
        begin
          f1:=i;
          break;
        end;
    for i:=v to lt do
      if k = t[i] then
        begin
          f2:=i;
          break;
        end;
    if (f1 > 0) and (f2 > 0) then
      begin
        u:=f1+1;
        v:=f2+1;
        inc(l);
        q[l]:=k;
      end
    else
      begin
        k:=chr(ord(k)-1);
        if ord(k) < ord('a') then exit;
      end;
  until false;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to l do write(q[i]);
  close(output);
end;


begin
  Init;
  Analyse;
  Print;
end.