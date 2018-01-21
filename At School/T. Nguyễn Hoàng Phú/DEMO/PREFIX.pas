{
ID: nhutqua1
PROG: prefix
LANG: PASCAL
}
var a:array[1..1000] of string[10];
    f:array[0..2000000] of boolean;
    tot,l:longint;
    s,temps:ansistring;
procedure init;
 var ch:char;
     i:longint;
 begin
  assign(input,'prefix.in'); reset(input);
  assign(output,'prefix.out'); rewrite(output);
  read(ch);
  tot:=0;
  s:='';
  while ch<>'.' do
   begin
    while (ch<>' ') and (ch<>'.') and (not eoln) do
     begin
      s:=s+ch;
      read(ch);
     end;
    inc(tot);
    a[tot]:=s;
    s:='';
    if eoln then
     begin
      a[tot]:=a[tot]+ch;
      readln;
     end;
    if ch='.' then break;
    read(ch);
   end;
  s:='';
  while not eof do
   begin
    readln(temps);
    s:=s+temps;
   end;
  close(input);
 end;
procedure dp;
 var i,j,k:longint;
 begin
  fillchar(f,sizeof(f),false);
  l:=length(s);
  for i:=1 to tot do
   for j:=length(a[i]) to l do
    if (copy(s,j-length(a[i])+1,length(a[i]))=a[i]) then
     for k:=j-length(a[i])+1 to j do
      f[k]:=true;
 end;
procedure print;
 var i:longint;
 begin
  i:=1;
  while (f[i]=true) and (i<=l) do inc(i);
  writeln(i-1);
  close(output);
 end;
begin
 init;
 dp;
 print;
end.
