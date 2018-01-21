const fileinp = 'game.inp';
      fileout = 'game.out';
      maxN = 1000000;

var t:array[1..maxN] of longint;
    n,res,uu,vv:longint;

procedure Init;
var c:char;
    i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    begin
      readln(c,t[i]);
      if c = 'L' then t[i]:=-t[i];
    end;
  close(input);
end;

procedure Analyse;
var u,v,i:longint;
begin
  u:=0;
  v:=0;
  for i:=1 to n do
    begin
      if (u < 0) then
        begin
          u:=t[i];
          uu:=i;
        end
      else
        inc(u,t[i]);
      if (u >= v) then
        begin
          v:=u;
          vv:=i;
        end;
    end;
  res:=v;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  if res <> 0 then
  writeln(uu,' ',vv);
  close(output);
end;


begin
  Init;
  Analyse;
  Print;
end.