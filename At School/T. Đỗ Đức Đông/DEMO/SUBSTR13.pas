const fileinp = 'substr13.inp';
      fileout = 'substr13.out';
      maxN = 200;

var m,n,k:longint;
    x,y:string;
    s:array[1..maxN] of string;
    NextX,NextY:array[0..maxN,'a'..'z'] of longint;
    w:array[1..maxN+1,0..maxN,0..maxN] of int64;


function Calculate(i,p1,p2:longint):int64;
var rs:int64;
     c:char;
begin
  if w[i,p1,p2] > -1 then exit(w[i,p1,p2]);
  if i > n then
    begin
      w[i,p1,p2]:=ord((p1 <= length(x)) and (p2 = length(y)+1));
      exit(w[i,p1,p2]);
    end;
  rs:=0;
  for c:='a' to 'z' do
    rs:=rs + Calculate(i+1,NextX[p1,c],NextY[p2,c]);
  rs:=rs mod k;
  w[i,p1,p2]:=rs;
  exit(rs);
end;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(m,n,k);
  readln(x);
  readln(y);
  for i:=1 to m do
    begin
      readln(S[i]);
    end;
  close(input);
  fillchar(w,sizeof(w),255);
end;

procedure NextCalc;
var i,j,v:longint;
    c:char;
begin
  for i:=0 to length(x)+1 do
    begin
      for c:='a' to 'z' do
        begin
          v:=length(x)+1;
          for j:=i+1 to length(x)+1 do
            if x[j] = c then
              begin
                v:=j;
                break;
              end;
          NextX[i,c]:=v;
        end;
    end;
  for i:=0 to length(y)+1 do
    begin
      for c:='a' to 'z' do
        begin
          v:=length(y)+1;
          for j:=i+1 to length(y)+1 do
            if y[j] = c then
              begin
                v:=j;
                break;
              end;
          NextY[i,c]:=v;
        end;
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to m do
    writeln();
  close(output);
end;

begin
  Init;
  NextCalc;
  Print;
end.