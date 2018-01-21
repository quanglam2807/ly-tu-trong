const fi = 'tapcon.inp';
      fo = 'tapcon.out';
      maxN = 100;

var   n,k: integer;
      a: array[1..maxN] of integer;

procedure Solve;
var i,j: integer;
begin
   for i:=1 to k do a[i]:=i;
   i:=k;
   while (i>0) do
     begin
        for j:=1 to k do write(a[j],' ');
        writeln;

        i:=k;
        while (i>0) and (a[i]=n-k+i) do dec(i);
        if i<=0 then exit;
        inc(a[i]);
        for j:=i+1 to k do a[j]:=a[j-1]+1;
     end;
end;


begin
   assign(input,fi);  reset(input);
   assign(output,fo); rewrite(output);

   readln(n,k);
   Solve;

   close(input); close(output);
end.
