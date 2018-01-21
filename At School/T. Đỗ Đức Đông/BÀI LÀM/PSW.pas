const fileinp = 'PSW.inp';
      fileout = 'PSW.out';

var a,b,x,y,m,count,l,l2:longint;
    s:array[1..10000] of char;
    num:array[1..10000] of longint;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(a,b,x,y,m);
  close(input);
end;


procedure FindWay(k,na,nb:longint);
var tmp:longint;
begin
  if na = 0 then exit;
  if na < nb then
    begin
      inc(count);
      s[count]:='W';
      tmp:=na;
      na:=nb;
      nb:=tmp;
      FindWay(k,na,nb);
      exit;
    end;
  inc(count);
  if k = 1 then
    s[count]:='S'
  else
    s[count]:='P';
  num[count]:=na div nb;
  na:=na mod nb;
  FindWay(k,na,nb);
end;

procedure Analyse;
begin
  count:=0;
  FindWay(1,a,b);
  l:=count;
  l2:=count+1;
  FindWay(2,x,y);
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);

  if (s[l] = 'S') and (s[count] = 'P') then
    begin
      if num[l] > num[count] then
        begin
          s[l]:='S';
          num[l]:=num[l] - num[count];
          dec(count);
        end
      else if num[l] < num[count] then
        begin
          s[l]:='P';
          num[l]:=num[count] - num[l];
          dec(count);
        end
      else if num[l] = num[count] then
        begin
          dec(count);
          dec(l);
        end;
    end;

  if (s[l] = s[count]) and (s[l] = 'W') then
    begin
      dec(l);
      dec(count);
    end;

  for i:=1 to l do
    begin
      write(s[i]);
      if num[i] > 0 then write(num[i]);
    end;

  for i:=count downto l2 do
    begin
      write(s[i]);
      if num[i] > 0 then write(num[i]);
    end;
  close(output);
end;


begin
  Init;
  Analyse;
  Print;
end.
