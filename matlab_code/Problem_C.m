function [] = Problem_C()
    
    % Calculate pi, but name it pii since MATLAB has already defined the variable pi.
    pii = 4 * atan(1);

    %%%%%%%%%%%%
    % Part (i) %
    %%%%%%%%%%%%
    
    rhs = 46/3;
    
    f = @(x,y) x * y * (1+x);
    
    F = Simpsons_2D(f, [1,2], [1,3], 1, 1)
    
    re = RelErr(F, rhs);
    fprintf('re:  %28.20e (Part i )\n',  re);
    
    %%%%%%%%%%%%%
    % Part (ii) %
    %%%%%%%%%%%%%
    
    rhs = 365/3;
    
    f = @(x,y) x^2 * y^3 * (1+x);
    
    F = Simpsons_2D(f, [1,2], [1,3], 1, 1)
    
    re = RelErr(F, rhs);
    fprintf('re:  %28.20e (Part ii)\n',  re);
   
end