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