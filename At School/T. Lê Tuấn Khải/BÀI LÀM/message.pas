const fileinp = 'message.inp';
      fileout = 'message.out';
      maxN = 800;

var n,m,count:longint;
    a:array[1..maxN,1..maxN] of boolean;
    free:array[1..maxN] of boolean;
    q:array[1..maxN] of longint;


procedure Init;
var i,u,v:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  fillchar(a,sizeof(a),false);
  for i:=1 to m do
    begin
      readln(u,v);
      a[u,v]:=true;
    end;
  close(input);
end;

procedure Generate(i:longint);
var j:longint;
begin
  for j:=1 to n do
    if (a[q[i-1],j]) and (free[j]) then
      begin
        q[i]:=j;
        free[j]:=false;
        Generate(i+1);
      end;
end;

procedure Analyse;
var i:longint;
begin
  fillchar(free,sizeof(free),true);
  count:=0;
  for i:=1 to n do
    if free[i] then
      begin
        inc(count);
        q[1]:=i;
        free[i]:=false;
        Generate(2);

      end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.