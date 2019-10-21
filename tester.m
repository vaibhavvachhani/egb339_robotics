clear all;
%%
claw = TheClaw();

for id = claw.BASE:claw.WRIST
    claw.setJointTorqueEnable(id, 1); % Enable torque on motor
    claw.setJointControlMode(id, claw.POS_TIME); % Set mode to time to position
    claw.setJointTimeToPosition(id, 2); % Set joint time to position to 2 seconds
end
%%

ang = claw.getAllJointsPosition()
ang(1) = 0;
claw.setAllJointsPosition(ang)


%%
claw.stop()