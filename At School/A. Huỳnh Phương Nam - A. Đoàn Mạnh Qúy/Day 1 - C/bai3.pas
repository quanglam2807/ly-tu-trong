{LAM NGUYEN NHUT QUANG}

const fileinp = 'bai3.inp';
      fileout = 'bai3.out';
var n,count:longint;
    a:array[1..1000,1..1000] of boolean;
    free,lock:array[1..1000] of boolean;
    kq:array[1..1000,1..1000] of longint;
    num:array[1..1000] of longint;

procedure Init;
var i,j,tmp:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  fillchar(a,sizeof(a),false);
  for i:=1 to n do
    begin
      while not eoln do
        begin
          read(tmp);
          a[i,tmp]:=true;
          a[tmp,i]:=true;
        end;
      readln;
    end;
end;

procedure BFS(i:longint);
var j:longint;
begin
  free[i]:=false;
  for j:=1 to n do
    if (a[i,j]) and (free[j]) or (lock[j]) then free[j]:=false;
end;

procedure Analyse;
var i,j,t,x:longint;
    change:boolean;
begin
  count:=0;
  fillchar(lock,sizeof(lock),false);
  for i:=1 to n do
    begin
      fillchar(free,sizeof(free),true);
      if free[i] and lock[i]=false then
      begin
        bfs(i);
        for j:=1 to n do
          if free[j] then
            begin
              for t:=1 to n do
                if free[t] and a[j,t] then free[t]:=false;
            end;
        inc(count);
        x:=1;
        kq[count,x]:=i;
        lock[i]:=true;
        for j:=1 to n do
          if free[j] then
           begin
             inc(x);
             kq[count,x]:=j;
             lock[j]:=true;
           end;
        num[count]:=x;
      end;
    end;
end;

procedure Print;
var i,j:longint;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  for i:=1 to count do
    begin
      for j:=1 to num[i] do
        write(kq[i,j],' ');
      writeln;
    end;
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
