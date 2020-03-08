function x = ERKTemplate(ButcherArray, f, T, x0)
    % Returns the iterations of an ERK method
    % ButcherArray: Struct with the ERK's Butcher array
    % f: Function handle
    %    Vector field of ODE, i.e., x_dot = f(t,x)
    % T: Vector of time points, 1 x Nt
    % x0: Initial state, Nx x 1
    % x: ERK iterations, Nx x Nt
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Define variables
    % Allocate space for iterations (x) and k1,k2,...,kNstage
    % It is recommended to allocate a matrix K for all kj, i.e.
    % K = [k1 k2 ... kNstage]
    Nt = size(T,2);
    Nx = size(x0,1);
    dT = 0.4;
    xt = nan(Nx,Nt);
    Nstage = size(ButcherArray.A,2);
    K = nan(1,Nstage);
    
    
    
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    xt(:,1) = x0; % initial iteration
    % Loop over time points
    for nt=2:Nt
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Update variables
        K(1) = f(T(nt - 1),xt(:,nt-1));
        %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Loop that calculates k1,k2,...,kNstage
        for nstage=2:Nstage
            temp = 0;
            for j = 1:nstage - 1
                temp = ButcherArray.A(nstage,j)*K(j) + temp;
            end
            K(nstage) = f(T(nt - 1),xt(:,nt-1) + dT*temp);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Calculate and save next iteration value x_t
        temper = 0;
        for n = 1:Nstage
            temper = K(n)*ButcherArray.b(n) + temper;
        end
        xt(:,nt) = xt(:,nt -1) + dT*temper;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    x = xt;
end


