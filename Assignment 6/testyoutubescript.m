clear all 
close all 
clc 

x0 = [ 1 1]';

span = [0 10];

[time, xsol] = ode45(@(t,x)ode45solverfunc(t,x),span, x0);


plot(time, xsol(:,1), '--r');



