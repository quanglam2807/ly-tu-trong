const fileinp = 'photo3.inp';
      fileout = 'photo3.out';
      maxN = 1000;

var n,kq:longint;
    a,count:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  fillchar(count,sizeof(count),0);
  for i:=1 to n do
    begin
      readln(a[i]);
      inc(count[a[i]]);
    end;
  close(input);
end;

procedure Switch(var a,b:longint);
var tmp:longint;
begin
  tmp:=a;
  a:=b;
  b:=tmp;
  inc(kq);
end;

procedure Analyse;
var i,j:longint;
    found:boolean;
begin
  for i:=count[1]+count[2]+1 to n do
   if a[i] <> 3 then
      begin
        found:=false;
        if a[i] = 1 then
          begin
            for j:=1 to count[1] do
             if a[j] = 3 then
                begin
                  Switch(a[i],a[j]);
                  found:=true;
                  break;
                end;
            if found then continue;
            for j:=count[1]+1 to count[1]+count[2] do
             if a[j] = 3 then
                begin
                  Switch(a[i],a[j]);
                  found:=true;
                  break;
                end;
          end;
        if a[i] = 2 then
          begin
            for j:=count[1]+1 to count[1]+count[2] do
              if a[j] = 3 then
                begin
                  Switch(a[i],a[j]);
                  found:=true;
                  break;
                end;
            if found then continue;
            for j:=1 to count[1] do
              if a[j] = 3 then
                begin
                  Switch(a[i],a[j]);
                  found:=true;
                  break;
                end;
          end;
      end;


  for i:=1 to count[1] do
    if a[i] <> 1 then
      for j:=count[1]+1 to count[1]+count[2] do
        if a[j] = 1 then
          begin
            Switch(a[i],a[j]);
            break;
          end;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  writeln(kq);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.
