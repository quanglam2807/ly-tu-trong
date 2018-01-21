const   fi = 'facebook_hackercup_Ex1.txt';
        fo = 'facebook_hackercup_Ex1.out';
        maxN = 20;

var     a : array [1..maxN,1..maxN] of char;
        n : longint;
        top,left,bottom,right : longint;
        T,test : longint;

procedure ReadInput;
var     i,j : longint;
begin
  readln(n);
  for i:=1 to n do
    begin
      for j:=1 to n do read(a[i,j]);
      readln;
    end;
end;

procedure findTopLeft;
var     i,j : longint;
begin
  for i:=1 to n do
    for j:=1 to n do
      if a[i,j]='#' then
        begin
          top:=i;
          left:=j;
          exit;
        end;
end;

procedure findBottomRight;
var     i,j : longint;
begin
  for i:=n downto 1 do
    for j:=n downto 1 do
      if a[i,j]='#' then
        begin
          bottom:=i;
          right:=j;
          exit;
        end;
end;

function check : boolean;
var     i,j : longint;
begin
  if bottom-top<>right-left then exit(false);
  for i:=top to bottom do
    for j:=left to right do
      if a[i,j]='.' then exit(false);
  exit(true);
end;

begin
  assign(input,fi);  reset(input);
  assign(output,fo);  rewrite(output);
  readln(T);
  for test:=1 to T do
    begin
      ReadInput;
      findTopLeft;
      findBottomRight;
      write('Case #',test,': ');
      if check then writeln('YES')
      else writeln('NO');
    end;
  close(input);  close(output);
end.
