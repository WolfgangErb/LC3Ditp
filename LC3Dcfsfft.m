function C = LC3Dcfsfft(m,kappa,G)

% Computes the coefficient matrix of the interpolating polynomial
% Copyright (C) P. Dencker and W. Erb 01.10.2016
%----------------------------------------------------------------------
% INPUT:    
% m = [m1,m2,m3]  : parameters of Lissajous curve
% G               : (m1+1)x(m2+1)x(m3+1) data matrix

% Output: 
% C               : (m1+1)x(m2+1)x(m3+1) coefficient matrix


% Execute Chebyshev transform along single dimensions
Gh = real(fft(G,2*m(1),1));   
Gh = Gh(1:m(1)+1,:,:);           

Ghh = real(fft(Gh,2*m(2),2));       
Ghh = Ghh(:,1:m(2)+1,:);

Ghhh = real(fft(Ghh,2*m(3),3));       
Ghhh = Ghhh(:,:,1:m(3)+1);

% Chebyshev normalization factors
[M2,M1,M3] = meshgrid(0:m(2),0:m(1),0:m(3));
Alpha = (2-(M1<1)).*(2-(M2<1)).*(2-(M3<1));

% Mask for coefficients
Mask = LC3Dmask(m,kappa);
    
% Final coefficient matrix
C = Ghhh.*Alpha.*Mask;
