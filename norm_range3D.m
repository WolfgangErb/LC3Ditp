function [ x, y, z ] = norm_range3D( x,y,z,rold,range)
 
% normalize old range to [0,1]x[0,1]x[0,1]
x = (x - rold(1)) / (rold(2) - rold(1));
y = (y - rold(3)) / (rold(4) - rold(3));
z = (z - rold(5)) / (rold(6) - rold(5));

% normalize to new range
x = (x*(range(2)-range(1))) + range(1);
y = (y*(range(4)-range(3))) + range(3);
z = (z*(range(6)-range(5))) + range(5);

end

