const fileinp = 'C:\XAMPP\htdocs\themis\init.php';
      fileout = 'C:\XAMPP\htdocs\themis\dt1112.contest';

var c:char;
begin
  assign(input,fileinp); reset(input);
  assign(output,fileout); rewrite(output);
  while not eof do
    begin
      while not eoln do
        begin
          read(c);
          write(c);
        end;
      readln;
      writeln;
    end;
  close(input);  close(output);
end.