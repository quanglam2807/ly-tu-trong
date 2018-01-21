{$MODE OBJFPC}
const fileinp = 'substr.INP';
      fileout = 'substr.OUT';
      max = 100000;
      maxV = 1000000;
var
  a, t: array[0..max + 1] of Integer;
  s: array[1..max + 2] of Integer;
  n, m: Integer;

procedure Enter;
var i:Integer;
    ss:string;
begin
  assign(input,fileinp); reset(input);
  readln(ss);
  n:=length(ss);
  for i:=1 to length(ss) do
    a[i]:=ord(ss[i]);
  close(input);
end;

procedure Init;
begin
  a[0]:= -maxV - 1; a[n + 1] := maxV + 1;
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
var i: Integer;
begin
  assign(output,fileout); rewrite(output);
  WriteLn(m - 2);
  i := t[0];
  while i <> n + 1 do
    begin
      Write(chr(a[i]));
      i := t[i];
    end;
  close(output);
end;

begin
  Enter;
  Init;
  Optimize;
  PrintResult;
end.
