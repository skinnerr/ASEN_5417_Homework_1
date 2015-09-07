function [] = Problem_B()
    
    % Calculate pi, but name it pii since MATLAB has already defined the variable pi.
    pii = 4 * atan(1);
    fprintf('pi:  %28.20e\n', pii);
    
    Dashes();

    %%%%%%%%%%%%
    % Part (i) %
    %%%%%%%%%%%%
    
    % Calculate the RHS.
    rhs = pii / 3;
    fprintf('RHS:                       %28.20e\n', rhs);
    
    % Define the integrand with a function handle.
    f = @(x) sin(x)^4 / x^4;
    
    min_x   = 0;
    slabspp = 4;
    tol     = 0.00001;
    y0      = 1;
    
    F1 = Trapezoidal_Inf(f, min_x, slabspp,   2*pii, tol, y0);
    fprintf('Integral (%2i slab/period): %28.20e\n', slabspp,   F1);
    F2 = Trapezoidal_Inf(f, min_x, slabspp*2, 2*pii, tol, y0);
    fprintf('Integral (%2i slab/period): %28.20e\n', slabspp*2, F2);
    Fe = F2 + (F2 - F1) / 3;
    fprintf('Richardson-Extrapolated:   %28.20e\n', Fe);
    
    re1 = RelErr(F1, rhs);
    re2 = RelErr(F2, rhs);
    ree = RelErr(Fe, rhs);
    fprintf('Error (%2i slab/period): %28.20e\n', slabspp,   re1);
    fprintf('Error (%2i slab/period): %28.20e\n', slabspp*2, re2);
    fprintf('Error (    Richardson): %28.20e\n',             ree);
    
%     figure();
%     x = linspace(0,10,1000);
%     y = zeros(0,length(x));
%     for i = 1:length(x)
%         y(i) = f(x(i));
%     end
%     plot(x,y);
    
    return
    
    %%%%%%%%%%%%%
    % Part (ii) %
    %%%%%%%%%%%%%
    
    % Calculate the RHS.
    rhs = sqrt(pii / 2);
    fprintf('RHS: %28.20e\n', rhs);
    
    % Define the integrand with a function handle.
    f = @(x) sin(x) / sqrt(x);
    
    min_x            = 0;
    slabs_per_period = 32;
    tol              = 0.01;
    
    F = Trapezoidal_Inf(f, min_x, slabs_per_period, 2*pii, tol, 0)
    
%     figure();
%     x = linspace(0,100,1000);
%     y = zeros(0,length(x));
%     for i = 1:length(x)
%         y(i) = f(x(i));
%     end
%     plot(x,y);
   
end