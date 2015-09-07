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
    
    % Calculate the LHS with n = {10, 100};
    
    v10  = Simpsons(f, [0,2*pii], 10);
    v100 = Simpsons(f, [0,2*pii], 100);
    
    fprintf('LHS: %28.20e with n=10\n',  v10);
    fprintf('LHS: %28.20e with n=100\n', v100);
    
    re10  = abs(rhs - v10)  / rhs;
    re100 = abs(rhs - v100) / rhs;
    fprintf('re:  %28.20e with n=10\n',  re10);
    fprintf('re:  %28.20e with n=100\n', re100);
    
    Dashes();
    
    % Double the grid points, and re-calculate the LHS.
    
    v20  = Simpsons(f, [0,2*pii], 20);
    v200 = Simpsons(f, [0,2*pii], 200);
    
    fprintf('LHS: %28.20e with n=20\n',  v20);
    fprintf('LHS: %28.20e with n=200\n', v200);
    
    re20  = abs(rhs - v20)  / rhs;
    re200 = abs(rhs - v200) / rhs;
    fprintf('re:  %28.20e with n=20\n',  re20);
    fprintf('re:  %28.20e with n=200\n', re200);
    
    Dashes();
    
    % Use Richardson extrapolation on each set.
    
    ve1 = v20  + (v20  - v10 ) / 3;
    ve2 = v200 + (v200 - v100) / 3;
    fprintf('LHS: %28.20e with n={10, 20}  (Richardson)\n', ve1);
    fprintf('LHS: %28.20e with n={100,200} (Richardson)\n', ve2);
    
    reR1 = abs(rhs - ve1) / rhs;
    reR2 = abs(rhs - ve2) / rhs;
    fprintf('re:  %28.20e with n={10, 20}  (Richardson)\n', reR1);
    fprintf('re:  %28.20e with n={100,200} (Richardson)\n', reR2);
   
end