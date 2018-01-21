const
        finp='BFS.INP';
        fout='BFS.OUT';
type    canh=record
                u,v:longint;
                end;
var     ke,bc,stack,dau,HD,trc:array [1..1000000] of longint;
        c:array [1..1000000] of canh;
        n,m,x1,x2:longint;
//======================================
procedure nhap;
var     f:text;
        i:longint;
begin
        assign(f,finp); reset(f);
        readln(f,n,m,x1,x2);
        for i:=1 to m do
                begin
                        readln(f,c[i].u,c[i].v);
                        inc(bc[c[i].u]);
                end;
        for i:=2 to n do bc[i]:=bc[i-1]+bc[i];
        bc[n+1]:=m;
        for i:=1 to m do
                begin
                        ke[bc[c[i].u]]:=c[i].v;
                        dec(bc[c[i].u]);
                end;
        close(f);
end;
//======================================
procedure sort(l,r:longint);
var     i,j,x,t:longint;
begin
        if l>r then exit;
        i:=l; j:=r; x:=ke[random(r-l+1)+l];
        repeat
                while ke[i]<x do inc(i);
                while ke[j]>x do dec(j);
                if i<=j then
                        begin
                                t:=ke[i]; ke[i]:=ke[j]; ke[j]:=t;
                                inc(i); dec(j);
                        end;
        until i>j;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
end;
//======================================
procedure xuli;
var     i,j,x,t:longint;
begin
        for i:=1 to n do
                sort(bc[i]+1,bc[i+1]);
        i:=1; j:=1; HD[1]:=x1; dau[x1]:=1;
        repeat
                x:=HD[i];
                for t:=bc[x]+1 to bc[x+1] do
                        if dau[ke[t]]=0 then
                                begin
                                        inc(j);
                                        HD[j]:=ke[t];
                                        dau[ke[t]]:=1;
                                        trc[ke[t]]:=x;
                                        if ke[t]=x2 then exit;
                                end;
                inc(i);
        until i>j;
end;
//======================================
procedure xuat;
var     g:text;
        i,x,top:longint;
begin
        assign(g,fout); rewrite(g);
        x:=x2; top:=0;
        repeat
                inc(top);
                stack[top]:=x;
                x:=trc[x];
        until x=0;
        for i:=top downto 1 do write(g,stack[i],' ');
        close(g);
end;
//======================================
begin
        nhap;
        xuli;
        xuat;
end.
//======================================
