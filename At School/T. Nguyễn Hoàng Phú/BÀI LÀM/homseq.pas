const fileinp = 'homseq.inp';
      fileout = 'homseq.out';
      maxN = 20000;
      maxC = 10;

var n,c,count:longint;
    a,list:array[1..maxN] of longint;
    b:array[1..maxC] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    readln(a[i]);
  readln(c);
  for i:=1 to c do
    readln(b[i]);
  close(input);
end;

procedure Analyse;
var i,j,k,tmp,s:longint;
    OK:boolean;
    minus,x,loc:array[1..maxC] of longint;
begin
  for i:=1 to c-1 do
    for j:=i+1 to c do
      if b[i] > b[j] then
        begin
          tmp:=b[i];
          b[i]:=b[j];
          b[j]:=tmp;
        end;

  for i:=2 to c do
    minus[i]:=b[i] - b[1];

  for i:=1 to n do
    begin
      for j:=i to i+c-1 do
        x[j-i+1]:=a[j];

      for j:=1 to c-1 do
        for k:=j+1 to c do
          if x[j] > x[k] then
            begin
              tmp:=x[j];
              x[j]:=x[k];
              x[k]:=tmp;
            end;

      OK:=true;
      for j:=2 to c do
        if (x[j] - x[1]) <> minus[j] then
          begin
            OK:=false;
            break;
          end;
      if not Ok then continue;
      inc(count);
      list[count]:=i;
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  for i:=1 to count do
    writeln(list[i]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
