{$MODE OBJFPC}
program LongestIncreasingSubsequence;
const
  InputFile  = 'LIS.INP';
  OutputFile = 'LIS.OUT';
  max = Round(1E5);
  maxV = Round(1E9);
var
  a, t: array[0..max + 1] of Integer;
  s: array[1..max + 2] of Integer;
  n, m: Integer;

procedure Enter;
var
  f: TextFile;
  i: Integer;
begin
  AssignFile(f, InputFile); Reset(f);
  try
    ReadLn(f, n);
    for i := 1 to n do Read(f, a[i]);
  finally
    CloseFile(f);
  end;
end;

procedure Init;
begin
  a[0] := -maxV - 1; a[n + 1] := maxV + 1;
  m := 1;
  s[1] := n + 1;
end;

function BinarySearch(v: Integer): Integer;
var
  Low, Middle, High: Integer;
begin
  Low := 2; High := m;
  while Low <= High do
    begin
      Middle := (Low + High) div 2;
      if a[s[Middle]] > v then Low := Middle + 1
      else High := Middle - 1;
    end;
  Result := High;
end;

procedure Optimize;
var
  i, lambda: Integer;
begin
  for i := n downto 0 do
    begin
      lambda := BinarySearch(a[i]);
      t[i] := s[lambda];
      if lambda + 1 > m then
        m := lambda + 1;
      s[lambda + 1] := i;
    end;
end;

procedure PrintResult;
var
  f: TextFile;
  i: Integer;
begin
  AssignFile(f, OutputFile); Rewrite(f);
  try
    WriteLn(f, m - 2);
    i := t[0];
    while i <> n + 1 do
      begin
        Write(f, i, ' ');
        i := t[i];
      end;
  finally
    CloseFile(f);
  end;
end;

begin
  Enter;
  Init;
  Optimize;
  PrintResult;
end.

12
1 2 3 8 9 4 5 6 2 3 9 10
