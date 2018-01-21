{$MODE OBJFPC}
{$INLINE ON}
program LongestCommonSubsequence;
const
  InputFile  = 'LCS.INP';
  OutputFile = 'LCS.OUT';
  max = 1000;
var
  x, y, z: AnsiString;
  m, n: Integer;
  f: array[0..max, 0..max] of Integer;

procedure Enter;
var
  f: TextFile;
begin
  AssignFile(f, InputFile); Reset(f);
  try
    ReadLn(f, x);
    ReadLn(f, y);
    m := Length(x);
    n := Length(y);
  finally
    CloseFile(f);
  end;
end;

function GetMax(p, q: Integer): Integer; inline;
begin
  if p > q then Result := p else Result := q;
end;

procedure Optimize;
var
  i, j: Integer;
begin
  FillChar(f[0], (n + 1) * SizeOf(Char), 0);
  for i := 1 to m do f[i, 0] := 0;
  for i := 1 to m do
    for j := 1 to n do
      begin
        f[i, j] := 0;
        if x[i] = y[j] then
          f[i, j] := f[i - 1, j - 1] + 1
        else
          f[i, j] := GetMax(f[i - 1, j], f[i, j - 1]);
      end;
end;

procedure Trace;
var
  i, j, k: Integer;
begin
  SetLength(z, f[m, n]);
  i := m; j := n;
  k := Length(z);
  while (i <> 0) and (j <> 0) do
    begin
      if x[i] = y[j] then
        begin
          z[k] := x[i];
          Dec(k);
          Dec(i); Dec(j);
        end
      else
        if f[i, j] = f[i - 1, j] then Dec(i)
        else Dec(j);
    end;
end;

procedure PrintResult;
var
  f: TextFile;
begin
  AssignFile(f, OutputFile); Rewrite(f);
  try
    WriteLn(f, z);
  finally
    CloseFile(f);
  end;
end;

begin
  Enter;
  Optimize;
  Trace;
  PrintResult;
end.
abc1def2ghi3
abcdefghi123
