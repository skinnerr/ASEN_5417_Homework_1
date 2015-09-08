function [ F ] = Trapezoidal_Inf( f, min_x, max_x, n, y0 )

%%%
%
% Trapezoidal integration of a function handle f, assuming ...
%   - indefinite right bound, but max_x is intelligently determined by user
%   - zero-value is undefined
%
% If the zero value is specified, y(x==0) will be set to zero_value analytically. This is
%   intended to circumvent divide-by-zero errors at x==0 by passing the analytic value of
%   the limit to this function.
%
%%%
    
    % Value of the integral.
    F = 0;
    
    x = linspace(min_x, max_x, n+1);

    h = x(2) - x(1);

    y = zeros(1, n+1);
    for i = 1:n
        if x(i) == 0
            y(i) = y0;
        else
            y(i) = feval(f, x(i));
        end
    end

    % Sum each slab's contribution to this period's integral.
    for i = 1:n
        slab = (h/2) * ( y(i) + y(i+1) );
        F = F + slab;
    end

end