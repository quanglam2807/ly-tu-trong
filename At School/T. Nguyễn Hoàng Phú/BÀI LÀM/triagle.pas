const fileinp = 'triagle.inp';
      fileout = 'triagle.out';
      maxN = 50;

var n,count:longint;
    f:array[0..maxN,0..maxN,0..maxN,0..maxN] of boolean;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

procedure Analyse;
var x1,y1,x2,y2,i,j,tmp:longint;
    a:array[1..3] of longint;
begin
  count:=0;
  for i:=0 to n do
    for j:=0 to n do
      begin
        f[0,0,i,j]:=true;
        f[i,j,0,0]:=true;
      end;
  for x1:=0 to n do
    for y1:=0 to n do
      for x2:=0 to n do
        for y2:=0 to n do
          if not f[x1,y1,x2,y2] then
            begin
              f[x1,y1,x2,y2]:=true;
              f[x2,y2,x1,y1]:=true;
              if (x1 = x2) and (y1 = y2) then continue;
              a[1]:=sqr(x1) + sqr(y1);
              a[2]:=sqr(x2) + sqr(y2);
              a[3]:=sqr(x2 - x1) + sqr(y2-y1);
              for i:=1 to 2 do
                for j:=i+1 to 3 do
                  if a[i] > a[j] then
                    begin
                      tmp:=a[i];
                      a[i]:=a[j];
                      a[j]:=tmp;
                    end;
              if a[1] + a[2] = a[3] then inc(count);
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
