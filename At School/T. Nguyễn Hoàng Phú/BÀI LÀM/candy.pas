uses math;

const fileinp = 'candy.inp';
      fileout = 'candy.out';
      maxN = 20;


var n,s,res,t:longint;
    f:array[0..maxN,0..1000,0..1000] of boolean;
    a:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  s:=0;
  for i:=1 to n do
    begin
      readln(a[i]);
      inc(s,a[i]);
    end;
  close(input);
end;

function max(x,y,z:longint):longint;
begin
  if (x >=y) and (x >= z) then exit(x);
  if (y >=x) and (y >= z) then exit(y);
  exit(z);
end;

procedure Analyse;
var i,k1,k2:longint;
begin
  fillchar(f,sizeof(f),false);
  f[0,0,0]:=true;
  res:=maxlongint;
  for i:=1 to n do
    for k1:=0 to 700 do
      for k2:=0 to 700 do
        if f[i-1,k1,k2] then
          begin
            f[i,k1,k2]:=true;
            res:=math.min(res,max(k1,k2,s-k1-k2));
            f[i,k1+a[i],k2]:=true;
            res:=math.min(res,max(k1+a[i],k2,s-k1-a[i]-k2));
            f[i,k1,k2+a[i]]:=true;
            res:=math.min(res,max(k1,k2+a[i],s-k1-k2-a[i]));
          end;

end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
