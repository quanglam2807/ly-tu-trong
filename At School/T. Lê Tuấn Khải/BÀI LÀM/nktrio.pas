const fileinp = 'nktrio.inp';
      fileout = 'nktrio.out';
      maxN = 1000;

var n:longint;
    q:array[0..maxN] of longint;
    w:array[1..maxN*maxN] of longint;

procedure Init;
var i,j,tmp,t:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  q[0]:=0;
  for i:=1 to n do
    begin
      j:=q[i-1];
      for t:=1 to n do
        begin
          read(tmp);
          if tmp = 1 then
            begin
              inc(j);
              w[j]:=t;
            end;
        end;
      q[i]:=j;
      readln;
    end;
  close(input);
end;

procedure AnalyseandPrint;
var d1,d2,d3:longint;
begin
  assign(output,fileout); rewrite(output);
  for d1:=1 to n do
    for d2:=q[d1-1]+1 to q[d1] do
      if w[d2] <> d1 then
        for d3:=q[w[d2]-1]+1 to q[w[d2]] do
          if (w[d3] <> w[d2]) and (w[q[w[d3]-1]+1] = 1) then
            begin
              writeln(d1,' ',w[d2],' ',w[d3]);
              halt;
            end;
  writeln('-1 -1 -1');
  close(output);
end;

begin
  Init;
  AnalyseandPrint;
end.