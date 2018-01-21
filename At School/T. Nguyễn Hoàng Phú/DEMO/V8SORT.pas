program SapXep;
uses crt;
const finp = 'v8sort.inp';
      fout =  'v8sort.out';
      maxN = 10;
      maxV = 6000;
      oo = maxlongint;
type kHV = array[1..maxN] of longint;
var d : array[1..maxV] of longint;
    Free : array[1..maxV] of boolean;
    a : array[1..maxN] of longint;
    c : array[1..maxN, 1..maxN] of longint;
    gt : array[0..maxN] of longint;
    hv : kHV;
    N, NN, r : longint;

    nheap : longint;
    heap, pos : array[1..maxV] of longint;

procedure nhap;
var f : text;
    i, j : longint;
begin
        assign(f,finp); reset(f);
        N:= 0;
        while not seekeoln(f) do
        begin
                inc(N);
                read(f, a[N]);
        end;
        readln(f);
        for i:= 1 to N do
        begin
                for j:= 1 to N do read(f,c[i,j]);
                readln(f);
        end;
        close(f);
end;

procedure chuanbi;
var i : longint;
begin
        gt[0]:= 1;
        for i:= 1 to N do gt[i]:= gt[i-1]*i;
end;

procedure tim_hv(p : longint; var x : kHV);
var NN : longint;
    i, j, k, d : longint;
    cx : array[1..maxN] of boolean;
begin
        for i:= 1 to N do cx[i]:= TRUE;

        NN:= N;
        for i:= 1 to N do
        begin
                dec(NN);
                if p mod gt[NN] = 0 then
                begin
                        k:= p div gt[NN];
                        d:= 0;

                        for j:= 1 to N do
                         if cx[j] then
                         begin
                                inc(d);
                                if d = k then
                                begin
                                        cx[j]:= FALSE;
                                        x[i]:= j;
                                        break;
                                end;
                         end;

                        p:= p - (k-1)*gt[NN];
                end
                 else
                 begin
                        k:= p div gt[NN]+1;
                        d:= 0;

                        for j:= 1 to N do
                         if cx[j] then
                         begin
                                inc(d);
                                if d = k then
                                begin
                                        cx[j]:= FALSE;
                                        x[i]:= j;
                                        break;
                                end;
                         end;

                        p:= p-(k-1)*gt[NN];
                 end;
        end;
end;

procedure tim_sh(hv : kHV; var sh : longint);
var L, i, j, r : longint;
begin
        r:= 0;
        for i:= 1 to N do
        begin
                L:= 0;
                for j:= 1 to i-1 do
                 if hv[j] < hv[i] then inc(L);
                r:= r + gt[N-i]*(hv[i]-L-1);
        end;
        inc(r);

        sh:= r;
end;


procedure update(u : longint);
var cha, con : longint;
begin
        con:= pos[u];
        if con = 0 then
        begin
                inc(nheap);
                con:= nheap;
        end;

        while con div 2 >= 1 do
        begin
                cha:= con div 2;

                if d[ heap[cha] ] <= d[u] then break;
                pos[ heap[cha] ]:= con;
                heap[con]:= heap[cha];

                con:= cha;
        end;

        heap[con]:= u;
        pos[u]:= con;
end;

function pop : longint;
var cha, con, u : longint;
begin
        pop:= heap[1];
        u:= heap[nheap];
        dec(nheap);

        cha:= 1;
        while cha*2 <= nheap do
        begin
                con:= cha*2;
                if (con < nheap)and( d[heap[con]] > d[ heap[con+1] ]) then
                inc(con);

                if d[ heap[con] ] >= d[u] then break;

                pos[heap[con]]:= cha;
                heap[cha]:= heap[con];

                cha:= con;
        end;

        heap[cha]:= u;
        pos[u]:= cha;
end;

function ok(u : longint) : boolean;
var hv, ta : kHV;
    i : longint;
begin
        tim_hv(u, hv);

        for i:= 1 to N do ta[i]:= a[ hv[i] ];

        for i:= 1 to N-1 do
         if ta[i] > ta[i+1] then
         begin
                ok:= FALSE;
                exit;
         end;

        ok:= TRUE;
end;


procedure swap(var u, v : longint);
var t : longint;
begin
        t:= u; u:= v; v:= t;
end;


procedure Xuly;
var i, j, u : longint;
    t : kHV;
    sh : longint;
begin
        NN:= 1;
        for i:= 1 to N do NN:= NN*i;

        for i:= 1 to NN do
        begin
                d[i]:= +oo;
                Free[i]:= TRUE;
                pos[i]:= 0;
        end;

        nheap:= 0;

        d[1]:= 0;
        update(1);

        repeat
                u:= pop;

                if ok(u) then
                begin
                        r:= d[u];
                        exit;
                end;

                Free[u]:= FALSE;

                tim_hv(u, hv);

                for i:= 1 to N-1 do
                 for j:= i+1 to N do
                 begin
                        t:= hv;
                        swap( t[i], t[j]);
                        tim_sh(t, sh);

                        if Free[sh] then
                         if d[sh] > d[u] + c[i,j] then
                         begin
                                d[sh]:= d[u]+c[i,j];
                                update(sh);
                         end;
                 end;

        until nheap = 0;

end;

procedure xuat;
var f : text;
begin
        assign(f,fout); rewrite(f);
        write(f,r);
        close(f);
end;

BEGIN
        nhap;
        chuanbi;
        xuly;
        xuat;
END.
