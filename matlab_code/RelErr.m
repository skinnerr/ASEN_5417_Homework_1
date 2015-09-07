function [ re ] = RelErr( fe, fc )
    re = abs(fe - fc) / fe;
end

