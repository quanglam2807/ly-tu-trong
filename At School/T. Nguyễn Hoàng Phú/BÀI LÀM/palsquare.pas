{
ID: nhutqua1
PROG: palsquare
LANG: PASCAL
}

const fileinp = 'palsquare.in';
      fileout = 'palsquare.out';

var b:longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(b);
  close(input);
end;

procedure OK(i:longint);
var j:longint;
    t:string;
begin
  j:=0;
  while i <> 0 do
    begin
      inc(j);
      t[j]:=chr(i mod b);
      i:=i div b;
    end;
end;

procedure Analyse;
var i:Longint;
begin
  for i:=1 to 300 do
    begin
      ok(i);
    end;
end;

begin
  Init;
  Analyse;
end.
