const fileinp = 'vacation.inp';
      fileout = 'vacation.out';
      maxN = 200;
      oo = 1000000000;

var   n,m,k,q: longint;
      a,b: array[1..maxn,1..maxn] of longint;
      d,f: array[1..maxn,1..maxn] of longint;
      free: array[1.. maxn] of boolean;

procedure Init;
var i,j,u,v,w: longint;
begin
   readln(n,m,k,q);
   for i:=1 to n do
     for j:=1 to n do
       if i=j then begin b[i,j]:=0; a[i,j]:=0; end
       else begin b[i,j]:=oo; a[i,j]:=oo; end;

   for i:=1 to m do
     begin
        readln(u,v,w);
        a[u,v]:=w;
        b[v,u]:=w;
     end;
end;

procedure Dijkstra_1(s: longint);
var u,v,min: longint;
begin
   fillchar(free,sizeof(free),true);
   for u:=1 to n do d[s,u]:=oo;
   d[s,s]:=0;
   repeat
      u:=0;  min:=oo;
      for v:=1 to n do
        if free[v] and (min>d[s,v]) then
          begin
             u:=v;
             min:=d[s,v];
          end;

      if u=0 then break;
      free[u]:=false;

      for v:=1 to n do
        if free[v] and (d[s,v]>d[s,u]+b[u,v]) then
          d[s,v]:=d[s,u]+b[u,v];
   until false;
end;

procedure Dijkstra_2(s: longint);
var u,v,min: longint;
begin
   fillchar(free,sizeof(free),true);
   for u:=1 to n do f[s,u]:=oo;
   f[s,s]:=0;
   repeat
      u:=0;  min:=oo;
      for v:=1 to n do
        if free[v] and (min>f[s,v]) then
          begin
             u:=v;
             min:=f[s,v];
          end;

      if u=0 then break;
      free[u]:=false;

      for v:=1 to n do
        if free[v] and (f[s,v]>f[s,u]+a[u,v]) then
          f[s,v]:=f[s,u]+a[u,v];
   until false;
end;

procedure Analyse;
var i,kq,u,v,j,count: longint;
    res: int64;
begin
   for i:=1 to k do
     begin
        Dijkstra_1(i);
        Dijkstra_2(i);
     end;

   res:=0;  count:=0;
   for i:=1 to q do
     begin
        readln(u,v);
        kq:=oo;
        for j:=1 to k do
          if kq>d[j,u]+f[j,v] then kq:=d[j,u]+f[j,v];

        if kq<>oo then
          begin
             res:=res+kq;
             inc(count);
          end;
     end;

   writeln(count);
   writeln(res);
end;

begin
   assign(input,fileinp); assign(output,fileout);
   reset(input); rewrite(output);

   Init;
   Analyse;

   close(input); close(output);
end.
