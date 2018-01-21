const fileinp = 'triseq.inp';
      fileout = 'triseq.out';

var n,dt:longint;
    x,y:array[1..20] of longint;
    f:array[0..19,0..19,0..19,0..19] of int64;
    stt,t:int64;

function Duyet(i,min1,min2,max:longint):int64;
var j,nmin1,nmin2,nmax:longint;
    c:int64;
begin
  if f[i,min1,min2,max] > -1 then exit(f[i,min1,min2,max]);

  if min1+min2 <= max then
    begin
      f[i,min1,min2,max]:=0;
      exit(0);
    end;

  if i > n then
    begin
      f[i,min1,min2,max]:=ord(min1 + min2 > max);
      exit(ord(min1 + min2 > max));
    end;
  c:=0;
  for j:=1 to n do
    begin
      nmin1:=min1;
      nmin2:=min2;
      nmax:=max;
      x[i]:=j;
      if j < nmin1 then
        begin
          nmin2:=nmin1;
          nmin1:=j;
        end
      else if j < nmin2 then nmin2:=j;
      if j >nmax then nmax:=j;
      c:=c + Duyet(i+1,nmin1,nmin2,nmax);
    end;
    f[i,min1,min2,max]:=c;
    exit(c);
end;

procedure LankqthuT(i,min1,min2,max:longint);
var j,nmin1,nmin2,nmax:longint;
    c:int64;
begin

  if i > n then
    exit;
  for j:=1 to n do
    begin
      nmin1:=min1;
      nmin2:=min2;
      nmax:=max;
      x[i]:=j;
      if j < nmin1 then
        begin
          nmin2:=nmin1;
          nmin1:=j;
        end
      else if j < nmin2 then nmin2:=j;
      if j >nmax then nmax:=j;
      c:=Duyet(i+1,nmin1,nmin2,nmax);
      if c < t then t:=t-c
      else
        begin
          x[i]:=j;
          LankqthuT(i+1,nmin1,nmin2,nmax);
          break;
        end;
    end;

end;


procedure lankqDaySo(i,min1,min2,max:longint);
var j,nmin1,nmin2,nmax:longint;
    c:int64;
begin

  if i > n then
    exit;

  for j:=1 to y[i] do
    begin
      nmin1:=min1;
      nmin2:=min2;
      nmax:=max;
      x[i]:=j;
      if j < nmin1 then
        begin
          nmin2:=nmin1;
          nmin1:=j;
        end
      else if j < nmin2 then nmin2:=j;
      if j >nmax then nmax:=j;
      c:=Duyet(i+1,nmin1,nmin2,nmax);
      if j < y[i] then stt:=stt+ c
      else lankqDayso(i+1,nmin1,nmin2,nmax);
    end;
end;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  readln(dt);
  for i:=1 to n do read(y[i]);
  close(input);
end;

procedure Print;
var i:longint;
begin
  fillchar(f,sizeof(f),255);
  assign(output,fileout); rewrite(output);
  writeln(Duyet(1,n+1,n+1,0));
  LankqthuT(1,n+1,n+1,0);
  LankqDaySo(1,n+1,n+1,0);
  for i:=1 to n do write(y[i],' ');
  writeln;
  writeln(stt+1);
  close(output);
end;

begin
  Init;
  Print;
end.