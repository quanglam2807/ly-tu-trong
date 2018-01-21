const fi = 'mahoa2.inp';
      fo = 'mahoa2.out';

type MyType = ^Node;
     Node = record
              str: string;
              int: longint;
              next: MyType;
            end;

var f: MyType;
    s: string;
    res: longint;


function find(s: string; var ans: longint): boolean;
var p: MyType;
begin
  p:=f;
  while p^.next <> nil do
    begin
      if p^.next^.str =  s then
        begin
          ans:=p^.next^.int;
          exit(true);
        end;
      p:=p^.next;
    end;
  exit(false);
end;

function Count(s: string): longint;
var p, g: MyType;
    ans, i, l, x: longint;
begin
  if find(s,x) then exit(x);
  ans:=1;
  l:=length(s);
  for i:=1 to (l+1) div 2 - 1 do
    begin
      if copy(s,1,i) = copy(s,i+1,i) then inc(ans,Count(copy(s,i+1,l-i)));
      if copy(s,1,i) = copy(s,l-i+1,i) then inc(ans,Count(copy(s,i+1,l-i)));
      if copy(s,l-i+1,i) = copy(s,1,i) then inc(ans,Count(copy(s,1,l-i)));
      if copy(s,l-i+1,i) = copy(s,l-2*i+1,i) then inc(ans,Count(copy(s,1,l-i)));
    end;
  ans:=ans mod 2014;
  new(p);
  p^.str:=s;
  p^.int:=ans;
  p^.next:=nil;
  g:=f;
  while g^.next <> nil do g:=g^.next;
  g^.next:=p;
  //dispose(p);
  exit(ans);
end;

begin
  assign(input,fi); reset(input);
  assign(output,fo); rewrite(output);
  readln(s);
  new(f);
  f^.next:=nil;
  res:=(Count(s)-1) mod 2014;
  dispose(f);
  writeln(res);
  close(input); close(output);
end.
