{
ID: nhutqua1
PROG: transform
LANG: PASCAL
}

const fileinp = 'transform.in';
      fileout = 'transform.out';

var a,b:array[1..10,1..10] of char;
    n:longint;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do
    begin
      for j:=1 to n do read(a[i,j]);
      readln;
    end;
  for i:=1 to n do
    begin
      for j:=1 to n do read(b[i,j]);
      readln;
    end;
  close(input);
end;

function OK(t:longint):boolean;
var i,j:longint;
begin
  case t of
    1: begin
       for i:=1 to n do
         for j:=1 to n do
           if a[i,j] <> b[j,n-i+1] then
             exit(false);
       end;
    2: begin
       for i:=1 to n do
         for j:=1 to n do
           if a[i,j] <> b[n-i+1,n-j+1] then
             exit(false);
       end;
    3: begin
       for i:=1 to n do
         for j:=1 to n do
           if a[i,j] <> b[n-j+1,i] then
             exit(false);
       end;
    4: begin
       for i:=1 to n do
         for j:=1 to n do
           if a[i,j] <> b[i,n-j+1] then
             exit(false);
       end;
    5: begin
       for i:=1 to n do
         for j:=1 to n do
           if a[i,j] <> b[n-j+1,n-i+1] then
             exit(false);
       end;
    6: begin
       for i:=1 to n do
         for j:=1 to n do
           if a[i,j] <> b[i,j] then
             exit(false);
       end;
    8: begin
       for i:=1 to n do
         for j:=1 to n do
           if a[i,j] <> b[n-i+1,j] then
             exit(false);
       end;
    9: begin
       for i:=1 to n do
         for j:=1 to n do
           if a[i,j] <> b[j,i] then
             exit(false);
       end;
  end;
  exit(true);
end;

procedure Print(i:longint);
begin
  assign(output,fileout); rewrite(output);
  writeln(i);
  close(output);
  halt;
end;

procedure Analyse;
var i:longint;
begin
  for i:=1 to 6 do
    if OK(i) then Print(i);
  if OK(8) or OK(9) then Print(5)
  else Print(7);
end;

begin
  Init;
  Analyse;
end.