const fileinp = 'robot.inp';
      fileout = 'robot.out';
      maxN = 100;
      maxborder = 20020;

var n,m:longint;
    a,d:array[0..maxN+1,0..maxN+1] of longint;


procedure Init;
var u,v:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  for u:=1 to n do
    begin
      for v:=1 to m do read(a[u,v]);
      readln;
    end;
  close(input);
end;

procedure Analyse;
var v,u,s1,s2:longint;
begin
  for v:=1 to m do
    begin
      a[0,v]:=maxborder;
      a[n+1,v]:=maxborder;
    end;
  for u:=1 to n do
    begin
      a[u,0]:=maxborder;
      a[u,m+1]:=maxborder;
    end;
  fillchar(d,sizeof(d),0);
  for u:=1 to n do
    for v:=1 to m do
      begin
        if (u=1) and (v=1) then d[u,v]:=1
        else
          begin
            s1:=0;
            s2:=0;
            if (a[u-1,v] <> maxborder) then s1:=d[u-1,v]+a[u,v];
            if (a[u,v-1] <> maxborder) then s2:=d[u,v-1]+a[u,v];
            if s1 >= s2 then d[u,v]:=s1
            else d[u,v]:=s2;
          end;
      end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(d[n,m]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
