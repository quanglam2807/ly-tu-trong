const fi = 'books.inp';
      fo = 'books.out';
      maxn = 1000;

var   a: array[1..maxn,1..maxn] of longint;
      n,kq: longint;

procedure init;
var i,j: longint;
begin
   readln(n);  kq:=n*n;
   for i:=1 to n do
     begin
        for j:=1 to n do
          begin
             read(a[i,j]);
           //  if a[i,j]=0 then dec(kq);
          end;
        readln;
     end;
end;

procedure process;
var i,j,t,count: longint;
    h1,h2,h3,h4: boolean;
begin
   count:=0;
   for i:=1 to n do
     for j:=1 to n do
       begin
          if a[i,j]=0 then begin dec(kq); continue; end;
          if (i=1) or (j=1) or (i=n) or (j=n) then continue;

          h1:=true;  h2:=h1;   h3:=h2;  h4:=h3;
          for t:=i-1 downto 1 do
            if a[i,j]<=a[t,j] then h1:=false;

          for t:=i+1 to n do
            if a[i,j]<=a[t,j] then h3:=false;

          for t:=j+1 to n do
            if a[i,j]<=a[i,t] then h2:=false;

          for t:=j-1 downto 1 do
            if a[i,j]<=a[i,t] then h4:=false;

          if (not h1) and (not h2) and (not h3) and (not h4) then dec(kq);
       end;

   writeln(kq);
end;

begin
   assign(input,fi); assign(output,fo);
   reset(input); rewrite(output);

   init;
   process;

   close(input);  close(output);
end.