Const dx:array[1..8] of integer=(-2,-1,1,2,2,1,-1,-2);
      dy:array[1..8] of integer=(1,2,2,1,-1,-2,-2,-1);
Var a:array[1..8,1..8] of integer;
    startX,startY:integer;

Procedure Init;
Begin
 FillChar(a,SizeOf(a),0);
 Write('Nhap toa do o xuat phat: ');
 Readln(startX,startY);
 a[startX,startY]:=1;
End;


Procedure Inkq;
Var i,j:integer;
Begin
 For i:=1 to 8 do
  Begin
   For j:=1 to 8 do Write(a[i,j],'  ');
   Writeln;
  End;
 readln;
 halt;
End;

Procedure Try(x,y,k:integer);
Var i,j,t:integer;
Begin
 If k=64 then Inkq else
  Begin
   For t:=1 to 8 do
    Begin
     If ((x+dx[t]) in [1..8]) and ((y+dy[t]) in [1..8]) then
      If a[x+dx[t],y+dy[t]]=0 then
       Begin
        a[x+dx[t],y+dy[t]]:=k+1;
        Try(x+dx[t],y+dy[t],k+1);
        a[x+dx[t],y+dy[t]]:=0;
       end;
    End;
  End;
End;

Procedure Process;
Begin
 Try(startX,startY,1);
End;

Begin
 Init;
 Process;
End.
