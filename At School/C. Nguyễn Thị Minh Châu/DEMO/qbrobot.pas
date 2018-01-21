const fileinp='qbrobot.inp';
      fileout='qbrobot.out';
      maxN= 500;

var   a:array[1..maxN, 1..maxN] of boolean;
      free:array[1..maxN] of boolean;
      t,c:array[1..maxN, 1..maxN] of longint;
      b:array[1..maxN] of byte;
      d,w:array[0..maxN] of longint;
      n,m,res,s: longint;
      p:longint;

procedure init;
var i,j,u,v:longint;
begin
   readln(n);
   fillchar(a, sizeof(a), false);
   for i:= 1 to n do read(b[i]);
   readln(m);
   for i:= 1 to m do
      begin
         readln(u, v, t[u, v], c[u, v]);
         a[u, v]:= true;
         a[v, u]:= true;
         t[v, u]:= t[u, v];
         c[v, u]:= c[u, v];
         s:= s+ c[u, v];
      end;
end;

procedure enter;
var i: longint;
begin
   for i:= 0 to n do d[i]:= maxlongint;
   d[1]:= 0;
   fillchar(free, sizeof(free), true);
end;

procedure Dijkstra;
var u, v, i, min: longint;
begin
   repeat
      u:= 0;
      min:=maxlongint;
      for v:= 1 to n do
         if free[v] and (d[v]< min) then
           begin
             min:=d[v];
             u:= v;
           end;
      if (u= 0) or (u= n) then break;
      free[u]:= false;
      for v:= 1 to n do
         if a[u, v] and (d[v]> d[u]+ t[u, v]) and (w[u]>= c[u, v]) then
            begin
               if b[v]= 1 then w[v]:= w[1]
               else
                  w[v]:= w[u]- c[u, v];
               d[v]:= d[u]+ t[u, v];
            end;
   until false;
end;

function check(x: longint): boolean;
var i, j: longint;
begin
   fillchar(w, sizeof(w), 0);
   w[1]:= x;
   enter;
   dijkstra;
   if d[n]= p then
      exit(true);
   exit(false);
end;

procedure processing;
var i, j, mid: longint;
begin
   i:= 0;
   j:= s;
   while i<= j do
      begin
         mid:= (i+ j) div 2;
         if check(mid) then
            begin
               res:= mid;
               j:= mid- 1;
            end
         else
            i:= mid+ 1;
      end;
end;

procedure analyse;
begin
   w[1]:= s;
   enter;
   dijkstra;
   p:= d[n];
end;

begin
   assign(input, fileinp); reset(input);
   assign(output,fileout); rewrite(output);
   init;
   analyse;
   processing;
   writeln(res);
   close(input); close(output);
end.
