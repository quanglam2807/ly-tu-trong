const fileinp = 'creation.inp';
      fileout = 'creation.out';
      maxN = 100;

var p,m,n,sum:longint;
    a:array[0..maxN,0..maxN] of longint;
    count,c:array[1..maxN] of longint;
    free:array[1..maxN] of boolean;

procedure Init;
var w,i,j,x1,y1,x2,y2:longint;
begin
  assign(input,fileinp); reset(input);
  readln(p,m,n);
  fillchar(a,sizeof(a),0);
  for w:=1 to p do
    begin
      read(x1,y1,x2,y2,c[w]);
      for i:=x1+1 to x2 do
        for j:=y1+1 to y2 do
          a[i,j]:=c[w];
    end;
  close(input);
end;

procedure Analyse;
var i,j:longint;
begin
  fillchar(count,sizeof(count),0);
  for i:=1 to m do
    for j:=1 to n do
      if a[i,j] <> 0 then
        inc(count[a[i,j]]);
  sum:=0;
  fillchar(free,sizeof(free),true);
  for i:=1 to p do
    if (count[c[i]] = 0) and (free[c[i]]) then
      begin
        inc(sum);
        free[c[i]]:=false;
      end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(sum);
  for i:=1 to p do
    if count[i] <> 0 then
      writeln(i,' ',count[i]);
end;

begin
  Init;
  Analyse;
  Print;
end.