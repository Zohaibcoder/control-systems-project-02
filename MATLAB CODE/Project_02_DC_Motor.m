clc , clear all , close all 

%% -----------------------DC MOTOR SPEED CONTROL---------------

%% ----- System Parameters-----
J = 0.01 ;  % Moment of Inertia (kg.m^2)
b = 0.1  ;  % Viscous Friction Coefficient (N.m.s)
R = 1    ;  % Resistane (Ohm)
L = 0.5  ;  % Inuctance (H)
Kt = 0.01;  % Motor Torque Constant (N.m/A)
Ke = 0.01;  % Back-EMF Constant (V/rad/s)

% Transfer Function
num = Kt ;
den = [(J*L) (J*R + b*L) b*R + Kt*Ke];
G = tf(num,den)

% Poles of System 
disp("Poles:")
p = pole(G)

%% ----- Response of System -----
figure(1)
% Step Response
t = [0 50];
step(G,t)
disp("System Performance:")
S = stepinfo(G)
title('DC Motor Step Response - Open Loop')

figure(2)
% Impulse Response
impulse(G)
title('DC Motor Impulse Response - Open Loop')

%% ----- Single Parameter Effect -----

t = 0:0.01:8;
R = 1 ; J = 0.01 ;  b = 0.1  ;  L = 0.5  ; Kt = 0.01;  Ke = 0.01;


%% Effect of Resistance
figure(3)
R_val = [0.5, 1, 2, 5];
for i = 1:length(R_val)
    R = R_val(i);
    num = Kt;
    den = [(J*L) (J*R + b*L) b*R + Kt*Ke];
    G_R = tf(num,den);
    [y,x] = step(G_R,t) ; hold on 
    plot(x,y,'LineWidth',2)
    fprintf('Poles at R = %.2f \n',R)
    p_R = pole(G_R)
    info_R = stepinfo(G_R);
    fprintf('System Performance at R = %.2f : \n',R)
    fprintf('   Rise Time : %.3f s \n',info_R.RiseTime)
    fprintf('   Peak Time : %.3f s \n',info_R.PeakTime)
    fprintf('   Settling Time : %.3f s \n',info_R.SettlingTime)
    fprintf('   Overshoot Time : %.3f \n',info_R.Overshoot)
    grid on 
end
legend('R = 0.5' , 'R = 1' , 'R = 2' , 'R = 5',Location='best')
title ('Effect of Reistance on Speed Response')

%% Effect of Moment of Inertia    
figure(4)
J_val = [0.005, 0.01, 0.05, 0.1];
% J_val = [0.005, 0.01,0.02,0.03,0.04, 0.05, 0.1,0.2,0.3, 0.4 , 0.5 , 0.6 , 0.7 , 0.8 ,0.9 ,1];
for i = 1:length(J_val)
    J = J_val(i);
    num = Kt;
    den = [(J*L) (J*R + b*L) b*R + Kt*Ke];
    G_J = tf(num,den);
    [y,x] = step(G_J,t) ; hold on 
    plot(x,y,'LineWidth',2)
    fprintf('Poles at J = %.3f \n',J)
    p_J = pole(G_J)
    info_J = stepinfo(G_J);
    fprintf('System Performance at J = %.2f : \n',J)
    fprintf('   Rise Time : %.3f s \n',info_J.RiseTime)
    fprintf('   Peak Time : %.3f s \n',info_J.PeakTime)
    fprintf('   Settling Time : %.3f s \n',info_J.SettlingTime)
    fprintf('   Overshoot Time : %.3f \n',info_J.Overshoot)
    grid on 
end
legend('J = 0.005' , 'J = 0.01' , 'J = 0.05' , 'J = 0.1',Location='best')
title ('Effect of Inertia on Speed Response')

%% Effect of Friction
figure(5)
b_val = [0.01, 0.1, 0.5, 1];
% b_val = [0.01,0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09, 0.1, 0.5, 1];
for i = 1:length(b_val)
    b = b_val(i);
    num = Kt;
    den = [(J*L) (J*R + b*L) b*R + Kt*Ke];
    G_b = tf(num,den);
    [y,x] = step(G_b,t) ; hold on 
    plot(x,y,'LineWidth',2)
    fprintf('Poles at b = %.2f \n',b)
    p_b = pole(G_b)
    info_b = stepinfo(G_b);
    fprintf('System Performance at b = %.2f : \n',b)
    fprintf('   Rise Time : %.3f s \n',info_b.RiseTime)
    fprintf('   Peak Time : %.3f s \n',info_b.PeakTime)
    fprintf('   Settling Time : %.3f s \n',info_b.SettlingTime)
    fprintf('   Overshoot Time : %.3f \n',info_b.Overshoot)
    grid on 
end
legend('b = 0.01' , 'b = 0.1' , 'b = 0.5' , 'b = 1',Location='best')
title ('Effect of Friction on Speed Response')

%% Effect of Inductance
figure(6)
L_val = [0.01, 0.1, 0.5, 1];
% L_val = [0.01, 0.02,0.03,0.04,0.05,0.06,0.07,0.08,0.09,0.1,0.2,0.3,0.4, 0.5, 1];
for i = 1:length(L_val)
    L = L_val(i);
    num = Kt;
    den = [(J*L) (J*R + b*L) b*R + Kt*Ke];
    G_L = tf(num,den);
    [y,x] = step(G_L,t) ; hold on 
    plot(x,y,'LineWidth',2)
    fprintf('Poles at L = %.2f \n',L)
    p_L = pole(G_L)
    info_L = stepinfo(G_L);
    fprintf('System Performance at L = %.2f : \n',L)
    fprintf('   Rise Time : %.3f s \n',info_L.RiseTime)
    fprintf('   Peak Time : %.3f s \n',info_L.PeakTime)
    fprintf('   Settling Time : %.3f s \n',info_L.SettlingTime)
    fprintf('   Overshoot Time : %.3f \n',info_L.Overshoot)
    grid on 
end
legend('L = 0.01' , 'L = 0.1' , 'L = 0.5' , 'L = 0.1',Location='best')
title ('Effect of Inductance on Speed Response')

