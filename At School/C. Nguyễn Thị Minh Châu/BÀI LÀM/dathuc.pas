const fileinp = 'dathuc.inp';
      fileout = 'dathuc.out';
      maxN = 1000;

type poly = record
              deg:longint;
              a:array[0..maxN] of longint;
            end;

var p,q:poly;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  read(p.deg);
  for i:=p.deg downto 0 do read(p.a[i]);
  readln;
  read(q.deg);
  for i:=q.deg downto 0 do read(q.a[i]);
  close(input);
end;

function FindR(p,q:poly):poly;
var i,v,tmp:longint;
    t:longint;
begin
  repeat
    if (p.deg < q.deg) then exit(p);
    if p.a[p.deg] mod q.a[q.deg]  <> 0 then
      begin
        writeln('Bai toan co so le hoac phan so');
        halt;
      end;
    t:=p.a[p.deg] div q.a[q.deg];
    v:=p.deg - q.deg;
    for i:=0 to q.deg do
      begin
        p.a[i+v]:=p.a[i+v] - t*q.a[i];
      end;
    tmp:=p.deg;
    p.deg:=-1;
    for i:=tmp downto 0 do
      if p.a[i] <> 0 then
        begin
          p.deg:=i;
          break;
        end;
  until false;
end;

function UCLN(p,q:poly):poly;
var r:poly;
    i,max:longint;
begin
  if p.deg < q.deg then exit(UCLN(q,p));
  r:=FindR(p,q);
  if r.deg = -1 then
    begin
      max:=-maxlongint;
      for i:=0 to q.deg do
        if q.a[i] > max then
           max:=q.a[i];
      for i:=0 to q.deg do
        q.a[i]:=q.a[i]*max;
      exit(q);
    end
  else
    exit(UCLN(q,r));
end;

procedure PrintPoly(x:poly);
var i:longint;
begin
  write(x.deg,' ');
  for i:=x.deg downto 0 do write(x.a[i],' ');
end;

procedure Print;
begin
   assign(output,fileout); rewrite(output);
   PrintPoly(UCLN(p,q));
   close(output)
end;

begin
  Init;
  Print;
end.
