%% ----- Single Parameter Effect -----

t = 0:0.01:8;
R = 1 ; J = 0.01 ;  b = 0.1  ;  L = 0.5  ; Kt = 0.01;  Ke = 0.01;

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