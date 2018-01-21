{
ID: nhutqua1
PROG: comehome
LANG: PASCAL
}

const fileinp = 'comehome.in';
      fileout = 'comehome.out';
      maxC = 1000000;


var free:array['A'..'z'] of boolean;
    c:array['A'..'z','A'..'z'] of longint;
    d:array['A'..'z'] of longint;
    p,min:longint;
    mincow:char;

procedure Enter;
var u,v:char;
begin
  for u:='A' to 'z' do
    for v:='A' to 'z' do
      begin
        if u = v then c[u,v]:=0
        else c[u,v]:=maxC;
      end;
end;

procedure Init;
var i,tm:longint;
    u,v,tmp:char;
begin
  assign(input,fileinp); reset(input);
  readln(p);
  min:=maxlongint;
  fillchar(free,sizeof(free),false);
  for i:=1 to p do
    begin
      read(u,tmp,v);
      free[u]:=true;
      free[v]:=true;
      readln(tm);
      if tm < c[u,v] then c[u,v]:=tm;
      if tm < c[v,u] then c[v,u]:=tm;
    end;
  close(input);
end;

procedure Dijkstra;
var u,v:char;
    min:longint;
begin
  for v:='A' to 'z' do d[v]:=maxC;
  d['Z']:=0;
  repeat
    u:='!';
    min:=maxlongint;
    for v:='a' to 'z' do
      if (free[v]) and (d[v] < min) then
        begin
          u:=v;
          min:=d[v];
        end;
    for v:='A' to 'Z' do
      if (free[v]) and (d[v] < min) then
        begin
          u:=v;
          min:=d[v];
        end;
    if u = '!' then exit;
    free[u]:=false;
    for v:='A' to 'z' do
      if (d[u] + c[u,v] < d[v]) then
        d[v]:=d[u] + c[u,v];
  until false;
end;

procedure FindMin;
var i:char;
begin
  min:=maxlongint;
  for i:='A' to 'Y' do
    if d[i] < min then
      begin
        mincow:=i;
        min:=d[i];
      end;
end;

procedure Print;
var i:char;
begin
  assign(output,fileout); rewrite(output);
  writeln(mincow,' ',min);
  close(output);
end;

begin
  Enter;
  Init;
  Dijkstra;
  FindMin;
  Print;
end.
