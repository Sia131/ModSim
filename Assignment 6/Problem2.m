clear all
close all
clc

eps = 10^(-6);
%alpha = 10^(-3); %2b
alpha = 0; %2c
parameters = [eps; alpha];

x0 = [1; 1];
%z0 = [1; 1];
A = [x0(1)^2 x0(2); 0 x0(2)^2] + alpha*eye(2);
z0 = A\x0*0.1; % Need to uphold the consistency condition(s) for DAE approx
state_0 = [x0; z0];

time_final = 15; %Final time


[time,statetraj] = ode15s(@(t,x)ODEfunc(t, x, parameters),[0,time_final],state_0);
[time2,statetraj2] = ode15s(@(t,x)ODEfunc2(t, x, parameters),[0,time_final],state_0);

figure('NumberTitle', 'off', 'Name', 'ODE vs DAE');
sgtitle('2c) \alpha = 0, \epsilon = 10^{-6}')

%ODE plots
subplot(4,2,1);
plot(time,statetraj(:,1),'r', 'LineWidth', 2);
title('ODE solution')
grid('on');
ylabel('x1')

subplot(4,2,3);
plot(time,statetraj(:,2),'b', 'LineWidth', 2);
grid('on');
ylabel('x2')

subplot(4,2,5);
plot(time,statetraj(:,3),'y', 'LineWidth', 2);
grid('on');
ylabel('z1')

subplot(4,2,7);
plot(time,statetraj(:,4), 'g','LineWidth', 2);
grid('on');
xlabel('t');

ylabel('z2');

%DAE plots
subplot(4,2,2);
plot(time2,statetraj2(:,1), 'r','LineWidth', 2);
title('DAE approximation, epsilon=0')
grid('on');

subplot(4,2,4);
plot(time2,statetraj2(:,2), 'b','LineWidth', 2);
grid('on');

subplot(4,2,6);
plot(time2,statetraj2(:,3),'y', 'LineWidth', 2);
grid('on');

subplot(4,2,8);
plot(time2,statetraj2(:,4),'g', 'LineWidth', 2);
grid('on');
xlabel('t');