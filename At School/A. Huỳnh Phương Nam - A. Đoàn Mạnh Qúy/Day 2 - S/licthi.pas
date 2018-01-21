const fileinp = 'lichthi.inp';
      fileout = 'lichthi.out';

var m,n:longint;
    a:array[1..1000,1..1000] of boolean;
    day:array[1..1000] of longint;

procedure Init;
var i,j,t,c,tmp:longint;
    sps:array[1..1000] of longint;
begin
  assign(input,fileinp); reset(input);
  readln(m,n);
  fillchar(a,sizeof(a),false);
  for i:=1 to m do
    begin
      c:=0;
      for j:=1 to n do
        begin
          read(tmp);
          if tmp = 1 then
            begin
              inc(c);
              sps[c]:=j;
            end;
        end;
      for j:=1 to c  do
        for t:=1 to c do
          begin
            a[sps[j],sps[t]]:=true;
            a[sps[t],sps[j]]:=true;
          end;
    end;
end;

procedure Analyse;
var count,i,j,t:longint;
begin
  count:=0;
  fillchar(day,sizeof(day),0);
  for i:=1 to n do
  if day[i] = 0 then
    begin
      inc(count);
      day[i]:=count;
      for j:=1 to n do
        begin
          if (a[i,j]=false) and (day[j] = 0) then
            begin
              day[j]:=count;
            end;
        end;
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to n do writeln(day[i]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
