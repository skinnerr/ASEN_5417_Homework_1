function [ F ] = Simpsons_2D( f, bounds_x, bounds_y, n_slabs_x, n_slabs_y )
    
    n_pts_x = 1 + 2 * n_slabs_x;
    n_pts_y = 1 + 2 * n_slabs_y;
    x = linspace(bounds_x(1), bounds_x(2), n_pts_x);
    y = linspace(bounds_y(1), bounds_y(2), n_pts_y);
    hx = x(2) - x(1);
    hy = y(2) - y(1);
    
    z = zeros(n_pts_x, n_pts_y);
    for i = 1:n_pts_x
    for j = 1:n_pts_y
        z(i,j) = feval(f, x(i), y(i));
    end
    end
    
    % Weights to use for each coordinate within the slab.
    simpson_square = [1,  4, 1; ...
                      4, 16, 4; ...
                      1,  4, 1];
    
    F = 0;
    for i = 1:n_slabs_x
    for j = 1:n_slabs_y
        % Determine indices involved in Simpson's rule for this slab.
        ii = 1 + 2*(i-1);
        jj = 1 + 2*(j-1);
        % Calculate volume of slab.
        slab = sum(sum( simpson_square .* z(ii:ii+2, jj:jj+2) ));
        F = F + slab;
    end
    end
    F = F * (hx * hy / 9);

end