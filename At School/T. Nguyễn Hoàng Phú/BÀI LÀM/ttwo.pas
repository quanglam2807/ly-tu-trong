{
ID: nhutqua1
PROG: ttwo
LANG: PASCAL
}

const fileinp = 'ttwo.in';
      fileout = 'ttwo.out';
      dx:array[1..4] of integer = (-1,0,1,0);
      dy:array[1..4] of integer = (0,1,0,-1);
      dm:array[1..4] of char = ('N','W','S','E');

var x,y:array['A'..'Z'] of longint;
    time,t:longint;
    a:array[1..10,1..10] of char;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  for i:=1 to 10 do
    begin
      for j:=1 to 10 do
        begin
          read(a[i,j]);
          if (a[i,j] = 'F') or (a[i,j] = 'C') then
            begin
             x[a[i,j]]:=i;
             y[a[i,j]]:=j;
            end;
        end;
      readln;
    end;
  close(input);
end;

procedure Analyse;
var dn:array['A'..'Z'] of longint;
    nav:array['A'..'Z'] of char;
    i:longint;
    xF,yF,xC,yC:longint;
begin
  dn['N'] := 1;
  dn['S'] := 3;
  dn['W'] := 2;
  dn['E'] := 4;
  nav['F']:='N';
  nav['C']:='N';
  t:=0;
  repeat
    if (x['F'] = x['C']) and (y['F'] = y['C']) then exit;
    if t = 40000 then
      begin
        t:=0;
        exit;
      end;
    inc(t);
    xF:=x['F']+dx[dn[nav['F']]];
    yF:=y['F']+dy[dn[nav['F']]];
    xC:=x['C']+dx[dn[nav['C']]];
    yC:=y['C']+dy[dn[nav['C']]];
    if (xF < 1) or (yF < 1) or (xF > 10) or (yF > 10) or (a[xF,yF] = '*') then
      begin
        i:=dn[nav['F']];
        if i < 4 then
          inc(i)
        else i:=1;
        nav['F']:=dm[i];
      end
    else
      begin
         x['F']:=xF;
         y['F']:=yF;
      end;
    if (xC < 1) or (yC < 1) or (xC > 10) or (yC > 10) or (a[xC,yC] = '*') then
      begin
        i:=dn[nav['C']];
        if i < 4 then
          inc(i)
        else i:=1;
        nav['C']:=dm[i];
      end
    else
      begin
         x['C']:=xC;
         y['C']:=yC;
      end;
  until false;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(t);
  close(output);
end;


begin
  Init;
  Analyse;
  Print;
end.