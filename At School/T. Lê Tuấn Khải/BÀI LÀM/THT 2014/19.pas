const finp='hv.inp';
      fout='hv.out';
      maxN=10000;

var n,m:longint;
    c:char;

Procedure init;
begin
  assign(input,finp);reset(input);
  readln(n,m);
  close(input);
end;

Procedure analyse;
var i,j,count1,count2:longint;
begin
  count1:=0;
  count2:=0;
  while count1<m do
    begin
      inc(count1);
      inc(count2);
      c:=char(64+count2);
      if count2= n then count2:=0;
    end;
end;

Procedure Print;
begin
  assign(output,fout);rewrite(output);
  writeln(c);
  close(output);
end;

begin
  init;
  analyse;
  print;
end.