function [W,RHS] = BallAndBeamODEMatrices(in1,To,in3)
%BALLANDBEAMODEMATRICES
%    [W,RHS] = BALLANDBEAMODEMATRICES(IN1,TO,IN3)

%    This function was generated by the Symbolic Math Toolbox version 7.0.
%    11-Feb-2020 16:45:26

J = in3(1,:);
M = in3(2,:);
R = in3(3,:);
dtheta = in1(4,:);
g = in3(4,:);
theta = in1(2,:);
x = in1(1,:);
t2 = M.*R.*(7.0./5.0);
W = reshape([M.*(7.0./5.0),t2,t2,J+M.*R.^2.*(7.0./5.0)+M.*x.^2],[2,2]);
if nargout > 1
    t3 = sin(theta);
    RHS = [M.*(g.*t3-dtheta.^2.*x);To+M.*g.*(R.*t3+x.*cos(theta))];
end