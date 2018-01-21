uses math;

const fileinp = 'bridges.inp';
      fileout = 'bridges.out';

var n,m,res:longint;
    f:array[0..1000000] of boolean;

procedure Init;
var c,u,v,t:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  c:=n;
  for res:=1 to m do
    begin
      readln(u,v);
      if u = v then continue;
      if not f[u] then
        begin
          f[u]:=true;
          dec(c);
        end;
      if not f[v] then
        begin
          f[v]:=true;
          dec(c);
        end;
      if c = 0 then exit;
    end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(res);
  close(output);
end;

begin
  Init;
  Print;
end.
