const fileinp = 'moo.inp';
      fileout = 'moo.out';
      maxN = 1000000;

var n,count:longint;
    kq:char;
{    s:array[0..maxN] of longint; }
    m:array[0..maxN] of longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

{
procedure FindWord(k:longint);
var middle,lr:longint;
begin
  middle:=1+k+2;
  lr:=s[k-1];
  s[k]:=lr+middle+lr;
  if s[k] >= n then
    begin
      if n = lr+1 then kq:='m';
      if (n > lr+1) and (n <= lr+1+k+2) then kq:='o';
      if (n > lr+1+k+2) then
        begin
          n:=n - lr+1+k+2;
          FindWord(k-1);
        end;
    end
  else FindWord(k+1);
end;


procedure Analyse;
begin
  s[0]:=3;
  FindWord(1);
end;
}

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(kq);
  close(output);
  halt;
end;

procedure FindWord(i:longint);
var t,j:longint;
begin
  t:=count;
  inc(count);
  m[count]:=m[count-1] + 3;
  if count = n then
    begin
      kq:='m';
      Print;
    end
  else if count > n then
    begin
      kq:='o';
      Print;
    end;
  for j:=1 downto t do
    begin
      inc(count);
      m[count]:=m[j] + m[t]+2+1+i+2+1;
      if count = n then
        begin
          kq:='m';
          Print;
        end
      else if count > n then
        begin
          kq:='o';
          Print;
        end;
    end;
end;

procedure Analyse;
begin
  count:=0;
  m[0]:=1;
  FindWord(1);
end;


begin
  Init;
  Analyse;
 { Print; }
end.
