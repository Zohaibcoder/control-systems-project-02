%% ----- Single Parameter Effect -----

t = 0:0.01:8;
R = 1 ; J = 0.01 ;  b = 0.1  ;  L = 0.5  ; Kt = 0.01;  Ke = 0.01;

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
