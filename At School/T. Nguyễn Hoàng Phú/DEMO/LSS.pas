const fileinp='lss.inp';
      fileout='lss.out';
      maxN=1000;
      maxC=10e28;
var
  a: array [1..maxn] of qword;
  d,f: array [0..maxn,0..maxn] of extended;
  n,g: longint;

procedure Init;
var
  i,j,k,sum: longint;
  mean: extended;
begin
  assign(input,fileinp);reset(input);
  readln(n,g);
  for i:=1 to n do
    readln(a[i]);

  for i:=1 to n do
    begin
      sum:=0;
      for j:=i to n do
        begin
          sum:=sum+a[j];
          f[i,j]:=f[i,j-1]+a[j]*a[j];
          mean:=sum/(j-i+1);
          d[i,j]:=(j-i+1)*mean*mean-2*mean*sum+f[i,j];
        end;
    end;
  close(input);
end;

procedure Analyse;
var i,j,k: longint;
begin
  for i:=1 to n do
    for j:=1 to g do
      begin
        f[i,j]:=maxC;
        if j = 1 then
          begin
            f[i,j]:=d[1,i];
            continue;
          end;
        if j > i then
          continue;

        for k:=1 to i-1 do
          if f[i,j]>f[k,j-1]+d[k+1,i] then
            f[i,j]:=f[k,j-1]+d[k+1,i];
      end;
end;

procedure Print;
begin
  assign(output,fileout);rewrite(output);
  writeln(f[n,g]:0:2);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
