function [] = Problem_A()

    % Define the integrand with a function handle.
    a = 1/2;
    f = @(x) 1 / (1 + a*cos(x));
    
    % Calculate pi, but name it pii since MATLAB has already defined the variable pi.
    pii = 4 * atan(1);
    fprintf('pi:  %28.20e\n', pii);
    
    Dashes();
    
    % Calculate the RHS.
    rhs = 2 * pii / sqrt(1 - a^2);
    fprintf('RHS: %28.20e\n', rhs);
    
    Dashes();
    
    % Calculate the LHS with n = {10, 100}.
    % Note: this corresponds to {5, 50} large slabs over which Simpson's method operates
    %   (dividing each slab into two intervals).
    
    v10  = Simpsons(f, [0,2*pii], 5);
    v100 = Simpsons(f, [0,2*pii], 50);
    
    fprintf('LHS: %28.20e with n=10\n',  v10);
    fprintf('LHS: %28.20e with n=100\n', v100);
    
    re10  = RelErr(v10,  rhs);
    re100 = RelErr(v100, rhs);
    fprintf('re:  %28.20e with n=10\n',  re10);
    fprintf('re:  %28.20e with n=100\n', re100);
    
    Dashes();
    
    % Double the grid points, and re-calculate the LHS.
    % Note: this corresponds to {5, 50} large slabs over which Simpson's method operates
    %   (dividing each slab into two intervals).
    
    v20  = Simpsons(f, [0,2*pii], 10);
    v200 = Simpsons(f, [0,2*pii], 100);
    
    fprintf('LHS: %28.20e with n=20\n',  v20);
    fprintf('LHS: %28.20e with n=200\n', v200);
    
    re20  = RelErr(v20,  rhs);
    re200 = RelErr(v200, rhs);
    fprintf('re:  %28.20e with n=20\n',  re20);
    fprintf('re:  %28.20e with n=200\n', re200);
    
    Dashes();
    
    % Use Richardson extrapolation on each set.
    
    ve1 = v20  + (v20  - v10 ) / 15;
    ve2 = v200 + (v200 - v100) / 15;
    fprintf('LHS: %28.20e with n={10, 20}  (Richardson)\n', ve1);
    fprintf('LHS: %28.20e with n={100,200} (Richardson)\n', ve2);
    
    reR1 = RelErr(ve1, rhs);
    reR2 = RelErr(ve2, rhs);
    fprintf('re:  %28.20e with n={10, 20}  (Richardson)\n', reR1);
    fprintf('re:  %28.20e with n={100,200} (Richardson)\n', reR2);
   
end