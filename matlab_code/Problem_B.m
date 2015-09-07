function [] = Problem_B()
    
    % Calculate pi, but name it pii since MATLAB has already defined the variable pi.
    pii = 4 * atan(1);
    fprintf('pi:  %28.20e\n', pii);
    
    Dashes();

    %%%%%%%%%%%%
    % Part (i) %
    %%%%%%%%%%%%
    
    % Define the integrand with a function handle.
    f = @(x) sin(x)^4 / x^4;
    
    min_x            = 0;
    slabs_per_period = 32;
    tol              = 0.00001;
    
    F = Trapezoidal_Inf(f, min_x, slabs_per_period, 2*pii, tol, 1);
    fprintf('Integral: %.10e\n', F);
    
    figure();
    x = linspace(0,10,1000);
    y = zeros(0,length(x));
    for i = 1:length(x)
        y(i) = f(x(i));
    end
    plot(x,y);
    
    return
    
    %%%%%%%%%%%%%
    % Part (ii) %
    %%%%%%%%%%%%%
    
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