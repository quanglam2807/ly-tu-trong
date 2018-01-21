const fileinp = 'birds.inp';
      fileout = 'birds.out';
      maxN = 100000;

type td = record
            x,y:longint;
          end;

var l,n,m:longint;
    a,b:array[1..maxN] of longint;
    f:array[1..2,1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(l);
  readln(n);
  for i:=1 to n do read(a[i]);
  readln(m);
  for i:=1 to m do
  read(b[i]);
  close(input);
end;

procedure Analyse;
var q:array[0..maxN+1] of td;
    w:array[1..2] of char;
    s,i:longint;
    OK:boolean;
    free:array[1..2,1..maxN] of boolean;
begin
  s:=0;
  w[1]:='R';
  w[2]:='L';
  fillchar(free,sizeof(free),true);
  repeat
    inc(s);
    OK:=false;
    for i:=0 to l do q[i].y:=0;
    for i:=1 to n do
      if free[1,i] then
        begin
          if w[1] = 'R' then
            inc(a[i]);
          if w[1] = 'L' then
            dec(a[i]);
          q[a[i]].x:=1;
          q[a[i]].y:=i;
          OK:=true;
        end;
    for i:=1 to m do
      if free[2,i] then
        begin
          if w[2] = 'R' then
            inc(b[i]);
          if w[2] = 'L' then
            dec(b[i]);
          q[b[i]].x:=2;
          q[b[i]].y:=i;
          OK:=true;
        end;
    if (q[0].y <> 0) and (q[l].y <> 0) and free[q[0].x,q[0].y] and free[q[l].x,q[l].y] then
      begin
        f[q[0].x,q[0].y]:=s;
        f[q[l].x,q[l].y]:=s;
        free[q[0].x,q[0].y]:=false;
        free[q[l].x,q[l].y]:=false;
      end
    else
      begin
        if (q[0].y <> 0) and free[q[0].x,q[0].y] then
          begin
            f[q[0].x,q[0].y]:=s;
            free[q[0].x,q[0].y]:=false;
            if w[1] = 'L' then w[1]:='R'
              else w[1]:='L';
            if w[2] = 'L' then w[2]:='R'
              else w[2]:='L';
          end;
        if (q[l].y <> 0) and free[q[l].x,q[l].y] then
          begin
            f[q[l].x,q[l].y]:=s;
            free[q[l].x,q[l].y]:=false;
            if w[1] = 'L' then w[1]:='R'
              else w[1]:='L';
            if w[2] = 'L' then w[2]:='R'
              else w[2]:='L';
          end;
      end;
    if not OK then exit;
  until false;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to n do write(f[1,i],' ');
  writeln;
  for i:=1 to m do write(f[2,i],' ');
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
