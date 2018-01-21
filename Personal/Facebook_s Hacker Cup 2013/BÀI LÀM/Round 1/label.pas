{$MODE OBJFPC}


const fileinp = 'labelmaker.txt';
      fileout = 'label.out';

var count,n,limit:int64;
    t,l,lb:longint;
    q:array[1..50] of char;
    s:array[1..25] of char;
    free:array[1..25] of boolean;
    g:array[1..50] of int64;



procedure Print;
var i:longint;
begin
  write('Case #',t,': ');
  for i:=1 to lb do
    write(q[i]);
  writeln;
end;

function CalcG(i:longint):int64;
var j:longint;
begin
  if i = 0 then exit(0);
  if g[i] <> 0 then exit(g[i]);
    try
      g[i]:=CalcG(i-1)*l;
    except
      g[i]:=limit;
      exit(limit);
    end;
  exit(g[i]);
end;

procedure Generate(i:longint);
var j:longint;
   sum:int64;
begin
  if count > n then exit;
  if i > lb then
    begin
      inc(count);
      if count = n then Print;
      exit;
    end;
  for j:=1 to l do
    begin
      sum:=count + CalcG(lb-i);
      if (i=lb) or (sum >= n) then
        begin
          q[i]:=s[j];
          Generate(i+1);
        end
      else
        count:=sum;
    end;
end;

procedure DecN;
var i,j:longint;
begin
  for i:=1 to 50 do
    begin
      if n > CalcG(i) then n:=n-g[i]
      else
        begin
          lb:=i;
          break;
        end;
    end;
  count:=0;
end;

procedure Analyse;
begin
  fillchar(g,sizeof(g),0);
  g[1]:=l;
  DecN;
  Generate(1);
end;

procedure Init;
var c:char;
begin
  l:=0;
  repeat
    read(c);
    if c = ' ' then
      break
    else
      begin
        inc(l);
        s[l]:=c;
      end;
  until false;
  readln(n);
end;

procedure Main;
var tt:longint;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  readln(tt);
  limit:=9223372036854775807;
  for t:=1 to tt do
    begin
      Init;
      Analyse;
    end;
  close(input); close(output);
end;

begin
  Main;
end.
