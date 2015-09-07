function [ F ] = Simpsons( f, bounds, n_slabs )
    
    n_pts = 1 + 2 * n_slabs;
    x = linspace(bounds(1), bounds(2), n_pts);
    h = x(2) - x(1);
    
    y = zeros(1,n_pts);
    for i = 1:n_pts
        y(i) = feval(f, x(i));
    end
    
    F = 0;
    for i = 1:n_slabs
        % Determine indices involved in Simpson's rule for this slab.
        ii = 1 + 2*(i-1)*ones(1,3) + [0,1,2];
        F = F + y(ii(1)) + 4 * y(ii(2)) + y(ii(3));
    end
    F = F * h/3;

end