const fileinp = 'giaithua.inp';
      fileout = 'giaithua.out';

var n,res,i:longint;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n);
  res:=1;
  for i:=2 to n do
    res:=res * i;
  writeln(res);
  close(input); close(output);
end.