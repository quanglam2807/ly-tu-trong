const fileinp = 'roads.inp';
      fileout = 'roads.out';
      maxN = 100;
      maxM = 10000;

var   adj,dd,mo,x,y,w,cp: array[1..maxM*2] of longint;
      free: array[1..maxN] of boolean;
      h: array[1..maxN+1] of longint;
      n,m,k,best,test,sotest: longint;

procedure Init;
var i,j,u,v: longint;
begin
   readln(k);
   readln(n);
   readln(m);

   fillchar(h,sizeof(h),0);
   for i:=1 to m do
     begin
        readln(x[i],y[i],w[i],cp[i]);
        inc(h[x[i]]);  inc(h[y[i]]);
     end;

   for i:=2 to n+1 do h[i]:=h[i-1]+h[i];

   for i:=1 to m do
     begin
        adj[h[x[i]]]:=y[i];   adj[h[y[i]]]:=x[i];
        dd[h[x[i]]]:=w[i];    dd[h[y[i]]]:=w[i];
        mo[h[x[i]]]:=cp[i];   mo[h[y[i]]]:=cp[i];
        dec(h[x[i]]);   dec(h[y[i]]);
     end;
end;

procedure Update(ts,tien: longint);
begin
   if tien>k then exit;
   if best>ts then best:=ts;
end;

procedure DFS(u,ts,tien: longint);
var v,j,last: longint;
    q: array[1..maxn] of longint;
begin
   free[u]:=false;

   if u=n then
     begin
        Update(ts,tien);
        free[u]:=true;
        exit;
     end;

   for j:=h[u]+1 to h[u+1] do
     begin
        v:=adj[j];
        if free[v] then
          begin
             DFS(v,ts+dd[j],tien+mo[j]);
          end;
     end;
   free[u]:=true;
end;

procedure Analyse;
begin
   fillchar(free,sizeof(free),true);
   best:=maxlongint;
   DFS(1,0,0);

   if best=maxlongint then writeln(-1) else writeln(best);
end;

begin
   assign(input,fileout); assign(output,fileout);
   reset(input); rewrite(output);

   readln(sotest);
   for test:=1 to sotest do
     begin
        Init;
        Analyse;
     end;

   close(input); close(output);
end.
