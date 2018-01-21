const fileinp = 'bs2509.inp';
      fileout = 'bs2509.out';

var a:array[1..1000000] of longint;
    key,i,found,n,m:longint;

procedure Search(l,r:longint);
var pivot,middle:longint;
begin
  if l>r then exit;
  pivot:=a[(l+r) div 2];
  middle:=(l+r) div 2;
  if pivot = key then
    begin
      found:=1;
      exit;
    end
  else
    begin
      if key < pivot then search(l,middle-1);
      if key > pivot then search(middle+1,r)
    end;
end;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n,m);
  for i:=1 to n do readln(a[i]);
  for i:=1 to m do
    begin
      found:=0;
      readln(key);
      search(1,n);
      writeln(found);
    end;
  close(input); close(output);
end.
