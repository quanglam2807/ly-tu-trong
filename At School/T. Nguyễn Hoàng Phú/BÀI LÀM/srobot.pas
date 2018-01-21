uses SysUtils, STRobot;
const angle90  = 90;
      wall     = 10;

var robot: SROBOT;
    touch: STOUCHSENSOR;
    light: SLIGHTSENSOR;
    sonicl, sonicr: SULTRASONICSENSOR;
    pilot: SPILOT;
    color: SCOLORSENSOR;

procedure MoveForward(l:longint);
begin
  if l >= 99999 then
    writeln('Victory')
  else  if l = 0 then
    writeln('Move Forward with Unknown Distance')
  else
    writeln('Move Forward: ',l,'cm');
  if l > 0 then
    pilotForwardbyDistance(pilot,l,TYPE_POWER,50)
  else
    pilotForward(pilot,TYPE_POWER,50);
end;

procedure MoveBackward(l:longint);
begin
  if l >= 99999 then
    writeln('Victory')
  else  if l = 0 then
    writeln('Move Backward with Unknown Distance')
  else
    writeln('Move Backward: ',l,'cm');
  if l > 0 then
    pilotBackwardbyDistance(pilot,l,TYPE_POWER,50)
  else
    pilotBackward(pilot,TYPE_POWER,50);
end;

procedure TurnLeft;
begin
  writeln('Turn Left');
  pilotTurnLeftbyAngle(pilot,angle90,TYPE_POWER,50);
end;

procedure TurnRight;
begin
  writeln('Turn Right');
  pilotTurnRightbyAngle(pilot,angle90,TYPE_POWER,50);
end;

procedure TurnAround;
begin
  writeln('Turn Around');
  pilotTurnRightbyAngle(pilot,angle90*2,TYPE_POWER,50);
end;

begin
  robot:= createRobot('NXT2', 'robot', 35, 112, -90);
  touch:=robotGetTouchSensor(robot,PORT_S1);
  color:=robotGetColorSensor(robot,PORT_S2);
  sonicl:=robotGetUltrasonicSensor(robot,port_S3);
  sonicr:=robotGetUltrasonicSensor(robot,port_S4);
  pilot:=robotGetPilot(robot);
  repeat
    while not TouchSensorIsPressed(touch) do
      MoveForward(0);
    if colorSensorGetColor(color) = COLOR_BLUE then
      begin
        MoveBackward(5);
        TurnLeft;
      end;
    if colorSensorGetColor(color) = COLOR_YELLOW then
      begin
        MoveBackward(5);
        TurnRight;
      end;
  until colorSensorGetColor(color) = COLOR_GREEN;

end.

