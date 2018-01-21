const fileinp = 'schedule.inp';
      fileout = 'schedule.out';
         maxN = 100001;


type kh = record
           a,b,c:int64;
          end;

var n:longint;
    k:array[1..maxN] of kh;
    sum:string;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(k[i].a);
  readln;
  for i:=1 to n do read(k[i].b);
  for i:=1 to n do k[i].c:=i;
  close(input);
end;


function less(i,j : longint):boolean;
var     x,y : int64;
begin
  x:=k[i].b*k[j].a;
  y:=k[i].a*k[j].b;
  exit(x<y);
end;


procedure QSort(l,r:longint);
var i,j:longint;
    p:longint;
    tmp:kh;
begin
  if l >= r then exit;
  i:=l;
  j:=r;
  p:=random(r-l+1)+l;
  k[n+1]:=k[p];
  while i <= j do
    begin
      while Less(i,n+1)  do
        inc(i);
      while Less(n+1,j) do
        dec(j);
      if i <= j then
        begin
          tmp:=k[i];
          k[i]:=k[j];
          k[j]:=tmp;
          inc(i); dec(j);
        end;
    end;
  QSort(l,j); QSort(i,r);
end;

function cong(s : string; x:int64):string;
var     t : string;
        l,r,mem,k,i : longint;
        c:  char;
begin
  str(x,t);
  l:=1;  r:=length(t);
  while l<r do
    begin
      c:=t[l];
      t[l]:=t[r];
      t[r]:=c;
      inc(l);
      dec(r);
    end;

  for i:=length(t)+1 to length(s) do t:=t+'0';
  for i:=length(s)+1 to length(t) do s:=s+'0';

  mem:=0;
  for i:=1 to length(t) do
    begin
      k:=(ord(s[i])+ord(t[i])-96+mem) mod 10;
      mem:=(ord(s[i])+ord(t[i])-96+mem) div 10;
      s[i]:=chr(k+48);
    end;
  if mem>0 then s:=s+chr(mem+48);
  exit(s);
end;


procedure Analyse;
var i:longint;
    day:int64;
begin
  QSort(1,n);
  sum:='';
  day:=0;
  for i:=1 to n do
    begin
      day:=day + k[i].b;
      sum:=cong(sum,k[i].a*day);
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=length(sum) downto 1 do
    write(sum[i]);
  writeln;
  for i:=1 to n do
    write(k[i].c,' ');
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
