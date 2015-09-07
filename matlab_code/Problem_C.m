function [] = Problem_C()
    
    % Calculate pi, but name it pii since MATLAB has already defined the variable pi.
    pii = 4 * atan(1);

    %%%%%%%%%%%%
    % Part (i) %
    %%%%%%%%%%%%
    
    f = @(x,y) x * y * (1+x);
    
    Simpsons_2D(f, [1,2], [1,3], 5, 2)
    
    %%%%%%%%%%%%%
    % Part (ii) %
    %%%%%%%%%%%%%
   
end