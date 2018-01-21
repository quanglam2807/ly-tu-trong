{
ID: nghoang4
PROG: gift1
LANG: PASCAL
}
const fileinp = 'gift1.in';
      fileout = 'gift1.out';
      maxN = 10;

type Str14 = string[14];
     MyData = record
                ten: Str14;
                tien: integer;
              end;

var a: array[1..maxN] of MyData;
    n, i, j, m, k: integer;
    s: str14;

procedure Change(s: Str14; m: integer);
var i: integer;
begin
  for i:=1 to n do
    if a[i].ten = s then
      begin
        inc(a[i].tien,m);
        break;
      end;
end;

begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(a[i].ten);
      a[i].tien:=0;
    end;
  for j:=1 to n do
    begin
      readln(s);
      readln(m,k);
      if k > 0 then Change(s,-(m - m mod k));
      for i:=1 to k do
        begin
          readln(s);
          Change(s,m div k);
        end;
    end;
  for i:=1 to n do writeln(a[i].ten,' ',a[i].tien);
  close(input); close(output);
end.

