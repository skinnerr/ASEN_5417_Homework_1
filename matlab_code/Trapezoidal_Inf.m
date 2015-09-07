function [ F ] = Trapezoidal_Inf( f, min_x, n_slabpp, T, n_periods, y0 )

%%%
%
% Trapezoidal integration of a function handle f, assuming ...
%   - indefinite right bound, and
%   - function has some period T, and
%   - zero-value is undefined
%
% Note: n_slabpp is number of slabs per period.
%
% If the most recently calculated period's integral F_T divided by the total integral 
%   F + F_T,  is below tolerance, integration stops.
%
% If zero_value is specified, y(x==0) will be set to zero_value analytically. This is
%   intended to circumvent divide-by-zero errors at x==0 by passing the analytic value of
%   the limit to this function.
%
%%%

    % Number of points per period for the trapezoidal rule.
    n_ppp = n_slabpp + 1;
    
    % Index of the period we are evaluating.
    period_i = 0;
    
    % Value of the integral.
    F = 0;

    while period_i < n_periods
        
        % This period's contribution to the integral.
        F_T = 0;
        
        a = min_x +  period_i      * T;
        b = min_x + (period_i + 1) * T;
        x = linspace(a, b, n_ppp);
                 
        h = x(2) - x(1);
    
        y = zeros(1, n_ppp);
        for i = 1:n_ppp
            if x(i) == 0
                y(i) = y0;
            else
                y(i) = feval(f, x(i));
            end
        end
        
        % Sum each slab's contribution to this period's integral.
        for i = 1:n_slabpp
            slab = (h/2) * ( y(i) + y(i+1) );
            F_T = F_T + slab;
        end
        
        % Update total integral.
        F = F + F_T;
        
        % Move to the next period.
        period_i = period_i + 1;
        
    end

end