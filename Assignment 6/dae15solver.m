

function value = dae15solver(t,states)
x = [states(1); states(2)];
z = [states(3); states(4)];

%parameters
%epsilon = 10^(-3);
alpha = 10^(-3);

%matrices
F = [1 1; 0 1];
A = [x(1)*x(1) x(2); 0 x(2)*x(2)]; + alpha*eye(2);

dx = -F*x - z;
dz = x/10 - A*z;

value = [dx; dz];
