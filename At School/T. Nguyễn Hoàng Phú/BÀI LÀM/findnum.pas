const fileinp = 'findnum.inp';
      fileout = 'findnum.out';

type num =  record
             l:integer;
             n:array[1..1000] of byte;
            end;

var l:longint;
    quang,thuan:num;

procedure Init;
var i:longint;
    tmp:char;
begin
  assign(input,fileinp); reset(input);
  quang.l:=0;
  while not eoln do
    begin
      inc(quang.l);
      read(tmp);
      quang.n[quang.l]:=ord(tmp) - 48;
    end;
  readln;
  thuan.l:=0;
  while not eoln do
    begin
      inc(thuan.l);
      read(tmp);
      thuan.n[thuan.l]:=ord(tmp) - 48;
    end;
  close(input);
end;

function ToDec(a:num;base:longint):longint;
var kq,i,j,t:longint;
begin
  kq:=0;
  for i:=a.l downto 1 do
    begin
      t:=1;
      for j:=1 to abs(i-a.l) do
        t:=t * base;
      kq:=kq + a.n[i]*t;
    end;
  exit(kq);
end;

function OK:boolean;
var x,y,i:longint;
begin
  x:=ToDec(quang,2);
  y:=ToDec(thuan,3);
  if x = y then exit(true);
  exit(false);
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(ToDec(quang,2));
  close(output);
  halt;
end;

procedure Analyse;
var i,gti,j,gtj,r1,r2:longint;
begin
  for i:=1 to quang.l do
    for gti:=0 to 1 do
      for j:=1 to thuan.l do
        for gtj:=0 to 2 do
          begin
            if (i=0) and (gti=0) then continue;
            if (j=0) and (gtj=0) then continue;
            r1:=quang.n[i];
            r2:=thuan.n[j];
            quang.n[i]:=gti;
            thuan.n[j]:=gtj;
            if OK then Print;
            quang.n[i]:=r1;
            thuan.n[j]:=r2;
          end;
end;

begin
  Init;
  Analyse;
end.