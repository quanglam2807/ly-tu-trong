const fileinp = 'bigsmart.inp';
      fileout = 'bigsmart.out';

var t,n:longint;
    w,s,a,k,trace:array[1..1000] of longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  t:=0;
  while not eof do
    begin
      inc(t);
      readln(w[t],s[t]);
      a[t]:=t;
    end;
  close(input);
end;

procedure QSort(l,r:longint);
var i,j,key,tmp:longint;
begin
  if l>r then exit;
  i:=l;
  j:=r;
  key:=w[a[(l+r) div 2]];
  repeat
    while w[a[i]] < key do inc(i);
    while w[a[j]] > key do dec(j);
    if i <= j then
      begin
        tmp:=a[i];
        a[i]:=a[j];
        a[j]:=tmp;
        inc(i); dec(j);
      end;
  until i>j;
  QSort(l,j); QSort(i,r);
end;

procedure Analyse;
var i,j,max:longint;
begin
  QSort(1,t);
  fillchar(k,sizeof(k),0);
  k[a[1]]:=1;
  trace[a[1]]:=0;
  n:=1;
  for i:=2 to t do
    begin
      max:=1;
      trace[a[i]]:=0;
      for j:=i-1 downto 1 do
        if (s[a[i]] < s[a[j]]) and (k[a[j]]+1 > max) then
          begin
            max:=k[a[j]]+1;
            trace[a[i]]:=a[j];
          end;
      k[a[i]]:=max;
      if (k[a[i]] > k[a[n]]) then n:=i;
    end;
end;

procedure Print;
var i,count:longint;
    b:array[1..1000] of longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(k[a[n]]);
  i:=a[n];
  count:=0;
  while i <> 0 do
    begin
      inc(count);
      b[count]:=i;
      i:=trace[i];
    end;
  for i:=count downto 1 do writeln(b[i]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
