const fileinp = 'basketball_game.txt';
      fileout = 'bg.out';
      maxN = 50;

type playertype = record
                n:string;
                s,h:longint;
              end;

var player:array[1..maxN] of playertype;
    team:array[1..2,1..maxN] of playertype;
    ingame:array[1..2,1..maxN] of boolean;
    count:array[1..2] of longint;
    time:array[1..2,1..maxN] of longint;

var n,m,p:longint;

procedure Init;
var i,count:longint;
    c:char;
begin
  readln(n,m,p);
  for i:=1 to n do
    begin
      player[i].n:='                     ';
      count:=0;
      repeat
        read(c);
        if c = ' ' then break;
        inc(count);
        player[i].n[count]:=c;
      until false;
      read(player[i].s);
      read(player[i].h);
      readln;
    end;
end;

procedure Sort;
var i,j:longint;
    tmp:playertype;
begin
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if (player[i].s < player[j].s)
      or ((player[i].s = player[j].s) and (player[i].h < player[j].h )) then
        begin
          tmp:=player[i];
          player[i]:=player[j];
          player[j]:=tmp;
        end;
end;

procedure GroupDivide;
var i:longint;
begin
  count[1]:=0;
  count[2]:=0;
  fillchar(ingame,sizeof(ingame),false);
  for i:=1 to n do
    begin
      if (i mod 2 = 0) then
        begin
          inc(count[2]);
          team[2,count[2]]:=player[i];
          if count[2] <= p then ingame[2,count[2]]:=true;
        end
      else
        begin
          inc(count[1]);
          team[1,count[1]]:=player[i];
          if count[1] <= p then ingame[1,count[1]]:=true;
        end;
    end;
end;

procedure Change(i:longint);
var u,v,max,min,j:longint;
begin
  if count[i] = p then exit;
  max:=-maxlongint;
  u:=0;
  for j:=count[i] downto 1 do
    if (ingame[i,j]) and (time[i,j] > max) then
      begin
        u:=j;
        max:=time[i,j];
      end;
  min:=maxlongint;
  v:=0;
  for j:=1 to count[i] do
    if (not ingame[i,j]) and (time[i,j] < min) then
      begin
        v:=j;
        min:=time[i,j];
      end;
  ingame[i,u]:=false;
  ingame[i,v]:=true;
end;

procedure IncTime(i:longint);
var j:longint;
begin
  for j:=1 to count[i] do
    if ingame[i,j] then
      inc(time[i,j]);
end;

procedure Analyse;
var i:longint;
begin
  fillchar(time,sizeof(time),0);
  for i:=1 to m do
    begin
      IncTime(1);
      IncTime(2);
      Change(1);
      Change(2);
    end;
end;

procedure Print;
var i,j,c:longint;
    list:array[1..maxN] of string;
    tmp:string;
begin
  c:=0;
  for i:=1 to count[1] do
    if ingame[1,i] then
      begin
        inc(c);
        list[c]:=team[1,i].n;
      end;

  for i:=1 to count[2] do
    if ingame[2,i] then
      begin
        inc(c);
        list[c]:=team[2,i].n;
      end;

  for i:=1 to c-1 do
    for j:=i+1 to c do
      if list[i] > list[j] then
        begin
          tmp:=list[i];
          list[i]:=list[j];
          list[j]:=tmp;
        end;

  for i:=1 to c do
    begin
      for j:=1 to length(list[i]) do
        begin
          if list[i][j] = ' ' then break;
          write(list[i][j]);
        end;
      write(' ');
    end;
end;

procedure Main;
var i,t:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(t);
  for i:=1 to t do
    begin
      Init;
      Sort;
      GroupDivide;
      Analyse;
      write('Case #',i,': ');
      Print;
      writeln;
    end;
  close(input);  close(output);
end;

begin
  Main;
end.