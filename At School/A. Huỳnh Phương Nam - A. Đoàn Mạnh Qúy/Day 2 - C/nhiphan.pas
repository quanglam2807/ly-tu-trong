const fileinp = 'nhiphan.inp';
      fileout = 'nhiphan.out';

var n,k:longint;
    s:array[1..1000] of char;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

function Check:boolean;
var kq:boolean;
    i:longint;
begin
  kq:=true;
  for i:=2 to n do
    if (s[i] = s[i-1]) and (s[i]='1') then kq:=false;
  exit(kq);
end;

procedure AnalysePrint;
var i,j:longint;
    stop:boolean;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to n do s[i]:='0';
  while  i>0 do
    begin
      if Check then
        begin
          for j:=1 to n do write(s[j]);
          writeln;
        end;
      i:=n;
      while (i>0) and (s[i]='1') do dec(i);
      if i<=0 then exit;
      s[i]:='1';
      for j:=i+1 to n do s[j]:='0';
    end;
  close(output);
end;

begin
  Init;
  AnalysePrint;
end.
