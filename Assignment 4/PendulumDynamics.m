function [ state_dot ] = PendulumDynamics(t, state, param )
%state = [q; dq] = [x theta1 theta2 dx dtheta1 dtheta2]'
%param = [m M L g]'

F = -10*state(1) - state(4);

[W, RHS] = PendulumODEMatrices(state, F, param);

state_dot = [state(4:6);
            W\RHS];
end