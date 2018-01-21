uses math,windows;

const fileinp = 'bseq.inp';
      fileout = 'bseq.out';
      maxN = 5000;

var m,n,time,kq:longint;
    a,b,q:array[1..maxN] of longint;


procedure Init;
var i:longint;
begin
  time:=gettickcount;
  assign(input,fileinp); reset(input);
  readln(m,n);
  for i:=1 to n do read(a[i]);
  readln;
  for i:=1 to m do
    read(b[i]);
  close(input);
  kq:=0;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(kq);
  close(output);
  halt;
end;

procedure PrintFail;
begin
  assign(output,fileout); rewrite(output);
  writeln(math.min(m,n));
  close(output);
  halt;
end;

procedure Check;
var counta,countb,i,j:longint;
    free:array[1..maxN] of boolean;
    cur,status:char;
begin
  fillchar(free,sizeof(free),true);
  counta:=0;
  countb:=0;
  for i:=1 to m do
    if q[i] = 1 then
      inc(counta);
  for i:=m+1 to m+n do
    if q[i] = 1 then
      inc(countb);
  if counta <> countb then exit;

  cur:='=';
  for i:=1 to m do
    if q[i] = 1 then
      begin
        for j:=m+i+1 to m+n do
          if (q[j] = 1) and (free[j]) then
            begin
              if a[i] > b[i] then status:='>';
              if a[i] < b[i] then status:='<';
              if a[i] = b[i] then status:='=';
              if (status <> cur) and (status <> '=') then
                exit;
              cur:=status;
              free[j]:=false;
              break;
            end;
      end;
  if counta > kq then kq:=counta;
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > m+n then
    begin
      Check;
      exit;
    end;
  for j:=0 to 1 do
    begin
      q[i]:=j;
      if gettickcount - time > 500 then PrintFail;
      Generate(i+1);
    end;
end;

begin
  Init;
  kq:=0;
  Generate(1);
  PrintFail;
end.
