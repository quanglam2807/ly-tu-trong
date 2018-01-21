const fileinp = 'quanma.inp';
      fileout = 'quanma.out';
      dx:array[1..4] of longint = (-1,1,0,0);
      dy:array[1..4] of longint = (0,0,-1,1);

type td = record
            x,y:longint;
          end;

var xs,ys:longint;
    q:array[1..64] of td;
    free:array[1..8,1..8] of boolean;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(xs,ys);
  close(input);
end;

procedure Generate(i:longint);
var x,y,k:longint;
begin
  if i > 64 then
    begin
      assign(output,fileout); rewrite(output);
      for k:=1 to 64 do
        writeln(q[k].x,' ',q[k].y);
      close(output);
      halt;
    end;
  x:=q[i-1].x;
  y:=q[i-1].y;
  for k:=1 to 4 do
    if (x+dx[k] > 0) and (x+dx[k] <= 8)
    and (y+dy[k] > 0) and (y+dy[k] <= 8)
    and (free[x+dx[k],y+dy[k]]) then
      begin
        free[x+dx[k],y+dy[k]]:=false;
        q[i].x:=x+dx[k];
        q[i].y:=y+dy[k];
        Generate(i+1);
        free[x+dx[k],y+dy[k]]:=true;
      end;
end;

procedure Analyse;
begin
  fillchar(free,sizeof(free),true);
  q[1].x:=xs;
  q[1].y:=ys;
  free[xs,ys]:=false;
  Generate(2);
end;

begin
  Init;
  Analyse;
end.