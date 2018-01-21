const fileinp = 'nocow.inp';
      fileout = 'nocow.out';
      maxN = 1000;
      maxT = 300;

var n,k,t,res:longint;
    word:array[1..maxT,1..maxN] of string;
    count:array[1..maxN] of longint;
    noavail:array[1..maxN,1..maxT] of string;
    num:array[1..maxN] of longint;
    text:array[1..maxT] of string;

procedure Split(line:longint;s:string);
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
          noavail[line,c]:=ms;
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
      Split(i,s);
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

procedure DetectNumber;
var i,j,k,q,s,tmp:longint;
begin
  for i:=19 to n do
    begin
      num[i]:=1;
      for j:=1 to t do
        begin
          for k:=1 to count[j] do
            if word[j,k] = noavail[i,j] then
              break;
          s:=1;
          for q:=j+1 to t do
            s:=s*count[q];
          num[i]:=num[i]+(k-1)*s;
        end;
    end;
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if num[i] > num[j] then
        begin
          tmp:=num[i];
          num[i]:=num[j];
          num[j]:=tmp;
        end;
end;

procedure FindK;
var i:longint;
begin
  for i:=1 to n do
    if num[i] <= k then
      inc(k);
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to t do
    write(text[i],' ');
  writeln;
  close(output);
  halt;
end;

function NewCount(i:longint):longint;
var j,c:longint;
begin
  c:=1;
  for j:=i+1 to t do
    c:=c*count[j];
  exit(res+c);
end;

procedure IncCount(i:longint);
var c,j:longint;
begin
  c:=1;
  for j:=i+1 to t do
    c:=c*count[j];
  res:=res + c;
end;

procedure Generate(i:longint);
var j:longint;
begin
  if (i > t) then
    begin
      inc(res);
      if res = k then Print;
    end;
  for j:=1 to count[i] do
    begin
      if NewCount(i) < k then
        begin
          IncCount(i);
          continue;
        end;
      text[i]:=word[i,j];
      Generate(i+1);
    end;
end;

procedure Analyse;
begin
  res:=0;
  Sort;
  DetectNumber;
  FindK;
  Generate(1);
end;

begin
  Init;
  Analyse;
end.
