const fileinp = 'bdnp.inp';
      fileout = 'bdnp.out';
      maxN = 30000;

var p,i,j,count,sl:longint;
    a,b:array[1..maxN] of char;
    dif,list:array[1..maxN] of integer;
    found:boolean;

begin
  assign(input,fileinp); reset(input);
  readln(p);
  for i:=1 to p do read(a[i]);
  readln;
  for i:=1 to p do read(b[i]);
  count:=0;
  for i:=1 to p do
    if a[i] <> b[i] then
      begin
        inc(count);
        dif[count]:=i;
      end;
  sl:=1;
  list[1]:=dif[1];
  for i:=2 to count do
    begin
      found:=false;
      for j:=1 to sl do
        if dif[i] mod list[j] = 0 then
          found:=true;
      if not found then
        begin
          inc(sl);
          list[sl]:=dif[i];
        end;
    end;
  close(input);

  assign(output,fileout); rewrite(output);
  writeln(sl);
  for i:=1 to sl do write(list[i],' ');
  close(output);
end.
