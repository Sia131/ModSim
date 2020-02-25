
function value = ode15solver(t,states)
x = [states(1); states(2)];
z = [states(3); states(4)];

%parameters
epsilon = 10;
alpha = 10^(-3);

F = [1 1; 0 1];
I = eye(2);
A_1 = [x(1)*x(1) x(2); 0 x(2)*x(2)];
A = A_1 + alpha*I;

dx = F*x - z;
dz = (1/epsilon)*(x/10 - A*z);

value = [dx; dz];
