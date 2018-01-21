const fileinp = 'mahoa2.inp';
      fileout = 'mahoa2.out';

var ss:string;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(ss);
  close(input);
end;



function Count(s:string):longint;
var m,i:longint;
begin
  Count:=0;
  for i:=1 to length(s) div 2 do
    begin
      if length(s) - i = i then continue;
      if copy(s,1,i) = copy(s,i+1,i) then
        begin
          inc(Count);
          inc(Count,Count(copy(s,i+1,length(s)-i)));
        end;
      if copy(s,1,i) = copy(s,length(s)-i+1,i) then
        begin
          inc(Count);
          inc(Count,Count(copy(s,1,length(s)-i)));
        end;
      if copy(s,1,i) = copy(s,length(s)-i+1,i) then
        begin
          inc(Count);
          inc(Count,Count(copy(s,i+1,length(s)-i)));
        end;
      if copy(s,length(s)-2*i+1,i) = copy(s,length(s)-i+1,i) then
        begin
          inc(Count);
          inc(Count,Count(copy(s,1,length(s)-i)));
        end;
    end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(Count(ss) mod 2014);
  close(output);
end;


begin
  Init;
  Print;
end.
