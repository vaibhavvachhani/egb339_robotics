clear all; close all;
%%
claw = TheClaw();

for id = claw.BASE:claw.WRIST
    claw.setJointTorqueEnable(id, 1); % Enable torque on motor
    claw.setJointControlMode(id, claw.POS_TIME); % Set mode to time to position
    claw.setJointTimeToPosition(id, 2); % Set joint time to position to 2 seconds
end
%%

points1 = [334.8 196.4; 274.4 327.5; 214.8 213.8;287.8 451.4; 93.8 82.9; 99.4 498.8;];
%%
for m=1:2:6
    x = (points1(m, 1))-100;
    y = 290-points1(m, 2);

    mouth_values = [340; 230;];
    heights = [150; 65; 73; 150;];
    for v=1:4
        mouth = mouth_values(1);
        if (v==3 || v==4)
            mouth = mouth_values(2);
        end
        [q1, q2, q3, q4] = get_angles(x, y, heights(v));
        joint_angles = [q1, q2, q3, q4, mouth];
        claw.setAllJointsPosition(real(joint_angles));
        pause(5);

    end
    pause(5)
    x = (points1(m+1, 1))-100;
    y = 290-points1(m+1, 2);

    mouth_values = [230; 340;];
    for v=1:4
        mouth = mouth_values(1);
        if (v==3 || v==4)
            mouth = mouth_values(2);
        end
        [q1, q2, q3, q4] = get_angles(x, y, heights(v));
        joint_angles = [q1, q2, q3, q4, mouth];
        claw.setAllJointsPosition(real(joint_angles));
        pause(5);

    end

end
%%
claw.stop()
