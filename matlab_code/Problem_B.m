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
    x = linspace(0,25);
    y = zeros(0,length(x));
    for i = 1:length(x)
        y(i) = f(x(i));
    end
    plot(x,y);
    xlabel('x');
    ylabel('y');
    legend('sin(x)^4 / x^4');
    
    min_x   = 0;
    slabspp = 4;
    y0      = 1;
    
    pers = (1:9)' * 10.^(0:3);
    pers = reshape(pers, 1, numel(pers));
    F1   = zeros(1, length(pers));
    F2   = zeros(1, length(pers));
    Fe   = zeros(1, length(pers));
    
    for i = 1:length(pers)
        
        per = pers(i);
    
        F1(i) = Trapezoidal_Inf(f, min_x, slabspp,   2*pii, per, y0);
        F2(i) = Trapezoidal_Inf(f, min_x, slabspp*2, 2*pii, per, y0);
        Fe(i) = F2(i) + (F2(i) - F1(i)) / 3;
    
    end

    re1 = RelErr(F1, rhs);
    re2 = RelErr(F2, rhs);
    ree = RelErr(Fe, rhs);
    
    figure();
    loglog(pers, re1, pers, re2, pers, ree);
    xlim([min(pers),max(pers)]);
    xlabel('Periods Integrated');
    ylabel('Relative Error');
    legend('4 Slabs / Period', '8 Slabs / Period', 'Richardson Extrapolation');
    
    %%%%%%%%%%%%%
    % Part (ii) %
    %%%%%%%%%%%%%
    
    % Calculate the RHS.
    rhs = sqrt(pii / 2);
    fprintf('RHS: %28.20e\n', rhs);
    
    % Define the integrand with a function handle.
    f = @(x) sin(x) / sqrt(x);
    
    figure();
    x = linspace(0,500,5000);
    y = zeros(0,length(x));
    for i = 1:length(x)
        y(i) = f(x(i));
    end
    plot(x,y);
    xlabel('x');
    ylabel('y');
    legend('sin(x) / sqrt(x)');
    
    min_x   = 0;
    y0      = 1;
    
    % Do slabs/period = {4, 8}.
    
    slabspp = 4;
    
    pers = (1:9)' * 10.^(0:2);
    pers = reshape(pers, 1, numel(pers));
    F1   = zeros(1, length(pers));
    F2   = zeros(1, length(pers));
    Fe   = zeros(1, length(pers));
    
    for i = 1:length(pers)
        
        per = pers(i);
    
        F1(i) = Trapezoidal_Inf(f, min_x, slabspp,   2*pii, per, y0);
        F2(i) = Trapezoidal_Inf(f, min_x, slabspp*2, 2*pii, per, y0);
        Fe(i) = F2(i) + (F2(i) - F1(i)) / 3;
    
    end

    re1 = RelErr(F1, rhs);
    re2 = RelErr(F2, rhs);
    ree = RelErr(Fe, rhs);
    
    figure();
    loglog(pers, re1, pers, re2, pers, ree);
    xlim([min(pers),max(pers)]);
    xlabel('Periods Integrated');
    ylabel('Relative Error');
    legend('4 Slabs / Period', '8 Slabs / Period', 'Richardson Extrapolation');
    
    % Do slabs/period = {22, 44}.
    
    slabspp = 22;
    
    pers = (1:9)' * 10.^(0:2);
    pers = reshape(pers, 1, numel(pers));
    pers = 1:150;
    F1   = zeros(1, length(pers));
    F2   = zeros(1, length(pers));
    Fe   = zeros(1, length(pers));
    
    for i = 1:length(pers)
        
        per = pers(i);
    
        F1(i) = Trapezoidal_Inf(f, min_x, slabspp,   2*pii, per, y0);
        F2(i) = Trapezoidal_Inf(f, min_x, slabspp*2, 2*pii, per, y0);
        Fe(i) = F2(i) + (F2(i) - F1(i)) / 3;
    
    end

    re1 = RelErr(F1, rhs);
    re2 = RelErr(F2, rhs);
    ree = RelErr(Fe, rhs);
    
    figure();
    loglog(pers, re1, pers, re2, pers, ree);
    xlim([min(pers),max(pers)]);
    xlabel('Periods Integrated');
    ylabel('Relative Error');
    legend('28 Slabs / Period', '56 Slabs / Period', 'Richardson Extrapolation');
   
end