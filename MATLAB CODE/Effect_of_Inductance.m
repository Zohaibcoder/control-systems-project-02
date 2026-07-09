%% ----- Single Parameter Effect -----

t = 0:0.01:8;
R = 1 ; J = 0.01 ;  b = 0.1  ;  L = 0.5  ; Kt = 0.01;  Ke = 0.01;

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