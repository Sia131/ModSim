clear all 
close all 
clc 

x0 = [1 1 1 1]';
timespan = [0 15];

%parameters
%epsilon = 10^(-3);
alpha = 10^(-3);

%matrices
F = [1 1; 0 1];
A = [x(1)*x(1) x(2); 0 x(2)*x(2)]; + alpha*eye(2);

M = [1 0 1 0;0 1 0 1; 0 0 -A(1,1) -A(1,2); 0 0 0 -A(2,2)];

options = odeset('Mass', M );




[time1, solution1] = ode15s(@(t,x)ode15solver(t,x),timespan, x0);
[time2, solution2] = ode15s(@(t,x)dae15solver(t,x),timespan,x0, options);

subplot(4,2,1)
plot(time1, solution1(:,1), 'r','LineWidth', 2);
title('ODE solution')
grid('on');
ylabel('x1')

subplot(4,2,3);
plot(time1, solution1(:,2),'b','LineWidth', 2);
grid('on')
ylabel('x2');

subplot(4,2,5);
plot(time1, solution1(:,3),'y','LineWidth', 2);
grid('on');
ylabel('z1');

subplot(4,2,7);
plot(time1, solution1(:,4), 'g','LineWidth', 2);
grid('on');
ylabel('z2');
xlabel('t');


subplot(4,2,2);
title('DAE solution')
plot(time2, solution2(:,1), 'r','LineWidth', 2);



subplot(4,2,1);
subplot(4,2,1);
subplot(4,2,1);






