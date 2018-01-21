var xM, yM, xA, yA, xO, yO, xN, yN: longint;
    MO, NO, MN, AM, AN, AO, p, s, s1, s2, s3: real;
begin
  write('Hoanh do diem M, xM = '); readln(xM);
  write('Tung do diem M, yM = '); readln(yM);
  write('Hoanh do diem A, xA = '); readln(xA);
  write('Tung do diem A, yA = '); readln(yA);
  xO:=0; yO:=0; xN:=xM; yN:=0;
  MO:=sqrt(sqr(xO-xM)+sqr(yO-yM));
  NO:=sqrt(sqr(xO-xN)+sqr(yO-yN));
  MN:=sqrt(sqr(xN-xM)+sqr(yN-yM));
  p:=(MO+NO+MN)/2;
  s:=sqrt(p*(p-MO)*(p-NO)*(p-MN));
  AM:=sqrt(sqr(xA-xM)+sqr(yA-yM));
  AN:=sqrt(sqr(xA-xN)+sqr(yA-yN));
  AO:=sqrt(sqr(xA-xO)+sqr(yA-yO));
  p:=(AM+AO+MO)/2;
  s1:=sqrt(p*(p-AM)*(p-AO)*(p-MO));
  p:=(AM+AN+MN)/2;
  s2:=sqrt(p*(p-AM)*(p-AN)*(p-MN));
  p:=(AO+AN+NO)/2;
  s3:=sqrt(p*(p-AO)*(p-AN)*(p-NO));
  if abs(s - (s1 + s2 + s3)) < 0.00001 then write('A nam trong tam giac OMN')
  else write('A khong nam trong tam giac OMN');
  readln
end.