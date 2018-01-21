const fileinp = 'phantich.inp';
      fileout = 'phantich.out';

var x,y,d,a,b,n,i:longint;

function UCLN(a,b:longint; var x,y:longint):longint;
var x1,y1,u:longint;
begin
  if b > a then exit(UCLN(b,a,y,x));
  if b = 0 then
    begin
      x:=1; y:=0;
      exit(a);
    end;
  u:=UCLN(b,a mod b,x1,y1);
  x:=y1;
  y:=(x1 - y1*(a div b));
  exit(u);
end;

{ Mo mam than chuong
function UCLN(x,y:longint):longint;
var tmp:longint;
begin
  while y <> 0 do
    begin
      tmp:=x mod y;
      x:=y;
      y:=tmp;
    end;
  exit(x);
end;
}

{ Mo mam than chuong
procedure Find;
var k:longint;
    found:boolean;
begin
  k:=0;
  d:=UCLN(a,b);
  found:=false;
  while not found do
    begin
      x:=-k;
      while (x <= k) and (not found) do
        begin
          y:=k-abs(x);
          if a*x+b*y = d then found:=true;
          y:=-y;
          if a*x+b*y = d then found:=true;
          if not found then inc(x);
        end;
      inc(k);
    end;
end;
}

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(a,b);
      d:=UCLN(a,b,x,y);
      writeln(x,' ',y,' ',d);
    end;
  close(input); close(output);
end.


