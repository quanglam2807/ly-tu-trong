const fileinp = 'rec_str.inp';
      fileout = 'rec_str.out';
      maxN = 500;

type ss = record
            l:longint;
            a:array[1..maxN*3] of byte;
          end;

var n,t:longint;
    s:array[0..500] of ss;
    q:array[1..3] of byte;

procedure Init;
begin
  assign(input,fileinp); reset(input);
  readln(n);
  close(input);
end;

function Ok(x:longint):boolean;
var i,l,j,k:longint;
begin
  if t > s[x].l then exit(false);
  l:=s[x].l;

  for i:=1 to l-t+1 do
    begin
      OK:=true;
      k:=0;
      for j:=i+t-1 downto i do
        begin
          inc(k);
          if q[k] <> s[x].a[j] then
            begin
              OK:=false;
              break;
            end;
        end;
      if OK then exit;
    end;
  exit(false);
end;

procedure Analyse;
var i,j,x,k:longint;
begin
  s[0].l:=0;
  for i:=1 to n do
    begin
      x:=i;
      t:=0;
      while x <> 0 do
        begin
          inc(t);
          q[t]:=x mod 10;
          x:=x div 10;
        end;
      if OK(i-1) then
        s[i]:=s[i-1]
      else
        begin
          s[i].l:=s[i-1].l + t;
          for j:=1 to s[i-1].l do
            s[i].a[j]:=s[i-1].a[j];
          k:=0;
          for j:=s[i-1].l+t downto s[i-1].l+1  do
            begin
              inc(k);
              s[i].a[j]:=q[k];
            end;
        end;
    end;
end;

procedure Print;
var i:longint;
begin
  assign(output,fileout); rewrite(output);
  for i:=1 to s[n].l do
    write(s[n].a[i]);
  close(output);
end;

begin
  Init;
  Analyse;
  Print;
end.