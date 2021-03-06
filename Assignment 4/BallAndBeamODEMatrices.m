function [W,RHS] = BallAndBeamODEMatrices(in1,To,in3)
%BALLANDBEAMODEMATRICES
%    [W,RHS] = BALLANDBEAMODEMATRICES(IN1,TO,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.3.
%    16-Feb-2020 21:55:02

J = in3(1,:);
M = in3(2,:);
R = in3(3,:);
dtheta = in1(4,:);
g = in3(4,:);
theta = in1(2,:);
x = in1(1,:);
t2 = sin(theta);
t3 = M.*R.*(7.0./5.0);
W = reshape([M.*(7.0./5.0),t3,t3,J+R.*t3+M.*x.^2],[2,2]);
if nargout > 1
    RHS = [M.*(g.*t2-dtheta.^2.*x);To+M.*g.*(R.*t2+x.*cos(theta))];
end
