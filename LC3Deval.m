function Sf = LC3Deval(C,m,x,y,z,range)

% Computes the interpolation polynomial at points (x,y,z) 
% Copyright (C) P. Dencker and W. Erb 01.10.2016
%-------------------------------------------------------------------------------
% INPUT:
% m            : parameters of the Lissajous curve
% C            : coefficient matrix of the interpolation polynomial
% (x,y,z)      : evaluation point
%
% OUTPUT:
% Sf           : evaluated polynomial at point (x,y,z)


% Normalize range
[x,y,z] = norm_range3D(x,y,z,range,[-1 1 -1 1 -1 1]);

% Compute basis polynomials
Tx = T(m(1), x);
Ty = T(m(2), y);
Tz = T(m(3), z);

Sf = zeros(size(x));

for i = 0:m(1)
    for j = 0:m(2)
        for k = 0:m(3)
            Sf = Sf + C(i+1,j+1,k+1)*Tx(i+1,:).*Ty(j+1,:).*Tz(k+1,:);
        end
    end
end
