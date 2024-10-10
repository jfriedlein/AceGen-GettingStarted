% Nye 2 Ten
function [A] = nye2ten(Av,fact)
A = [Av(1) Av(4)/fact Av(5)/fact;
    Av(4)/fact Av(2) Av(6)/fact;
    Av(5)/fact Av(6)/fact Av(3)];
end


