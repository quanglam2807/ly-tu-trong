uses    Crt;
var     n,i,j,tam,tam1:integer;
        a:array[1..1000] of integer;
        dem,luu:integer;
function   cs(n:integer):integer;
var     m,dv:integer;
begin
        m:=0;
        while n<>0 do
        begin
          dv:=n mod 10;
          m:=m*10+dv;
          n:=n div 10;
        end;
        cs:=m mod 10;
end;
begin
        Clrscr;
        write('Nhap n = ');readln(n);
        for i:=1 to n do
        begin
          readln(a[i]);
        end;
        dem:=0;
        for i:=1 to n-1 do
         for j:=i+1 to n do
          if cs(a[i]) > cs(a[j]) then
          begin
            tam:=a[i];
            a[i]:=a[j];
            a[j]:=tam;
          end;

          for i:=1 to n-1 do
           for j:=i+1 to n do
            if cs(a[i]) = cs(a[j]) then
            begin
             if a[i] > a[j] then
              begin
                tam1:=a[i];
                a[i]:=a[j];
                a[j]:=tam1;
              end;
            end;
          write('Ket qua: ');
          writeln;
          for i:=1 to n do writeln(a[i]);
        readln;
end.

