const fileinp = 'mahoa2.inp';
      fileout = 'mahoa2.out';

type mytype = ^node;
     node = record
             str:string;
             int:longint;
             next:mytype;
            end;

var ss:string;
    f:mytype;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(ss);
  close(input);

  new(f);
  f^.next:=nil;
end;


function Find(s:string;var ans:longint):boolean;
var p:mytype;
begin
  p:=f^.next;
  while p <> nil do
    begin
      if p^.str = s then
        begin
          ans:=p^.int;
          exit(true);
        end;
      p:=p^.next;
    end;
  exit(false);
end;

function Count(s:string):longint;
var m,i,x:longint;
    g,p:mytype;
begin
  if Find(s,x) then exit(x);
  Count:=0;
  for i:=1 to length(s) div 2 do
    begin
      if length(s) - i = i then continue;
      if copy(s,1,i) = copy(s,i+1,i) then
        begin
          inc(Count);
          inc(Count,Count(copy(s,i+1,length(s)-i)));
        end;
      if copy(s,1,i) = copy(s,length(s)-i+1,i) then
        begin
          inc(Count);
          inc(Count,Count(copy(s,1,length(s)-i)));
        end;
      if copy(s,1,i) = copy(s,length(s)-i+1,i) then
        begin
          inc(Count);
          inc(Count,Count(copy(s,i+1,length(s)-i)));
        end;
      if copy(s,length(s)-2*i+1,i) = copy(s,length(s)-i+1,i) then
        begin
          inc(Count);
          inc(Count,Count(copy(s,1,length(s)-i)));
        end;
    end;
  new(p);
  p^.str:=s;
  p^.int:=Count;
  p^.next:=nil;
  g:=f;
  while g^.next <> nil do g:=g^.next;
  g^.next:=p;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(Count(ss) mod 2014);
  close(output);
end;


begin
  Init;
  Print;
end.
