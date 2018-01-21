const fileinp = 'nocow.in';
      fileout = 'nocow.out';
      maxN = 100;
      maxT = 30;

var n,k,t:longint;
    word:array[1..maxT,1..maxN] of string;
    count:array[1..maxN] of longint;

procedure Split(s:string);
var i,j,l,c:longint;
    ms:string;
    found:boolean;
begin
  ms:='';
  l:=0;
  c:=1;
  for i:=20 to length(s) do
    begin
      if s[i] = ' ' then
        begin
          found:=true;
          for j:=1 to count[c] do
            if ms = word[c,j] then
              begin
                found:=false;
                break;
              end;
          if found then
            begin
              inc(count[c]);
              word[c,count[c]]:=ms;
            end;
          ms:='';
          l:=0;
          inc(c);
        end
      else
        begin
          inc(l);
          ms:=ms+s[i];
        end;
    end;
  if c-1 > t then t:=c-1;
end;

procedure Init;
var i:longint;
    s:string;
begin
  assign(input,fileinp); reset(input);
  readln(n,k);
  t:=0;
  fillchar(count,sizeof(count),0);
  for i:=1 to n do
    begin
      readln(s);
      Split(s);
    end;
  close(input);
end;

procedure Sort;
var tmp:string;
    i,j,k:longint;
begin
  for k:=1 to t do
    for i:=1 to count[k]-1 do
      for j:=i+1 to count[k] do
        if word[k,i] > word[k,j] then
          begin
            tmp:=word[k,i];
            word[k,i]:=word[k,j];
            word[k,j]:=tmp;
          end;
end;

procedure Analyse;
begin
  Sort;
end;

begin
  Init;
  Analyse;
end.