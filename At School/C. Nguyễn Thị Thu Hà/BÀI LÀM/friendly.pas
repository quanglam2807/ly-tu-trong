const   fi='friendly.inp';
        fo='friendly.out';
var     a,b,dem,i:longint;
function   ucln(x,y:longint):longint;
begin
        while x<>y do
        begin
          if x>y then x:=x-y
          else y:=y-x;
        end;
        ucln:=x;
end;
function   sodao(n:longint):longint;
var     m,dv:longint;
begin
        m:=0;
        while n<>0 do
        begin
          dv:=n mod 10;
          m:=m*10+dv;
          n:=n div 10;
        end;
        sodao:=m;
end;
function   tt(n:longint):boolean;
var     tam:boolean;
begin
        if ucln(n,sodao(n))=1 then tam:=true
        else tam:=false;
        tt:=tam;
end;
begin
        assign(input,fi);reset(input);
        read(a,b);
        close(input);
        assign(output,fo);rewrite(output);
        dem:=0;
        for i:=a to b do
         if tt(i) then
         begin
           inc(dem);
           writeln(i);
         end;
        write(dem);
        close(output);
end.
