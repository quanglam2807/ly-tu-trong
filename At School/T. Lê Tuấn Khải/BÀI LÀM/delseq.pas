const fileinp = 'delseq.inp';
      fileout = 'delseq.out';
      maxN = 100;

var n,res:longint;
    a:array[0..maxN+1] of longint;
    free:array[1..maxN] of boolean;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  close(input);
end;

procedure Analyse;
var l,r:array[1..maxN] of longint;
    i,j,u,max:longint;
begin
  res:=0;
  a[0]:=0;
  a[n+1]:=0;
  for i:=1 to n do
    begin
      l[i]:=i-1;
      r[i]:=i+1;
    end;
  fillchar(free,sizeof(free),true);
  for i:=1 to n-2 do
    begin
      u:=0;
      max:=0;
      for j:=1 to n do
        if (free[j])
        and (l[j] <> 0) and (r[j] <> 0)
        and (a[l[j]]*a[r[j]] > max) then
          begin
            u:=j;
            max:=a[l[j]]*a[r[j]];
          end;
      free[u]:=false;
      r[l[u]]:=r[u];
      l[r[u]]:=l[u];
      res:=res + max;
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