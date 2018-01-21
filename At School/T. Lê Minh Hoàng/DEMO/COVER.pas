const
  finp='cover.inp';
  fout='cover.out';
  maxn=100000;
var
  a,b,n,count: longint;
  vt,l,h: array [1..maxn] of longint;
  select: array [1..maxn] of boolean;

procedure qsort(low,high: longint);
var i,j,t,p: longint;
begin
  if low>=high then exit;
  i:=low;j:=high;
  p:=l[(i+j) div 2];
  repeat
    while p>l[i] do i:=i+1;
    while p<l[j] do j:=j-1;

    if i<=j then
      begin
        t:=l[i];
        l[i]:=l[j];
        l[j]:=t;

        t:=h[i];
        h[i]:=h[j];
        h[j]:=t;

        t:=vt[i];
        vt[i]:=vt[j];
        vt[j]:=t;

        i:=i+1;
        j:=j-1;
      end;
  until i>j;

  qsort(low,j);
  qsort(i,high);
end;

procedure init;
var i: longint;
begin
  assign(input,finp);reset(input);
  readln(n,a,b);
  for i:=1 to n do
    begin
      readln(l[i],h[i]);
      vt[i]:=i;
    end;
  qsort(1,n);
  fillchar(select,sizeof(select),false);
  count:=0;
  close(input);
end;

procedure solve;
var i,j,t,R,k: longint;
begin
  i:=1;
  repeat
    j:=i;
    while (i<=n) and (l[i]<=a) do
      inc(i);

    R:=-maxlongint;t:=0;
    for k:=j to i-1 do
      if R<h[k] then
        begin
          R:=h[k];
          t:=k;
        end;

    if t=0 then break;

    select[t]:=true;
    inc(count);
    a:=R;
  until (i>n) or (a>=b);
end;

procedure print;
var i: longint;
begin
  assign(output,fout);rewrite(output);
  if a<b then write(-1)
  else
    begin
      writeln(count);
      for i:=1 to n do
        if select[i] then writeln(vt[i]);
    end;
  close(output);
end;

begin
  init;
  solve;
  print;
end.