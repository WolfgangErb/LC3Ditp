% Test examples for polynomial interpolation on the node points LC
% of three dimensional degenerate Lissajous curves
% Copyright (C) P. Dencker and W. Erb 01.10.2016

clear all
close all

% Parameters of LC-interpolation (arbitrary natural numbers) 
n     = [16,14,12];
kappa = [0,0,0];

% Test parameters
range = [-1,1,-1,1,-1,1];  %Range in which interpolation takes place
nofun = 1;                 %Number of test function

%Plotting parameters
vistype = 1;       %Form of visualization [1-2]
N1 = 41;           %Resolution for first image
N2 = 7;            %Resolution for second image (number of balls)
mpar = 50;         %Parameter for visualization (size of balls)

% Create grids for plots
[x1, y1, z1] = meshgrid(linspace(range(1),range(2),N1),linspace(range(3),range(4),N1),linspace(range(5),range(6),N1));
[x2, y2, z2] = meshgrid(linspace(range(1),range(2),N2),linspace(range(3),range(4),N2),linspace(range(5),range(6),N2));
xlin1 = reshape(x1,1,N1 ^ 3);   xlin2 = reshape(x2,1,N2 ^ 3);             
ylin1 = reshape(y1,1,N1 ^ 3);   ylin2 = reshape(y2,1,N2 ^ 3); 
zlin1 = reshape(z1,1,N1 ^ 3);   zlin2 = reshape(z2,1,N2 ^ 3);
       
% Compute Lissajous-Chebyshev node points LD^n and the respective weights
[xLC,yLC,zLC,wLC] = LC3Dpts(n,kappa,range);

% Read the functions from the test set
flin1 = testfun3D(xlin1,ylin1,zlin1,nofun);
flin2 = testfun3D(xlin2,ylin2,zlin2,nofun);

fLC = testfun3D(xLC,yLC,zLC,nofun);

% Compute data matrix
tic; G = LC3DdatM(n,kappa,fLC,wLC);

% Compute coefficient matrix
C = LC3Dcfsfft(n,kappa,G); time_coeff = toc;


% Compute interpolation polynomial at grid and Lissajous points
tic; Sflin1 = LC3Deval(C,n,xlin1,ylin1,zlin1,range); time_eval = toc;
Sflin2 = LC3Deval(C,n,xlin2,ylin2,zlin2,range);
SfLC   = LC3Deval(C,n,xLC,yLC,zLC,range);

Sf1 = reshape(Sflin1,N1,N1,N1);
Sf2 = reshape(Sflin2,N2,N2,N2);

maxerror = norm(Sflin1-flin1,inf);
maxerrorLD = norm(SfLC-fLC,inf);

noLC = sizeLC3D(n,kappa);

if (maxerrorLD > 1e-12)
    fprintf('Error: Interpolation not successful!\n');
else
    fprintf('Interpolation successful!');
    if (maxerror < 1e-12)
        fprintf(' The test function was reproduced exactly.\n');
    else
        fprintf(' \n');
    end
end

fprintf('Maximal error for approximation     : %23.18f \n',maxerror);
fprintf('Maximal error at LC points          : %23.18f \n\n',maxerrorLD);

fprintf('Time to compute %6d coefficients : %13.8f seconds\n',noLC,time_coeff);
fprintf('Time to compute %6d evaluations  : %13.8f seconds\n',N1^3,time_eval);
 
% Plots of the interpolating polynomial

switch vistype
    case 1
        figure(1),clf,
        xslice = (range(2)+range(1))/2; 
        yslice = (range(4)+range(3))/2; 
        zslice = (range(6)+range(5))/2;
        slice(x1,y1,z1,Sf1,xslice,yslice,zslice);
        colormap(hot);
        colorbar;
        
        figure(2),clf,
        scatter3(xlin2,ylin2,zlin2,mpar*Sflin2,Sflin2,'fill','MarkerEdgeColor','k');
        colormap(hot);
        colorbar
    case 2
        figure(1),clf,
        xslice = []; 
        yslice = []; 
        zslice = [-1,-0.5,0, 0.5,1];
        slice(x1,y1,z1,Sf1,xslice,yslice,zslice);
        colormap(hot);
        colorbar;
        
        figure(2),clf,
        mult = 50;
        scatter3(xlin2,ylin2,zlin2,mult*Sflin2,Sflin2,'fill','MarkerEdgeColor','k');
        colormap(hot);
        colorbar
end





