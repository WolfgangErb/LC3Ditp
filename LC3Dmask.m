function R = LC3Dmask(n,kappa)

% Computes the mask for the coefficients of the interpolation polynomial
% Copyright (C) P. Dencker and W. Erb 01.10.2016

[M2,M1,M3] = meshgrid(0:n(2),0:n(1),0:n(3));
R3 = double(M1/n(1) + M2/n(2) < 1);
R2 = double(M1/n(1) + M3/n(3) < 1);
R1 = double(M2/n(2) + M3/n(3) < 1);

R3B = double(M1/n(1) + M2/n(2) == 1);
R2B = double(M1/n(1) + M3/n(3) == 1);
R1B = double(M2/n(2) + M3/n(3) == 1);

R3H = double(M3/n(3) == 1/2);
R2H = double(M2/n(2) == 1/2);
R1H = double(M1/n(1) == 1/2);

R3S = double(M3/n(3) < 1/2);
R2S = double(M2/n(2) < 1/2);
R1S = double(M1/n(1) < 1/2);

R = R1.*R2.*R3+R2B.*R1S.*R1+R1B.*R2S.*R2+R3B.*R2S.*R2+R2B.*R1B.*R1S.*R2S...
    +1/2*R3H.*R2H.*R1S +1/2*R1H.*R2H.*R3S +1/2*R3H.*R1H.*R2S + 1/4*R1H.*R2H.*R3H; 

if (mod(kappa(1)+kappa(2),2) == 0) && (mod(kappa(1)+kappa(3),2) == 1);
    R = R - 1/2*R3H.*R2H.*R1S - 1/2*R3H.*R1H.*R2S - 1/4*R1H.*R2H.*R3H;
elseif (mod(kappa(1)+kappa(3),2) == 0) && (mod(kappa(2)+kappa(3),2) == 1);
    R = R - 1/2*R1H.*R2H.*R3S - 1/2*R3H.*R2H.*R1S - 1/4*R1H.*R2H.*R3H;
elseif (mod(kappa(2)+kappa(3),2) == 0) && (mod(kappa(1)+kappa(3),2) == 1);
    R = R - 1/2*R1H.*R2H.*R3S - 1/2*R3H.*R1H.*R2S - 1/4*R1H.*R2H.*R3H;
end

R(1,1,n(3)+1) = 1/2;

end




