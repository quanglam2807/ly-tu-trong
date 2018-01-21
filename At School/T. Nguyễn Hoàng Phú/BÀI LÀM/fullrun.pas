uses Dos,Crt;

var m,n,t,p:longint;
    a:array[1..1000,1..1000] of char;
    f1,f2,f3,f4,f5,f6:text;

procedure Init;
var i,j:longint;
begin
  clrscr;
  assign(f1,'input.txt'); reset(f1);
  readln(f1,m,n,t,p);
  for i:=1 to m do
    begin
      for j:=1 to n do read(f1,a[i,j]);
      readln(f1);
    end;
  close(f1);
end;

procedure PrintMap(r:longint);
var i,j,x:longint;
begin
  writeln(f2,m,' ',n,' ',t,' ',p,' ',x);
  for i:=1 to m do
    begin
      for j:=1 to n do write(f2,a[i,j]);
      writeln(f2);
    end;
end;

procedure PrintMap2(x:longint);
var i,j:longint;
begin
  writeln;
  writeln;
  writeln('DOT ',x);
  for i:=1 to m do
    begin
      for j:=1 to n do write(a[i,j]);
      writeln;
    end;
end;

procedure ChangeColor(x,y:longint);
var i,j:longint;
begin
  for i:=x to x+p-1 do
    for j:=y to y+p-1 do
      begin
        if a[i,j] = 'x' then a[i,j]:='d'
        else if a[i,j] = 'd' then a[i,j]:='x';
      end;
end;

procedure MInit;
var i,c,d,e,h:longint;
    f:string;
    answer1,answer2:char;
begin

answer1:='N';
answer2:='N';

{
  writeln('Player 1');
  write('Ban co muon nhap tu ban phim: ');
  readln(answer1);
  writeln('Player 2');
  write('Ban co muon nhap tu ban phim: ');
  readln(answer2);
}
  for i:=1 to t do
    begin
      if (answer1='Y') or (answer2='Y') then
        PrintMap2(i)
      else
        begin
          assign(f2,'tmp.txt'); rewrite(f2);
          PrintMap(i);
          close(f2);
        end;
      Exec('1.exe','');
      Exec('2.exe','');
      str(i,f);

      if answer1 = 'N' then
        begin
          assign(f3,'1.txt'); reset(f3);
          readln(f3,e,h);
          close(f3);
        end
      else
        begin
          writeln;
          writeln('Player 1');
          write('Nhap c,d: ');
          readln(e,h);
        end;

      ChangeColor(e,h);

      assign(f4,'player/1/'+f+'.txt'); rewrite(f4);
      writeln(f4,e,' ',h);
      close(f4);


      if answer2 = 'N' then
        begin
          assign(f5,'2.txt'); reset(f5);
          readln(f5,c,d);
          close(f5);
        end
      else
        begin
          writeln;
          writeln('Player 2');
          write('Nhap c,d: ');
          readln(c,d);
        end;
      writeln('Player 1: ',e,' ',h);
      writeln('Player 2: ',c,' ',d);
      ChangeColor(c,d);
      assign(f6,'player/2/'+f+'.txt'); rewrite(f6);
      writeln(f6,c,' ',d);
      close(f6);
    end;
end;

begin
  Init;
  MInit;
  readln;
end.
