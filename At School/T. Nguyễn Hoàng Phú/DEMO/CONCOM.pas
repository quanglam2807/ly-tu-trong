{
ID: nhutqua1
PROG: concom
LANG: PASCAL
}
var
  n,i:word;
  a,b,c,m:byte;
  vis,own:array[1..100]of boolean;
  cx:array[1..100]of byte;
  con:array[1..100,1..100]of byte;
//
procedure DFS (s:byte);
var
  i:byte;
begin
  if vis[s] then
    exit;
  vis[s]:=true;
  for i:=1 to m do
  begin
    inc(cx[i],con[s,i]);
    if cx[i]>50 then
    begin
      own[i]:=true;
      DFS(i);
    end;
  end;
end;
//
begin
  assign(input,'concom.in');
  assign(output,'concom.out');
  reset(input);
  rewrite(output);
  readln(n);
  for i:=1 to n do
  begin
    readln(a,b,c);
    if a>m then
      m:=a;
    if b>m then
      m:=b;
    inc(con[a,b],c);
  end;
  for a:=1 to m do
  begin
    fillchar(cx,sizeof(cx),0);
    fillchar(vis,sizeof(vis),false);
    fillchar(own,sizeof(own),false);
    own[a]:=true;
    DFS(a);
    for b:=1 to m do
      if own[b] and (b<>a) then
        writeln(a,' ',b);
  end;
  close(output);
end.
{
TASK: concom
LANG: PASCAL
}
var
  n,i,j,a,b,p:longint;
  f:array[0..101,0..101] of longint;
  vis2,vis3:array[0..101,0..101] of boolean;
  vis:array[0..100,0..100,0..100] of boolean;
procedure floyd;
var
  i,j,k,p:longint;
  flag:boolean;
  begin
   for p:=1 to 10  do
    for k:=100 downto 1 do
      for i:=100 downto 1 do
        if i<>k then
       for j:=100 downto 1 do
         if (j<>k) and (j<>i) then
           if (f[i,k]>=50) and (not vis[i,k,j]) then
            begin
             if f[i,j]<100 then      //????
              f[i,j]:=f[i,j]+f[k,j];
              vis[i,k,j]:=true;
            end;
  end;

begin
  assign(input,'concom.in');
  assign(output,'concom.out');
  reset(input);
  rewrite(output);
  fillchar(vis,sizeof(vis),false);
  readln(n);
  for i:=1 to n do
    begin
      readln(a,b,p);
      f[a,b]:=f[a,b]+p;
    end;
  floyd;
  for i:=1 to 100 do
    for j:=1 to 100 do
      if (f[i,j]>=50) and (i<>j) then
        writeln(i,' ',j);
  close(input);
  close(output);
end.
