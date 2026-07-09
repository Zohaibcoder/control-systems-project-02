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
