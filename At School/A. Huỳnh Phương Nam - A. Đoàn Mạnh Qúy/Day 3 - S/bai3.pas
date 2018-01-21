const fileinp = 'bai3.inp';
      fileout = 'bai3.out';

var n,count:longint;
    cot,sac,huyen:array[-100000..100000] of boolean;
    a:array[1..100000] of longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

procedure Generate(i:longint);
var j:longint;
begin
  for j:=1 to n do
    if cot[j] and sac[i+j] and huyen[i-j] then
      begin
        a[i]:=j;
        cot[j]:=false;
        sac[i+j]:=false;
        huyen[i-j]:=false;
        if i = n then inc(count)
        else Generate(i+1);
        cot[j]:=true;
        sac[i+j]:=true;
        huyen[i-j]:=true;
      end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  close(output);
end;

begin
  Init;
  fillchar(cot,sizeof(cot),true);
  fillchar(sac,sizeof(sac),true);
  fillchar(huyen,sizeof(huyen),true);
  Generate(1);
  Print;
end.