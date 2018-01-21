uses windows;

const fileinp = 'queue.inp';
      fileout = 'queue.out';

var t,count,x,sff,max,time:longint;
    n,f,e,a:array[1..1000] of longint;
    free:array[1..1000] of boolean;


procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(t);
  for i:=1 to t do readln(n[i],f[i],e[i]);
  close(input);
  fillchar(free,sizeof(free),true);
end;

procedure Check;
var fend,i,tmp:longint;
begin
  fend:=1;
  tmp:=a[n[x]];
  for i:=n[x]-1 downto 1 do
    begin
      if tmp < a[i] then
         begin
           inc(fend);
           tmp:=a[i];
         end;
    end;
  if (fend = e[x]) then
    begin                            {
      for i:=1 to n[x] do write(a[i],' ');
      writeln;                        }
      inc(count);
    end;
end;

procedure Generate(i:longint);
var j,tmp:longint;
    change:boolean;
begin
  for j:=1 to n[x] do
    if free[j] then
      begin
        change:=false;
        if j > max then
          begin
            if (sff+1 > f[x]) then continue
            else
              begin
                inc(sff);
                tmp:=max;
                max:=j;
                change:=true;
              end;
          end;
        a[i]:=j;
        free[j]:=false;
        if (i=n[x]) then
          begin
            if (sff = f[x]) then Check
          end
        else Generate(i+1);
        free[j]:=true;
        if change then
          begin
            dec(sff);
            max:=tmp;
          end;
      end;
end;

procedure AnalysePrint;
begin
  time:=gettickcount;
  assign(output,fileout); rewrite(output);
  for x:=1 to t do
    begin
      count:=0;
      sff:=0;
      max:=0;
      Generate(1);
      writeln(count);
    end;
  writeln(gettickcount-time);
  close(output);
end;

begin
  Init;
  AnalysePrint;
end.
