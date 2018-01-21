{
ID: nhutqua1
PROG: milk3
LANG: PASCAL
}

const fileinp = 'milk3.in';
      fileout = 'milk3.out';

var a,b,c:longint;
    free:array[0..20,0..20,0..20] of boolean;
    t:array[0..20] of boolean;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(a,b,c);
  close(input);
end;

procedure Find(sa,sb,sc:longint);
var i,x1,x2,x3:longint;
begin
  Free[sa,sb,sc]:=false;
  if sa = 0 then t[sc]:=true;
  x1:=sa;
  x2:=sb;
  x3:=sc;
  for i:=1 to 6 do
    begin
      // A => B
      if i = 1 then
        begin
          while (sa > 0) and (sb < b) do
            begin
              dec(sa);
              inc(sb);
            end;
        end;
      // B ==> A
      if i = 2 then
        begin
          while (sb > 0) and (sa < a) do
            begin
              dec(sb);
              inc(sa);
            end;
        end;
      if i = 3 then
        begin
          while (sa > 0) and (sc < c) do
            begin
              dec(sa);
              inc(sc);
            end;
        end;
      if i = 4 then
        begin
          while (sc > 0) and (sa < a) do
            begin
              dec(sc);
              inc(sa);
            end;
        end;
      if i = 5 then
        begin
          while (sb > 0) and (sc < c) do
            begin
              dec(sb);
              inc(sc);
            end;
        end;
      if i = 6 then
        begin
          while (sc > 0) and (sb < b) do
            begin
              dec(sc);
              inc(sb);
            end;
        end;
      if Free[sa,sb,sc] then Find(sa,sb,sc);
      sa:=x1;
      sb:=x2;
      sc:=x3;
    end;

end;

procedure Analyse;
begin
  fillchar(free,sizeof(free),true);
  fillchar(t,sizeof(t),false);
  Find(0,0,c);
end;

procedure Print;
var i,count:longint;
    tx:array[1..21] of longint;
begin
  assign(output,fileout); rewrite(output);
  count:=0;
  for i:=0 to 20 do
    if t[i] then
      begin
        inc(count);
        tx[count]:=i;
      end;
  for i:=1 to count-1 do
    write(tx[i],' ');
  write(tx[count]);
  writeln;
end;

begin
  Init;
  Analyse;
  Print;
end.
