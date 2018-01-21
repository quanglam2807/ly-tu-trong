const fileinp = 'goorstay.inp';
      fileout = 'goorstay.out';

var count:array['A'..'Z'] of longint;
    s1,s2:string;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(s1);
  readln(s2);
  close(input);
end;

procedure Analyse;
var i:longint;
begin
  fillchar(count,sizeof(count),0);
  for i:=1 to length(s1) do
    inc(count[s1[i]]);
  for i:=1 to length(s2) do
    dec(count[s2[i]]);
end;

procedure Print;
var i:char;
begin
  assign(output,fileout); rewrite(output);
  for i:='A' to 'Z' do
    if count[i] <> 0 then
      begin
        writeln('STAY');
        halt;
      end;
  writeln('GO');
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.