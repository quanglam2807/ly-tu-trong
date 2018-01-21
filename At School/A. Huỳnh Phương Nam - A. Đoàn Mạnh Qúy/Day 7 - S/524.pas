const fileinp = '524.inp';
      fileout = '524.out';

var t,x,count,n:longint;
    a:array[1..1000] of longint;
    free:array[1..1000] of boolean;

function NT(i:longint):boolean;
var j:Longint;
begin
  for j:=2 to trunc(sqrt(i)) do
    if i mod j = 0 then exit(false);
  exit(true);
end;

procedure WriteResult;
var i:Longint;
begin
  writeln;
  for i:=1 to n do
    begin
      if i > 1 then write(' ');
      write(a[i]);
    end;
  inc(count);
end;

procedure Generate(i:longint);
var j:longint;
begin
  for j:=1 to n do
    if free[j] and NT(a[i-1]+j) then
      begin
        a[i]:=j;
        free[j]:=false;
        if (i = n) and (NT(a[n]+1)) then WriteResult
        else Generate(i+1);
        free[j]:=true;
      end;
end;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  t:=0;
  while not eof do
    begin
      if t > 0 then
        begin
          writeln;
          writeln;
        end;
      inc(t);
      readln(n);
      write('Case ',t,':');
      fillchar(a,sizeof(a),0);
      fillchar(free,sizeof(free),true);
      a[1]:=1;
      free[1]:=false;
      if n = 1 then WriteResult;
      Generate(2);
    end;
  writeln;
  close(input);  close(output);
end;

begin
  Init;
end.
