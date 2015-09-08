function [] = Problem_B()
    
    % Calculate pi, but name it pii since MATLAB has already defined the variable pi.
    pii = 4 * atan(1);

    %%%%%%%%%%%%
    % Part (i) %
    %%%%%%%%%%%%
    
    % Calculate the RHS.
    rhs = pii / 3;
    fprintf('RHS: %28.20e\n', rhs);
    
    % Define the integrand with a function handle.
    f = @(x) sin(x)^4 / x^4;
    
    figure();
    x = linspace(0,10,500);
    y = zeros(0,length(x));
    for i = 1:length(x)
        y(i) = f(x(i));
    end
    plot(x,y);
    xlabel('x');
    ylabel('y');
    legend('sin(x)^4 / x^4');
    
    min_x   = 0;
    max_x   = 8*pi;
    y0      = 1;
    
    n = 1:30;
    F1   = zeros(1, length(n));
    F2   = zeros(1, length(n));
    Fe   = zeros(1, length(n));
    
    for i = 1:length(n)
        
        n_current = n(i);
    
        F1(i) = Trapezoidal_Inf(f, min_x, max_x, n_current,   y0);
        F2(i) = Trapezoidal_Inf(f, min_x, max_x, n_current*2, y0);
    
    end
    
    Fe = F2 + (F2 - F1) / 3;

    re1 = RelErr(F1, rhs);
    re2 = RelErr(F2, rhs);
    ree = RelErr(Fe, rhs);
    
    figure();
    loglog(n, re1, n, ree);
    xlim([min(n),max(n)]);
    ylim([1e-6, 1]);
    xlabel('Number of Slabs');
    ylabel('Relative Error');
    legend('Trapezoidal Rule', 'Richardson with h1/h2 = 2', 'Location', 'southwest');
    
    %%%%%%%%%%%%%
    % Part (ii) %
    %%%%%%%%%%%%%
    
    % Calculate the RHS.
    rhs = sqrt(pii / 2);
    fprintf('RHS: %28.20e\n', rhs);
    
    % Define the integrand with a function handle.
    f = @(x) sin(x) / sqrt(x);
    
    figure();
    x = linspace(0,100,20000);
    y = zeros(0,length(x));
    for i = 1:length(x)
        y(i) = f(x(i));
    end
    plot(x,y);
    xlabel('x');
    ylabel('y');
    legend('sin(x) / sqrt(x)');
    
    min_x   = 0;
    max_x   = 300*pi;
    y0      = 1;
    
    n = 1000:1000:25000;
    F1   = zeros(1, length(n));
    F2   = zeros(1, length(n));
    
    for i = 1:length(n)
        
        n_current = n(i);
        disp(n_current);
    
        F1(i) = Trapezoidal_Inf(f, min_x, max_x, n_current,   y0);
        F2(i) = Trapezoidal_Inf(f, min_x, max_x, n_current*2, y0);
    
    end
    
    Fe = F2 - (F2 - F1) / 3;

    re1 = RelErr(F1, rhs);
    re2 = RelErr(F2, rhs);
    ree = RelErr(Fe, rhs);
    
    figure();
    loglog(n, re1, n, ree);
    xlim([min(n),max(n)]);
    xlabel('Number of Slabs');
    ylabel('Relative Error');
    legend('Trapezoidal Rule', 'Richardson with h1/h2 = 2', 'Location', 'northeast');
   
end