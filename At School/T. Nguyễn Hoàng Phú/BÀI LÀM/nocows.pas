

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n,k);
  close(input);
end;

procedure Solve;
var i,j,l:integer;
begin
  fillchar(f,sizeof(f),0);
  for i:=1 to k do f[1,i]:=1;
  for i:=1 to k do
    for j:=1 to n div 2 do
      for l:=1 to j do
        begin
          f[2*j+1,i]:=f[2*j+1,i] + f[2*l-1,i-1]*f[2*j-2*l+1,i-1];
          f[2*j+1,i]:=f[2*j+1,i] mod 9901;
        end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(f[n,k] - f[n,k-1]);
  close(output);
end;