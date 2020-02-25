function value = ode45solverfunc(t, x)

c = 5;
m = 10;
k = 15;

A = [0 1; k/m -c/m];

value = A*x;


