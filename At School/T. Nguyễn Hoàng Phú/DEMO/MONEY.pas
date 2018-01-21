{
ID: nhutqua1
PROG: money
LANG: PASCAL
}


var m:array[1..25] of longint;
    v,n:integer;
procedure init;
  var i:integer;
  begin
    readln(v,n);
    for i:=1 to v do
      read(m[i]);
  end;

procedure work;
  var f:array[0..25,0..10000] of int64;
      i,j:integer;
  begin
    fillchar(f,sizeof(f),0);
    for i:=0 to v do
      f[i,0]:=1;
    for i:=1 to v do
      for j:=1 to n do
        if j-m[i]>=0 then f[i,j]:=f[i-1,j]+f[i,j-m[i]] else f[i,j]:=f[i-1,j];
    writeln(f[v,n]);
  end;

begin
  assign(input,'money.in');
  assign(output,'money.out');
  reset(input);
  rewrite(output);
  init;
  work;
  close(input);
  close(output);
end.
