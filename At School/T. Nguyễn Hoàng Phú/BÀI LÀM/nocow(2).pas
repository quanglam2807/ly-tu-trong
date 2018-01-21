const fileinp = 'nocow.inp';
      fileout = 'nocow.out';
      maxN = 100;
      maxT = 30;

var n,k,t,res:longint;
    word:array[1..maxT,1..maxN] of string;
    count:array[1..maxN] of longint;
    noavail:array[1..maxN,1..maxT] of string;
    loc:array[1..maxT] of longint;

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

procedure FindResult;
var i,j,w1,w2,c,last:longint;
    OK:boolean;
    s:int64;
begin
  last:=k;
  for i:=1 to t do
    begin
      s:=1;
      for j:=i+1 to t do
        begin
          s:=s*count[j];
          if s > 1000000100 then
            begin
              s:=1000000100;
              break;
            end;
        end;
      for j:=1 to count[i] do
        begin
          c:=0;
          loc[i]:=j;
          for w1:=1 to n do
            begin
              OK:=true;
              for w2:=1 to i do
                if noavail[w1,w2] <> word[i,j] then
                  begin
                    Ok:=false;
                    break;
                  end;
              if OK then inc(c);
            end;
          if (last - (S-c) <= 0) then break
          else last:=last - (s-c);
        end;
    end;
end;

procedure Analyse;
begin
  Sort;
  FindResult;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to t do
    write(word[i,loc[i]],' ');
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
