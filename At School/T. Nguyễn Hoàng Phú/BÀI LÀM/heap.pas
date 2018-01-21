const fileinp = 'heap.inp';
      fileout = 'heap.out';
      maxN = 1000;

var n,nheap:longint;
    d,h:array[1..maxN] of longint;

procedure Upheap(u:longint);
var v,w,tmp:longint;
begin
  v:=u; tmp:=h[u];
  while v >= 2 do
    begin
      w:=v div 2;
      if d[h[w]] <= d[tmp] then break;
      h[v]:=h[w];
      v:=w;
    end;
  h[v]:=tmp;
end;

procedure DownHeap(u:longint);
var v,w,tmp:longint;
begin
  v:=u; tmp:=h[u];
  while v*2 <= nheap do
    begin
      w:=v*2;
      if (w < nheap) and (d[h[w]] > d[h[w+1]]) then inc(w);
      if d[h[w]] >= d[tmp] then break;
      h[v]:=h[w];
      v:=w;
    end;
  h[v]:=tmp;
end;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  nheap:=n;
  for i:=1 to n do
   begin
     read(d[i]);
     h[i]:=i;
     Upheap(i);
   end;
  close(input);
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to n do
    begin
      writeln(d[h[1]]);
      h[1]:=h[nheap];
      dec(nheap);
      DownHeap(1);
    end;
  close(output);
end;


begin
  Init;
  Print;
end.