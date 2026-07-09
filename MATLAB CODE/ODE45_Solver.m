clc ; clear all ; close all ;

% Ode45 Solver Code
R = 1 ; J = 0.01 ;  b = 0.1  ;  L = 0.5  ; Kt = 0.01;  Ke = 0.01;
V = 1 ; 
f = @(t,X) [(V-Ke*X(2)-R*X(1))/L;
           (Kt*X(1)-b*X(2))/J];
t_Span = [1 10];
X0 = [0 0];

[t1,X1] = ode45(f,t_Span,X0);

figure(1)
plot(t1,X1(:,2),'LineWidth',2) ; hold on;
grid on 

% Transfer Function
num = Kt;
den = [(J*L) (J*R + b*L) b*R + Kt*Ke];
G = tf(num,den);

[X2,t2] = step(G,t_Span);
plot(t2,X2,'LineWidth',2)

xlabel("Time (s)");
ylabel("Angular Veloity (rad/s)")
legend("Ode45 Solver", "Transfer Function")
title("Ode45 Solver Verification")


figure(2)
subplot(1,2,1)
plot(t1,X1(:,2),'LineWidth',2)
xlabel("Time (s)");
ylabel("Angular Veloity (rad/s)")
grid on 
subplot(1,2,2)
plot(t2,X2,'LineWidth',2)
grid on 
xlabel("Time (s)");
ylabel("Angular Veloity (rad/s)")
sgtitle("Ode45 Solver Verification")
