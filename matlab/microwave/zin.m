function [Zin] = zin(ZL,Z0,l)
% Calculates the transmission line impedance equation
% ZL is the load impedance
% Z0 is the characteristic impedance
% l is beta*l where beta = 2*pi/lambda and l = coeff*lambda such that the lambdas cancel and beta*l
% is then equal to 2*pi*coefficient-of-lambda
disp("The value of l is simply the coefficient of lambda")
num = complex(((ZL) + 1i*Z0*tan(2*pi*l)));
den = complex((Z0 + (1i*(ZL))*tan(2*pi*l)));
Zin = Z0*(num/den);
end
