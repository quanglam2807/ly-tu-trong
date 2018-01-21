Uses  Crt ;
Const Fi = 'LUOI.INP';
      Fo = 'LUOI.OUT';
Var   A : Array[1..20,1..20]Of Integer ;
      B : Array[1..20,1..20]Of 0..1 ;
      Px,Py: Array[1..4] Of ShortInt ;
      M,N,S,S1,S2 : LongInt ;
      F : Text ;
Procedure Read_Input ;
 Var i,j :Integer;
Begin
 Clrscr ; S:= 0 ;
 Assign(F,Fi) ;Reset(F) ;
 Readln(F,M,N);
 For i:=1 to M do
  Begin
     For j:=1 to N do
       Begin
          Read(F,A[i,j]);
          S:=S+A[i,j];
       End;
     Readln(F);
   End;
 Close(F);
End;

 Procedure Innit ;
 Begin
   S1 := S div 2;
   Px[1]:= 0 ;Px[2]:= 0  ;Px[3]:=1 ;Px[4]:=-1 ;
   Py[1]:= 1 ;Py[2]:=-1  ;Py[3]:=0 ;Py[4]:= 0 ;
 End ;

Procedure Write_Output ;
 Var i,j :Integer;
Begin
  Assign(F,Fo); ReWrite(F);
  For i:=1 to M do
    Begin
       For j:=1 to N do
       Write(F,B[i,j],' ');
       Writeln(F);
    End;
  Close(F);Halt;
End;

Function Ktra(x,y : Integer) : Boolean ;
Begin
    Ktra:= False ;
    If (x in [1..M]) And (y in [1..N]) And
       (B[x,y] = 0 ) Then Ktra := True ;
End;

Procedure Try(x,y:Integer ;Sum :LongInt);
 Var i :Integer ;
Begin
  For i:=1 to 4 do
  If Ktra(x+Px[i],y+Py[i]) Then
    Begin
        x := x + Px[i] ;
        y := y + Py[i] ;
        Sum := Sum + A[x,y];
        B[x,y] := 1;
        If Sum = S2 Then Write_Output ;
        Try(x,y,Sum) ;
        Sum := Sum - A[x,y];
        B[x,y] := 0;
        x := x - Px[i] ;
        y := y - Py[i] ;
     End ;
End;

Procedure Run ;
   Var i,j : Integer ;
Begin
   Read_Input ;Innit ;
   For i:=1 to M do
    For j:=1 to N do
     If A[i,j]>= S1 Then
       Begin
           Fillchar(B,SizeOf(B),0);
           B[i,j]:=1;
           Write_Output;
        End ;
   For S2 := S1 downto 1 do
     Begin
        Fillchar(B,SizeOf(B),0);
        B[1,1]:=1;
        Try(1,1,A[1,1]);
     End;
End;

BEGIN
   Run;
END.

