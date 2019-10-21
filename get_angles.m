function [q1, q2, q3, q4] = get_angles(x,y,z)
    alpha = 75;
    h=53;
    r=30.309;
    l2=170.384;
    l3=136.307;
    l4=86.0;
    end_eff_l=40.0;

    side1 = (z - h) + (sind(alpha) * l4);
    side2 = sqrt(x^2 + y^2) - r - (cosd(alpha)*l4);
    C = sqrt( side1^2 + side2^2);


    shoulder = acosd((C^2 + l2^2 - l3^2) / (2* C* l2));

    elbow = acosd( (l3^2 + l2^2 - C^2)/ (2*l3*l2) );

    %wrist = acosd( (l3^2 + C^2 - l2^2) / (2*l3*C));

    shoulder = shoulder + (atan2d(side1,side2));

    wrist = (180*3)-((alpha+90)+elbow+shoulder+90);

    base =(atan2d(y,x));


    q1=base-1;
    q2=shoulder;
    q3=elbow;
    q4=wrist;

    %claw.setAllJointsPosition(joint_angles)
end