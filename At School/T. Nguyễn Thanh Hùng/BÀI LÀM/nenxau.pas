const fileinp = 'nenxau.inp';
      fileout = 'nenxau.out';

var t:string;
    min:longint;
    z:array[1..255] of longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(t);
  close(output);
end;

procedure Analyse;
var r,l,i,n:longint;
begin
  r:=1;
  l:=1;
  z[1]:=0;
  min:=length(t)+1;
  z[min]:=maxlongint;
  n:=length(t);
  for i:=2 to n do
    begin
      if i < r then
        begin
          if z[i-l+1] > z[r-i+1] then z[i]:=z[r-i+1]
          else z[i]:=z[i-l+1];
        end;
      while (z[i]+i <= n) and (t[i+z[i]] = t[1+z[i]]) do
        inc(z[i]);
      if z[i] + i - 1 > r then
        begin
          r:=z[i]+i-1;
          l:=i;
        end;
      if (z[i] > 0) and (n mod z[i]=0) and (z[i] < z[min]) then
        min:=i;
    end;

end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(z[min]);
  for i:=min to min+z[min]-1 do
    write(t[i]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.