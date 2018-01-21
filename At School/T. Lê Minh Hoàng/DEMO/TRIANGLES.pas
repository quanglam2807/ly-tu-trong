{$MODE OBJFPC}
program Triangles;
const
  InputFile  = 'TRIANGLES.INP';
  OutputFile = 'TRIANGLES.OUT';
  maxN = 5000;
var
  a, b, freq: array[1..maxN + 1] of Integer;
  n, m: Integer;
  res: Int64;

procedure Enter;
var
  f: TextFile;
  i: Integer;
begin
  AssignFile(f, InputFile); Reset(f);
  try
    ReadLn(f, n);
    for i := 1 to n do Read(f, a[i]);
    a[n + 1] := MaxInt;
  finally
    CloseFile(f);
  end;
end;

procedure Sort(L, H: Integer);
var
  i, j: Integer;
  Pivot: Integer;
begin
  if L >= H then Exit;
  i := L + Random(H - L + 1);
  Pivot := a[i]; a[i] := a[L];
  i := L; j :=H;
  repeat
    while (a[j] > Pivot) and (i < j) do Dec(j);
    if i < j then
      begin
        a[i] := a[j]; Inc(i);
      end
    else Break;
    while (a[i] < Pivot) and (i < j) do Inc(i);
    if i < j then
      begin
        a[j] := a[i]; Dec(j);
      end
    else Break;
  until i = j;
  a[i] := Pivot;
  Sort(L, i - 1); Sort(i + 1, H);
end;

procedure Refine;
var
  j, i: Integer;
begin
  m := 0;
  j := 0;
  for i := 1 to n do
    if a[i] <> a[i + 1] then
      begin
        Inc(m);
        b[m] := a[i];
        freq[m] := i - j;
        j := i;
      end;
end;

procedure Solve;
var
  i, j, k: Integer;
  Old: Integer;
begin
  Res := 0;
  //Dem so tam giac deu
  for i := 1 to m do
    if freq[i] >= 3 then Inc(Res);
  //Dem so tam giac can nhung khong deu
  j := 1;
  for i := 1 to m do
    if freq[i] >= 2 then
      begin
         while (j <= m) and (b[j] < 2 * b[i]) do Inc(j);
         Inc(Res, j - 2);
      end;
  //Dem so tam giac khong can
  for i := 1 to m - 2 do
    begin
      k := i + 2;
      for j := i + 1 to m - 1 do
        begin
          while (k <= m) and (b[k] < b[i] + b[j]) do Inc(k);
          Inc(Res, k - 1 - j);
        end;
    end;
end;

procedure PrintResult;
var
  f: TextFile;
begin
  AssignFile(f, OutputFile); Rewrite(f);
  try
    WriteLn(f, Res);
  finally
    CloseFile(f);
  end;
end;

begin
  Enter;
  Sort(1, n);
  Refine;
  Solve;
  PrintResult;
end.
6
11 22 22 22 44 55
