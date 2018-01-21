{
ID: nhutqua1
PROG: namenum
LANG: PASCAL
}

const fileinp = 'namenum.in';
      fileout = 'namenum.out';
      filedic = 'dict.txt';

var l,dici,count:longint;
    c:array[1..12] of char;
    d:array[1..5000] of string;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  l:=0;
  while not eoln do
    begin
      inc(l);
      read(c[l]);
    end;
  close(input);

  assign(input,filedic); reset(input);
  dici:=0;
  while not eof do
    begin
      inc(dici);
      readln(d[dici]);
    end;
  close(input);
end;

function OK(i:longint):boolean;
var j:longint;
    num:char;
begin
  for j:=1 to l do
  begin
     case d[i][j] of
        'A','B','C': num:='2';
        'D','E','F': num:='3';
        'G','H','I': num:='4';
        'J','K','L': num:='5';
        'M','N','O': num:='6';
        'P','R','S': num:='7';
        'T','U','V': num:='8';
        'w','x','Y': num:='9';
        'Q','Z'    : num:='0';
      end;
     if num <> c[j] then exit(false);
  end;
  exit(true);
end;

procedure Analyse;
var i,count:longint;
begin
  assign(output,fileout); rewrite(output);
  count:=0;
  for i:=1 to dici do
    begin
      if length(d[i]) <> l then continue;
      if OK(i) then
        begin
          writeln(d[i]);
          inc(count);
        end;
    end;
  if count = 0 then writeln('NONE');
  close(output);
end;

begin
  Init;
  Analyse;
end.
