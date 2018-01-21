const fileinp = 'cd.inp';
      fileout = 'cd.out';

var t,sum,max,x,sumsl,maxsl,n,sl:longint;
    a,r:array[1..1000] of longint;
    track:array[1..1000] of longint;

procedure Check;
var i:longint;
begin
  if (sum > max) then
    begin
      max:=sum;
      r:=a;
    end;
end;

procedure Generate(i:longint);
var j:longint;
    change,changesl:boolean;
begin
  for j:=0 to 1 do
    begin
      if j=1 then
        begin
          if sum+track[i] > n then continue
          else
            begin
              inc(sumsl);
              inc(sum,track[i]);
            end;
        end;
      a[i]:=j;
      if i = sl then Check
      else Generate(i+1);
      if j=1 then
        begin
          dec(sumsl);
          dec(sum,track[i]);
        end;
    end;
end;

procedure Init;
var i,t:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  t:=0;
  while not eof do
    begin
      inc(t);
      read(n);
      read(sl);
      if (n=0) and (sl=0) then exit;
      for i:=1 to sl do read(track[i]);
      readln;
      sumsl:=0;
      sum:=0;
      max:=-maxlongint;
      maxsl:=-maxlongint;
      Generate(1);
      for i:=1 to sl do
        if r[i]=1 then
          write(track[i],' ');
      write('sum:',max);
      writeln;
    end;
  close(input); close(output);
end;

begin
  Init;
end.
