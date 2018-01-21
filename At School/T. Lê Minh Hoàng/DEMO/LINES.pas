{$MODE OBJFPC}
program Lines;
const
  InputFile  = 'LINES.INP';
  OutputFile = 'LINES.OUT';
  max = 100000;
var
  a, b: array[0..max + 1] of Integer;
  s: array[0..max + 1] of Integer;
  Map: array[1..max] of Integer;
  Trace: array[0..max] of Integer;
  n, m: Integer;

procedure Enter;
var
  f: TextFile;
  i: Integer;
begin
  AssignFile(f, InputFile); Reset(f);
  try
    Readln(f, n);
    for i := 1 to n do Read(f, a[i]);
    Readln(f);
    for i := 1 to n do Read(f, b[i]);
  finally
    CloseFile(f);
  end;
end;

procedure Init;
var
  i: Integer;
begin
  for i := 1 to n do
    Map[b[i]] := i;
  for i := 1 to n do a[i] := Map[a[i]];
  a[n + 1] := n + 1;
  a[0] := 0;
  m := 1;
  s[m] := n + 1;
end;

//Find l as large as possible, so that a[s[l]] > a[i]
//a[s[1]] > a[s[2]] > a[s[3]]...

function Find(v: Integer): Integer;
var
  Low, Middle, High: Integer;
begin
  Low := 2; High := m; //Loop invariant: a[s[Low - 1]] > v >= a[High + 1]
  while Low <= High do
    begin
      Middle := (Low + High) div 2;
      if a[s[Middle]] > v then Low := Middle  + 1
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
      lambda := Find(a[i]);
      Trace[i] := s[lambda];
      Inc(lambda);
      s[lambda] := i;
      if m < lambda then m := lambda;
    end;
end;

procedure PrintResult;
var
  f: TextFile;
  i, j: Integer;
begin
  AssignFile(f, OutputFile); Rewrite(f);
  try
    Writeln(f, m - 2);
    j := s[m - 1];
    for i := 1 to m - 2 do
      begin
        Write(f, b[a[j]], ' ');
        j := Trace[j];
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
6
2 3 1 5 6 4
3 2 5 6 1 4
7
1 2 3 4 5 6 7
1 2 6 7 3 4 5
