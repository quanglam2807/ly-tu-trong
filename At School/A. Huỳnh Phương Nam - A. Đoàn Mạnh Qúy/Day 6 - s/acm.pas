const fileinp = 'acm.inp';
      fileout = 'acm.out';

var t,n,l:longint;
    c:array[1..1000] of longint;

procedure Analyse;
var a:array[0..1000,0..1000] of longint;
    i,j,k,min:longint;
begin
  fillchar(a,sizeof(a),0);
 {
  for i:=l-1 downto 0 do
    for j:=i+1 to l do
      begin
        min:=maxlongint;
        for k:=1 to n do
          if a[i,c[k]] + a[c[k],j] < min then
            min:=a[i,c[k]]+a[c[k],j];
        a[i,j]:=min+(j-i);
      end;   }
  writeln('The minimum cutting is ',a[0,l]);
end;

procedure Init;
var tmp,i:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  t:=0;
  repeat
    readln(l);
    if l = 0 then break;
    readln(n);
    i:=0;
    for i:=1 to n do read(c[i]);
    Analyse;
    readln;
  until false;
  close(input);  close(output);
end;

begin
  Init;
end.