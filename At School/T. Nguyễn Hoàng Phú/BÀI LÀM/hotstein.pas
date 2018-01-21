{
ID: nhutqua1
PROG: holstein
LANG: PASCAL
}

const fileinp = 'holstein.in';
      fileout = 'holstein.out';
      maxV = 25;
      maxG = 15;

var v,g,min,c:longint;
    vitamin:array[1..maxV] of longint;
    food:array[1..maxG,1..maxV] of longint;
    q:array[1..maxG] of longint;
    res:array[1..maxG] of longint;

procedure Init;
var i,j:longint;
begin
  assign(input,fileinp); reset(input);
  readln(v);
  for i:=1 to v do read(vitamin[i]);
  readln;
  readln(g);
  for i:=1 to g do
    begin
      for j:=1 to v do read(food[i,j]);
      readln;
    end;
  close(input);
end;

procedure Check;
var count,i,j:longint;
    vit:array[1..maxV] of longint;
begin
  count:=0;
  fillchar(vit,sizeof(vit),0);
  for i:=1 to g do
    if q[i] = 1 then
      begin
        inc(count);
        for j:=1 to v do
          inc(vit[j],food[i,j]);
      end;
  for i:=1 to v do
    if vit[i] < vitamin[i] then
      exit;
  if count < min then
    begin
      for i:=1 to g do
        res[i]:=q[i];
      min:=count;
    end;
end;

procedure Generate(i:longint);
var j:longint;
begin
  if i > g then
    begin
      Check;
      exit;
    end;
  for j:=1 downto 0 do
    begin
      q[i]:=j;
      Generate(i+1);
    end;
end;

procedure Analyse;
begin
  min:=maxlongint;
  Generate(1);
end;

procedure Print;
var i,count,t:longint;
    w:array[1..maxG] of longint;
begin
  assign(output,fileout); rewrite(output);
  write(min,' ');
  t:=0;
  for i:=1 to g do
    if res[i] = 1 then
      begin
        inc(t);
        w[t]:=i;
      end;
  for i:=1 to t-1 do
    write(w[i],' ');
  writeln(w[t]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
