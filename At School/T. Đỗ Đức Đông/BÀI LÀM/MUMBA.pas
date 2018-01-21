const fileinp = 'mumba.inp';
      fileout = 'mumba.out';

var k,count:longint;
    q:array[1..17] of char;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(k);
  close(input);
end;

procedure Check;
var i,j,w,t,v:longint;
    s:array[1..3] of string;
begin
  for i:=1 to k do
    begin
      t:=0;
      repeat
        inc(t);
        if t * 3 > k then break;
        j:=i;
        s[1]:='                       ';
        s[2]:='                       ';
        s[3]:='                       ';
        w:=1;
        repeat
          for v:=j to j+t-1 do
            s[w][v-j+1]:=q[v];
          if (s[1] = s[2]) and (s[2] = s[3]) then exit;
          j:=j+t;
          if w < 3 then inc(w)
            else w:=1;
        until j > k;
      until false;
    end;
  inc(count);
end;

procedure Generate(i:longint);
var c:char;
begin
  if i > k then
    begin
      Check;
      exit;
    end;
  for c:='a' to 'b' do
    begin
      if (i > 1) and (c = 'b') and (q[i-1] = 'b') then continue;
      q[i]:=c;
      Generate(i+1);
    end;
end;

procedure Analyse;
begin
  if k <= 17 then
    begin
      count:=0;
      Generate(1);
    end
  else
    count:=0;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(count);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.