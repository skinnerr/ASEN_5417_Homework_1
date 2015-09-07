function [] = Homework_1_Driver()
%%%
% HOMEWORK 1 DRIVER
%
% Run this file to calculate output for Homework 1.
%%%

Set_Default_Plot_Properties();

Blanks();

Problem('A');
Problem_A();
Blanks();

Problem('B');
Problem_B();
Blanks();

Problem('C');
Problem_C();
Blanks();

end

function [] = Problem( name )
    fprintf('**********************************************************\n');
    fprintf('*********************>>> Problem %s <<<********************\n', name);
    fprintf('**********************************************************\n');
end

function [] = Blanks()
    fprintf('\n\n');
end