function [ F ] = Trapezoidal( f, bounds, n_slabs )
    
    n_pts = n_slabs + 1;
    x = linspace(bounds(1), bounds(2), n_pts);
    h = x(2) - x(1);
    
    y = zeros(1,n_pts);
    for i = 1:n_pts
        y(i) = feval(f, x(i));
    end
    
    F = y(1) + y(n_pts);
    for i = 2:(n_pts-1)
        F = F + 2*y(i);
    end
    F = F * h/2;

end