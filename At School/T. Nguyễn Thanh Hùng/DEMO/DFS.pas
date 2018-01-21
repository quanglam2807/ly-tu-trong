const
        finp='DFS.INP';
        fout='DFS.OUT';
type    canh=record
                u,v:longint;
                end;
var     ke,bc,dau,stack:array [1..1000000] of longint;
        c:array [1..1000000] of canh;
        n,m,x1,x2,top:longint;
//=====================================
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
//=====================================
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
                                inc(i); dec(j)
                        end;
        until i>j;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
end;
//=====================================
procedure dfs(x:longint);
var     i:longint;
begin
        dau[x]:=1;
        inc(top); stack[top]:=x;
        if x=x2 then exit;
        for i:=bc[x]+1 to bc[x+1] do
                if dau[ke[i]]=0 then
                        begin
                                dfs(ke[i]);
                                if stack[top]=x2 then exit;
                        end;
        dec(top);
end;
//=====================================
procedure xuli;
var     i:longint;
begin
        for i:=1 to n do
                sort(bc[i]+1,bc[i+1]);
        top:=0; dfs(x1);
end;
//=====================================
procedure xuat;
var     g:text;
        i:longint;
begin
        assign(g,fout); rewrite(g);
        for i:=1 to top do
                write(g,stack[i],' ');
        close(g);
end;
//=====================================
begin
        nhap;
        xuli;
        xuat;
end.
//=====================================
