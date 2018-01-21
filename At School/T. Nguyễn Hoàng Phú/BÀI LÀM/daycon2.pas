const fileinp = 'daycon.inp';
      fileout = 'daycon.out';
      maxN = 10000;

var n,max:longint;
    a:array[1..maxN] of longint;

procedure Init;
var i:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  for i:=1 to n do read(a[i]);
  close(input);
end;

procedure Analyse;
var current,count,i,j:longint;
begin
  max:=1;
  for i:=1 to n do
    begin
      current:=a[1];
      count:=1;
      for j:=2 to n do
        if a[i] <> a[j] then
          begin
            if a[j] <> current then
              begin
                current:=a[j];
                if count > max then max:=count;
                count:=1;
              end
            else inc(count);
          end;
      if count > max then max:=count;
    end;
end;

procedure WriteResult;
begin
  assign(output,fileout); rewrite(output);
  writeln(max);
  close(output);
end;

begin
  Init;
  Analyse;
  WriteResult;
end.
