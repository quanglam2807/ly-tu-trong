const fileinp = 'substr.inp';
      fileout = 'substr.out';
      maxN = 100000;

var n,b,p,res:longint;
    a:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,b);
  for i:=1 to n do
    begin
      read(a[i]);
      if a[i] = b then p:=i;
    end;
  close(input);
end;

procedure Analyse;
var i,ts,tl,ttl,tts,j:longint;
begin
  ts:=0;
  tl:=0;
  for i:=1 to n do
    begin
      if a[i] > a[p] then inc(tl);
      if a[i] < a[p] then inc(ts);
    end;
  res:=0;
  for i:=1 to p do
    begin
      ttl:=tl;
      tts:=ts;
      for j:=n downto p do
        begin
          if ((j-i+1) mod 2 = 1) and (ttl = tts) then inc(res);
          if a[j] > a[p] then dec(ttl);
          if a[j] < a[p] then dec(tts);
        end;
      if a[i] > a[p] then dec(tl);
      if a[i] < a[p] then dec(ts);
    end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
