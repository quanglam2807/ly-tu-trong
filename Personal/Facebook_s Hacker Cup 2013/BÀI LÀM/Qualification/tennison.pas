const fileinp = 'tennison.txt';
      fileout = 'tennison.out';

var k:longint;
    ps,pr,pi,pu,pw,pd,pl:real;

procedure Init;
begin
  readln(k,ps,pr,pi,pu,pw,pd,pl);
end;

procedure Analyse;
var i:longint;
begin

  for i:=1 to k do
    begin

    end;
end;

procedure Main;
var i,t:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  for i:=1 to t do
    begin
      Init;
      Analyse;
      Print;
    end;
  close(input); close(output);
end;