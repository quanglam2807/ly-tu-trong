{
ID: nhutqua1
PROG: castle
LANG: PASCAL
}


const fileinp = 'castle.inp';
      fileout = 'castle.out';
      maxN = 1000;
      navx:array[1..4] of longint = (0,0,-1,1);
      navy:array[1..4] of longint = (-1,1,0,0);

type direction = record
                   west,north,east,south:longint;
                 end;

var num:array[0..15] of direction;
    m,n,maxsize,count,max,resx,resy:longint;
    ress:char;
    gt,stt:array[1..maxN,1..maxN] of longint;
    free:array[1..maxN,1..maxN] of boolean;
    dt:array[0..maxN*maxN] of longint;

procedure Generate;
var west,north,east,south,sum:longint;
begin
  for west:=0 to 1 do
    for north:=0 to 1 do
      for east:=0 to 1 do
        for south:=0 to 1 do
          begin
            sum:=0;
            if west = 1 then inc(sum,1);
            if north = 1 then inc(sum,2);
            if east = 1 then inc(sum,4);
            if south = 1 then inc(sum,8);
            num[sum].west:=west;
            num[sum].north:=north;
            num[sum].east:=east;
            num[sum].south:=south;
          end;
end;

procedure Init;
var i,j,c:longint;
begin
  assign(input,fileinp); reset(input);
  readln(m,n);
  for i:=1 to n do
    begin
      for j:=1 to m do
        read(gt[i,j]);
      readln;
    end;
  close(input);
end;

function Next(i,j:longint):longint;
var k:longint;
begin
  Next:=0;
  for k:=1 to 4 do
    if (i+navx[k] > 0) and (i+navx[k] <= n)
    and (j+navy[k] > 0) and (j+navy[k] <= m)
    and (free[i+navx[k],j+navy[k]]) then
      begin
        if (k = 1) and (num[gt[i,j]].west=1) then continue;
        if (k = 2) and (num[gt[i,j]].east=1) then continue;
        if (k = 3) and (num[gt[i,j]].north=1) then continue;
        if (k = 4) and (num[gt[i,j]].south=1) then continue;
        free[i+navx[k],j+navy[k]]:=false;
        stt[i+navx[k],j+navy[k]]:=count;
        Next:=Next+1+Next(i+navx[k],j+navy[k]);
      end;
end;

procedure Analyse;
var i,j:longint;
begin
  fillchar(free,sizeof(free),true);
  fillchar(dt,sizeof(dt),0);
  maxsize:=0;
  count:=0;
  for i:=1 to n do
    for j:=1 to m do
      if free[i,j] then
        begin
          free[i,j]:=false;
          inc(count);
          dt[count]:=Next(i,j)+1;
          stt[i,j]:=count;
          if dt[count] > maxsize then maxsize:=dt[count];
        end;
end;

procedure Analyse2;
var i,j,s:longint;
begin
  max:=-maxlongint;
  for j:=1 to m do
    for i:=n downto 1 do
      begin
        if (num[gt[i,j]].west=1) and (j-1 > 0) then
          begin
            if stt[i,j] <> stt[i,j-1] then
              s:=dt[stt[i,j]]+dt[stt[i,j-1]]
            else
              s:=dt[stt[i,j]];
            if s > max then
              begin
                resx:=i;
                resy:=j;
                ress:='W';
                max:=s;
              end;
          end;

        if (num[gt[i,j]].north=1) and (i-1 > 0) then
          begin
            if stt[i,j] <> stt[i-1,j] then
              s:=dt[stt[i,j]]+dt[stt[i-1,j]]
            else
              s:=dt[stt[i,j]];
            if s > max then
              begin
                resx:=i;
                resy:=j;
                ress:='N';
                max:=s;
              end;
          end;

        if (num[gt[i,j]].east=1) and (j+1 <= m) then
          begin
            if stt[i,j] <> stt[i,j+1] then
              s:=dt[stt[i,j]]+dt[stt[i,j+1]]
            else
              s:=dt[stt[i,j]];
            if s > max then
              begin
                resx:=i;
                resy:=j;
                ress:='E';
                max:=s;
              end;
          end;

       if (num[gt[i,j]].south=1) and (i+1 <= n) then
          begin
            if stt[i,j] <> stt[i+1,j] then
              s:=dt[stt[i,j]]+dt[stt[i+1,j]]
            else
              s:=dt[stt[i,j]];
            if s > max then
              begin
                resx:=i;
                resy:=j;
                ress:='S';
                max:=s;
              end;
          end;
      end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  writeln(maxsize);
  writeln(max);
  writeln(resx,' ',resy,' ',ress);
  close(output);
end;

begin
  Generate;
  Init;
  Analyse;
  Analyse2;
  Print;
end.
