{$MODE OBJFPC}
program PermutationOrder;
const
  InputFile  = 'PERMUTATION.INP';
  OutputFile = 'PERMUTATION.OUT';
  max = 20;
type
  TList = record
    items: array[1..max] of Integer;
    nitems: Integer;
  end;
var
  p, q: array[1..max] of Integer;
  x, y: Int64;
  n: Integer;
  fac: array[0..max] of Int64;
  List: TList;

procedure Enter;
var
  f: TextFile;
begin
  AssignFile(f, InputFile); Reset(f);
  try
    n := 0;
    while not SeekEoln(f) do
      begin
        Inc(n); Read(f, p[n]);
      end;
    ReadLn(f);
    ReadLn(f, y);
  finally
    CloseFile(f);
  end;
end;

procedure Init;
var
  i: Integer;
begin
  fac[0] := 1;
  for i := 1 to n do
    fac[i] := fac[i - 1] * i;
end;

procedure InitList;
var
  i: Integer;
begin
  with List do
    begin
      nitems := n;
      for i := 1 to nitems do items[i] := i;
    end;
end;

function Pop(id: Integer): Integer; //Lay phan tu thu id ra khoi list
begin
  with List do
    begin
      Result := items[id];
      if id < nitems then
        Move(items[id + 1], items[id], (nitems - id) * SizeOf(Items[1]));
      Dec(nitems);
    end;
end;

function Find(v: Integer): Integer;
var
  L, M, H: Integer;
begin
  with List do
    begin
      L := 1; H := nitems;
      while L <= H do //items[L - 1] < v <= items[H + 1];
        begin
          M := (L + H) div 2;
          if items[M] < v then L := M + 1 else H := M - 1;
        end;
    end;
  Result := L;
end;

procedure Solve;
var
  i, j: Integer;
begin
  InitList;
  x := 1;
  for i := 1 to n do
    begin
      j := Find(p[i]);
      Pop(j);
      Inc(x, (j - 1) * Fac[n - i]);
    end;
  InitList;
  for i := 1 to n do
    begin
      j := (y - 1) div fac[n - i] + 1;
      q[i] := Pop(j);
      y := y - (j - 1) * fac[n - i];
    end;
end;

procedure PrintResult;
var
  f: TextFile;
  i: Integer;
begin
  AssignFile(f, OutputFile); Rewrite(f);
  try
    WriteLn(f, x);
    for i := 1 to n do Write(f, q[i], ' ');
  finally
    CloseFile(f);
  end;
end;

begin
  Enter;
  Init;
  Solve;
  PrintResult;
end.
