const fileinp = 'cvnuoc.inp';
      fileout = 'cvnuoc.out';
      maxN = 10000;
      maxC = 10000;
var k,n,m,max:longint;
    free:array[1..maxN] of boolean;
    c:array[1..maxN,1..maxN] of longint;

procedure Init;
var t,i,j,u,v:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  for i:=1 to n do
    for j:=1 to n do
      begin
        if i = j then c[i,i]:=0
        else c[i,j]:=-maxC;
      end;
  for t:=1 to m do
    begin
      readln(i,j);
      c[i,j]:=1;
    end;
  close(input);
end;

{
procedure Compare(count:longint);
begin
  if count > max then max:=count;
end;

procedure AnaWay(i,count:longint);
var found:boolean;
    j:longint;
begin
  inc(count);
  way[count]:=i;
  free[i]:=false;
  if i = k then  free[i]:=true;
  found:=false;
  for j:=1 to n do
    if a[i,j] and free[j] then
      begin
        if j <> k then AnaWay(j,count);
        found:=true;
      end;
  if not found then Compare(count);
  free[i]:=true;
end;

procedure Analyse;
begin
  fillchar(free,sizeof(free),true);
  max:=-maxlongint;
  for k:=1 to n do
    begin
      Anaway(k,0);
    end;
end;
}

procedure Analyse;
var w,u,v:longint;
begin
  max:=0;
  for w:=1 to n do
    for u:=1 to n do
      for v:=1 to n do
        if (c[u,v] < c[u,w] + c[w,v]) then
          begin
            c[u,v]:=c[u,w]+c[w,v];
          end;
  for u:=1 to n do
    for v:=1 to n do
      if c[u,v] > max then max:=c[u,v];
end;


procedure WriteResult;
begin
  assign(output,fileout); rewrite(output);
  writeln(max);
  close(output);
end;

begin
  Init;
  Analyse;
  WriteResult;
end.