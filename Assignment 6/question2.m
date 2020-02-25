clear all 
close all 
clc 


x0 = [1 1 1 1]';
timespan = [0 10];

[time1, solution1] = ode15s(@(t,x)ode15solver(t,x),timespan, x0);

plot(time1, solution1(:,2), '--r');
