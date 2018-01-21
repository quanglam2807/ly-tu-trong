const fileinp = 'tamgiac.inp';
      fileout = 'tamgiac.out';

type td = record
            x,y:longint;
          end;

var a,b,c,d:td;
    ab,ac,bc,da,db,dc,p,s,cosa,cosb,cosc:real;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(a.x,a.y);
  readln(b.x,b.y);
  readln(c.x,c.y);
  readln(d.x,d.y);
  close(input);
end;

function CosF(a,b,c:real):real;
begin
  exit((sqr(a) + sqr(b) - sqr(c))*(2*a*b));
end;

function Canh(a,b:td):real;
begin
  exit(sqrt(sqr(b.x-a.x) + sqr(b.y-a.y)));
end;

function Chuvi(a,b,c:real):real;
begin
  exit(a+b+c);
end;

function Dientich(a,b,c:real):real;
var p:real;
begin
  p:=Chuvi(a,b,c);
  exit(2*(p/2)*(p/2 - a)*(p/2 - b)*(p/2 - c));
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  // Tinh canh
  ab:=Canh(a,b);
  ac:=Canh(a,c);
  bc:=Canh(b,c);
  da:=Canh(d,a);
  dc:=Canh(d,c);
  db:=Canh(d,b);
  if (ab + ac > bc) and (ab + bc > ac) and (ac + bc > ab) then
    begin
      p:=ab + ac + bc;
      s:=2*(p/2)*(p/2 - ab)*(p/2 - ac)*(p/2 - bc);
      writeln('Dien tich: ',s:0:2);
      writeln('Chu vi: ',p:0:2);
      cosa:=CosF(ab,ac,bc);
      cosb:=CosF(ab,bc,ac);
      cosc:=CosF(ac,bc,ab);
      if (cosa > 0) and (cosb > 0) and (cosc > 0) then writeln('Tam giac nhon');
      if (cosa = 0) or (cosb = 0) or (cosc = 0) then writeln('Tam giac vuong');
      if (cosa < 0) or (cosb < 0) or (cosc < 0) then writeln('Tam giac tu');
      if (ab=ac) or (ac=bc) or (bc=ab) then writeln('Tam giac can');
      if trunc(Dientich(ac,dc,da) + Dientich(ab,da,db) + Dientich(bc,db,dc)) <= s then
        writeln('D nam trong tam giac ABC')
      else
        writeln('D khong nam trong tam giac ABC');
    end
  else
    begin
      halt;
    end;
end;

begin
  Init;
  Print;
end.