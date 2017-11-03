function [xLC, yLC, zLC, wLC] = LC3Dpts(m,kappa,range)

% Computes LD points with parameter n for a given range
% Copyright (C) Wolfgang Erb 01.05.2016
%-------------------------------------------------------------------------------
% INPUT:
% m=[m1,m2,m3]   : parameters of the Lissajous curve
% range          : range of the x,y and z-coordinates
%
% OUTPUT:  
% xLC,yLC,zLC    : coordinates of the nodes of the Lissajous curve
% wLC            : weight function for the nodes

% Determination of points
zx = cos(linspace(0,1,m(1)+1)*pi);
zy = cos(linspace(0,1,m(2)+1)*pi);
zz = cos(linspace(0,1,m(3)+1)*pi);

[LC2,LC1,LC3] = meshgrid(zy,zx,zz);
  
% Determination of weight function
W = ones(m(1)+1,m(2)+1,m(3)+1)/m(1)/m(2)/m(3)*4;
W(1,:,:) = W(1,:,:)/2;
W(m(1)+1,:) = W(m(1)+1,:)/2;
W(:,1,:) = W(:,1,:)/2;
W(:,m(2)+1,:) = W(:,m(2)+1,:)/2;
W(:,:,1) = W(:,:,1)/2;
W(:,:,m(3)+1) = W(:,:,m(3)+1)/2; 
 
% Selection of used points
[M2,M1,M3] = meshgrid(0:m(2),0:m(1),0:m(3));
findM = find((mod(M1+M2+kappa(1)+kappa(2)+1,2)).*(mod(M1+M3+kappa(1)+kappa(3)+1,2)).*(mod(M3+M2+kappa(2)+kappa(3)+1,2)));

xLC = LC1(findM)';
yLC = LC2(findM)';
zLC = LC3(findM)';
wLC = W(findM)';

% normalize range
[xLC, yLC, zLC] = norm_range3D(xLC,yLC,zLC,[-1 1 -1 1 -1 1],range);

return


