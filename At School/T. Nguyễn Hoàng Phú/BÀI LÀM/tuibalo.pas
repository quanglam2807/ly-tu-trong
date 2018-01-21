const finp='tuibalo.inp';
      fout='tuibalo.out';
var f:array [0..1000,0..1000] of longint;
    n,m,k,count:integer;
    w,v,sl:array [1..1000] of longint;
    usesl:array[1..1000,1..1000] of longint;

procedure init;
var i:integer;
begin
  assign(input,finp);reset(input);
  readln(n,m);
  for i:=1 to n do readln(w[i],v[i],sl[i]);
  close(input);
end;

procedure xuly;
var j,i:integer;
begin
  fillchar (f[0],sizeof (f[0]),0);
  for i:=1 to n do
  begin
    for j:=1 to m do
      begin
        f[i,j]:=f[i-1,j];
        count:=0;
        for k:=1 to n do
          begin
            if (j>=k*w[i]) and (k <= sl[i]) and (f[i,j]<f[i-1,j-k*w[i]]+k*v[i]) then
              begin
                f[i,j]:=f[i-1,j-k*w[i]]+k*v[i];
                inc(count);
              end;
          end;
        usesl[i,j]:=k;
      end;
  end;
end;

procedure print;
var dem,i,j:integer;
    tmp:array [1..1000] of integer;
begin
  assign (output,fout);rewrite(output);
  writeln (f[n,m]);
  fillchar (tmp,sizeof (tmp),0);
  i:=n;j:=m;
 { while f[i,j]>0 do
    begin
      if f[i,j]> f[i-1,j] then
        begin
          write(i,' ');
          j:=j-w[i];
          dec(i);
        end
      else dec(i);
    end;  }
 dem:=0;
  for i:=n downto 1 do
    if f[i,j]>0 then
      begin
        if f[i,j]>f[i-1,j] then
          begin
            inc(dem);
            tmp[dem]:=i;
            j:=j-w[i];
          end;
      end;
    for i:=dem downto 1 do write (tmp[i],' ');
  close(output);
end;

begin
  init;
  xuly;
  print;
end.
