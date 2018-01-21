const fileinp = 'mayors.inp';
      fileout = 'mayors.out';
      maxN = 500;

var x,d,color:array[1..maxN] of longint;
    a:array[1..maxN,1..maxN] of boolean;
    n,m,uncol,cur:longint;

procedure Init;
var i,u,v:longint;
begin
  assign(input,fileinp); reset(input);
  readln(n,m);
  for i:=1 to n do
    x[i]:=i;
  for i:=1 to m do
    begin
      readln(u,v);
      inc(d[u]);
      inc(d[v]);
      a[u,v]:=true;
      a[v,u]:=true;
    end;
  close(input);
end;

procedure Sort;
var i,j,tmp:longint;
begin
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if d[x[i]] < d[x[j]] then
        begin
          tmp:=x[i];
          x[i]:=x[j];
          x[j]:=tmp;
        end;
end;

procedure Analyse;
var u,v,k,i:longint;
begin
  fillchar(color,sizeof(0),0);
  cur:=0;
  uncol:=n;
  repeat
    i:=1;
    while color[x[i]] <> 0 do
      inc(i);
    if color[x[i]] = 0 then
      begin
        u:=x[i];
        inc(cur);
        for v:=1 to n do
          if (not a[u,v]) and (color[v] = 0) then
            begin
              color[v]:=cur;
              dec(uncol);
            end;
        for v:=1 to n do
          if color[v] = cur then
            begin
              for k:=1 to n do
                if a[v,k] then
                  begin
                    dec(d[v]);
                    dec(d[k]);
                    a[v,k]:=false;
                    a[k,v]:=false;
                  end;
            end;
        Sort;
        if (uncol = 0) or (cur >= 3) then exit;
      end;
  until false;
end;

procedure Print;
begin
  assign(output,fileout); rewrite(output);
  if (uncol <> 0) then
    writeln('Plan failed')
  else
    writeln('Plan OK');
  close(output);
end;

begin
  Init;
  Sort;
  Analyse;
  Print;
end.