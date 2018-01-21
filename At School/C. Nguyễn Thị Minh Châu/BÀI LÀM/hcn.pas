const fileinp = 'hcn.inp';
      fileout = 'hcn.out';

var x1,y1,x2,y2,m,n:longint;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(x1,y1,x2,y2);
  m:=abs(y2-y1);
  n:=abs(x2-x1);
  writeln((m+n)*2);
  writeln(m*n);
  close(input);  close(output);
end.