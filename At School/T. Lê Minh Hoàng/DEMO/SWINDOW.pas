{$MODE OBJFPC}
program SlidingWindows;
const
  InputFile  = 'SWINDOW.INP';
  OutputFile = 'SWINDOW.OUT';
  max = 1000000;
var
  n, m, k: Integer;
  P, T: AnsiString;
  Pie: array[1..max] of Integer;
  CurrentWindowPos: Integer;
  Count: Integer;

procedure Enter;
var
  f: TextFile;
begin
  AssignFile(f, InputFile); Reset(f);
  try
    ReadLn(f, T);
    ReadLn(f, P);
    ReadLn(f, k);
    m := Length(P);
    n := Length(T);
  finally
    CloseFile(f);
  end;
end;

procedure Init;
begin
  Count := 0;
  CurrentWindowPos := k - 1;
end;

procedure ComputePrefixFunction;
var
  k, q: Integer;
begin
  Pie[1] := 0;
  k := 0;
  for q := 2 to m do
    begin
      while (k > 0) and (P[k + 1] <> P[q]) do
        k := Pie[k];
      if P[k + 1] = P[q] then
        Inc(k);
      Pie[q] := k;
    end;
end;

procedure KnuttMorrisPrattStrMatching;
var
  i, q: Integer;
  wbegin, wend: Integer;
begin
  if k < m then Exit;
  q := 0;
  for i := 1 to n do
    begin
      while (q > 0) and (P[q + 1] <> T[i]) do
        q := Pie[q];
      if P[q + 1] = T[i] then
        begin
          Inc(q);
          if q = m then
            begin
              wbegin := i - 1; //position before the match
              wend := i + k - m;
              if wbegin < CurrentWindowPos then
                wbegin := CurrentWindowPos;
              if wend > n then
                wend := n;
              Count := Count + wend - wbegin;
              CurrentWindowPos := wend;
              q := Pie[q];
            end;
         end;
    end;
end;

procedure PrintResult;
var
  f: TextFile;
begin
  AssignFile(f, OutputFile); Rewrite(f);
  try
    Write(f, Count);
  finally
    CloseFile(f);
  end;
end;

begin
  Enter;
  Init;
  ComputePrefixFunction;
  KnuttMorrisPrattStrMatching;
  PrintResult;
end.

this is the first task.
is
4

ababababa
aba
5

