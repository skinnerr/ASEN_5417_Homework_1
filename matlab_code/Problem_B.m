function [] = Problem_B()
    
    % Calculate pi, but name it pii since MATLAB has already defined the variable pi.
    pii = 4 * atan(1);
    fprintf('pi:  %28.20e\n', pii);
    
    Dashes();

    %%%%%%%%%%%%
    % Part (i) %
    %%%%%%%%%%%%
    
%     % Define the integrand with a function handle.
%     f = @(x) sin(x)^4 / x^4;
%     
%     figure();
%     x = linspace(0,10,1000);
%     y = zeros(0,length(x));
%     for i = 1:length(x)
%         y(i) = f(x(i));
%     end
%     plot(x,y);
    
    %%%%%%%%%%%%%
    % Part (ii) %
    %%%%%%%%%%%%%
    
    % Define the integrand with a function handle.
    f = @(x) sin(x) / sqrt(x);
    
    F = Trapezoidal_Inf(f, 0, 16, 2*pii, 0.0000001, 0);
    
%     figure();
%     x = linspace(0,100,1000);
%     y = zeros(0,length(x));
%     for i = 1:length(x)
%         y(i) = f(x(i));
%     end
%     plot(x,y);
   
end