function [ state_dot ] = BallAndBeamDynamics( t, state, param )
%state = [q dq]' = [x theta dx dtheta]'
%param = [J M R, g]'

To = 200*(state(1)-state(2)) + 70*(state(3)-state(4));

[W, RHS] = BallAndBeamODEMatrices(state, To, param);

state_dot = [state(3:4);
            W\RHS];
        
end
