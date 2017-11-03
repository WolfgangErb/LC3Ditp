function f = testfun3D(x,y,z,k)

%   INPUT:  
%   x,y,z       x,y and z-coordinates to evaluate the function
%   k           index for one of the test functions
%
%   OUTPUT:     
%   f           resulting function values


switch k
        
    case 1  
        
    f = 1+exp(-(x.^2+y.^2+z.^2));
    
    case 2   % Test basis Chebyshev polynomials
    
    K = [1,1,2];
    f = 2+cos(K(1)*acos(x)).*cos(K(2)*acos(y)).*cos(K(3)*acos(z));
    
    case 3   % Non-smooth function (at origin)
        
    f = 1./(1+2*sqrt(x.^2+y.^2+z.^2));
    
    otherwise
        
    error('There is no function associated to this number');

end