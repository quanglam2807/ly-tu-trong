{
ID: nhutqua1
PROG: nocows
LANG: PASCAL
}
var n,k:integer;
procedure work;
  var f:array[0..100,0..200] of longint;
      st:array[0..100,0..200] of longint;
      i,j,s:integer;
  begin
    fillchar(f,sizeof(f),0);
    fillchar(st,sizeof(st),0);
    f[1,1]:=1;
    for i:=2 to k do
      for j:=1 to n do
        begin
          for s:=1 to j-1 do
            begin
             f[i,j]:=(f[i,j]+st[i-2,s]*f[i-1,j-s-1]) mod 9901;
             f[i,j]:=(f[i,j]+f[i-1,s]*st[i-2,j-s-1]) mod 9901;
             f[i,j]:=(f[i,j]+f[i-1,s]*f[i-1,j-s-1]) mod 9901;
            end;
          st[i-1,j]:=(st[i-2,j]+f[i-1,j]) mod 9901;
        end;
    writeln(f[k,n]);
  end;

begin
  assign(input,'nocows.in');
  assign(output,'nocows.out');
  reset(input);
  rewrite(output);
  readln(n,k);
  work;
  close(input);
  close(output);
end.
