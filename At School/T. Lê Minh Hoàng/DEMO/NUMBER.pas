{$MODE OBJFPC}
program MaxNumber;
const
  InputFile  = 'NUMBER.INP';
  OutputFile = 'NUMBER.OUT';
  max = 1001;
type
  TStr = AnsiString;
  TLine = array[0..max] of TStr;
  PLine = ^TLine;
var
  a, b: TStr;
  m, n: Integer;
  L1, L2: TLine;
  Current, Next: PLine;

procedure Enter;
var
  f: TextFile;
  i: Integer;
begin
  AssignFile(f, InputFile); Reset(f);
  Readln(f, a);
  m := Length(a);
  Readln(f, b);
  n := Length(b);
  CloseFile(f);
  for i := 1 to m do
    begin
      L1[i] := '';
      L2[i] := '';
    end;
  Current := @L1;
  Next := @L2;
end;

procedure Refine(var s: TStr);
var
  i: Integer;
begin
  i := 1;
  while (i < Length(s)) and (s[i] = '0') do Inc(i);
  Delete(s, 1, i - 1);
end;

function AddChar(const s: TStr; Digit: Char): TStr;
begin
  if (Digit <> '0') or (s <> '') then Result := s + Digit
  else Result := '';
end;

function Compare(const a, b: TStr): Integer;
begin
  if Length(a) > Length(b) then Exit(1)
  else if Length(a) < Length(b) then Exit(-1);
  if a > b then Exit(1)
  else if a < b then Exit(-1);
  Result := 0;
end;

function GetMax(const s1, s2: TStr): TStr;
begin
  if Compare(s1, s2) > 0 then Result := s1
  else Result := s2;
end;

procedure Optimize;
var
  t, i, j: Integer;
  temp: PLine;
begin
  for j := 0 to n do Current^[j] := '';
  Next^[0] := '';
  for i := 1 to m do
    begin
      for j := 1 to n do
        if a[i] = b[j] then
          Next^[j] := AddChar(Current^[j - 1], b[j])
        else
          Next^[j] := GetMax(Next^[j - 1], Current^[j]);
      temp := Current; Current := Next; Next := temp;
    end;
end;

procedure PrintResult;
var
  s: TStr;
  i: Integer;
  f: TextFile;
begin
  s := Current^[n];
  Refine(s);
  if s = '' then s := '0';
  AssignFile(f, OutputFile); Rewrite(f);
  try
    Writeln(f, s);
  finally
    CloseFile(f);
  end;
end;

begin
  Enter;
  Optimize;
  PrintResult;
end.
