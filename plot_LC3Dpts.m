% Plot the distribution of 3-dimensional LC node points 
% Plot the spectral index sets. 
% Copyright (C) P. Dencker and W. Erb 01.10.2016

close all
clear all

% Parameters of LC-points
m = [3,3,3];
kappa = [1,1,0];

% Plotting parameter
scale = 100;                    % size of the LC-points
range = [-1,1,-1,1,-1,1];      % range of the LC-points

%compute gcd of m(1), m(2) and m(3) 
g1 = gcd(m(1),m(2));
g2 = gcd(m(1),m(3));
g3 = gcd(m(2)/g1,m(3)/g2);
g  = g1*g2*g3;

% Compute the single Lissajous curves of the variety
% and normalize to range

t = 0:0.001:2*pi;

x = zeros(g,length(t));
y = zeros(g,length(t));
z = zeros(g,length(t));

k = 1;
for i = 1:g1
    for j = 1:g2*g3
        x(k,:) = cos(m(2)*m(3)*t/g+kappa(1)*pi/m(1));
        y(k,:) = cos(m(1)*m(3)*t/g+(2*(i-1)+kappa(2))*pi/m(2));
        z(k,:) = cos(m(1)*m(2)*t/g+(2*(j-1)+kappa(3))*pi/m(3));
        [x(k,:),y(k,:),z(k,:)] = norm_range3D(x(k,:),y(k,:),z(k,:),[-1 1 -1 1 -1 1],range);
        k = k+1;
    end
end

[xLC, yLC, zLC, wLC] = LC3Dpts(m,kappa,range);

fprintf('Cardinality of LC points in [-1,1]^3:  %10d \n',length(xLC));

% First plot (point sets)

figure(1),clf,

view([-55 10]);
grid on;
set(gca,'FontSize',20);
xlabel('x_1'); ylabel('x_2'); zlabel('x_3');
title('Chebyshev variety $\mathcal{C}_{\underline{\kappa}}^{(\underline{\mathbf{m}})}$ and $\mathbf{LC}^{(\underline{\mathbf{m}})}_{\underline{\mathbf{\kappa}}}$ points', ...
'interpreter','latex','fontsize',20)
hold on

for k = 1:g
  plot3(x(k,:),y(k,:),z(k,:),'Color' ,[183,207,246]/255,'LineWidth',4);
  hold on
end

plot3(xLC,yLC,zLC,'o','LineWidth',2,'MarkerSize',12,...
             'MarkerEdgeColor','k','MarkerFaceColor',[65,105,225]/255);
         
axis([range(1)-0.1 range(2)+0.1 range(3)-0.1 range(4)+0.1,range(5)-0.1 range(6)+0.1]);

% Prepare for second plot (spectral index set)

R = LC3Dmask(m,kappa);

A = -[1/m(1),1/m(2),0;1/m(1),0,1/m(3); 0,1/m(2),1/m(3); -1, 0, 0; 0, -1,0; 0,0,-1];
b = -[1;1;1;0;0;0];

gamma = zeros(length(xLC),3);
M     = scale*ones(length(xLC),1);
ind = 1;

for i = 0:m(1) 
    for j = 0:m(2) 
        for k = 0:m(3)
            if (R(i+1,j+1,k+1) > 0.01)
              gamma(ind,:) = [i,j,k];
              ind = ind + 1;
            end
        end 
    end 
end

% Second plot (Spectral index set)

figure(2), clf,
plotregion(A,b,[],[],[0.9,0.9,0.9]);
view([124 20]);
set(gca,'FontSize',20);
xlabel('\gamma_1'); ylabel('\gamma_2'); zlabel('\gamma_3');
title('Spectral index set $\Gamma^{(\underline{\mathbf{m}})}_{\underline{\kappa}}$', ...
'interpreter','latex','fontsize',20)
hold on

scatter3(gamma(:,1),gamma(:,2),gamma(:,3),M,'fill','MarkerFaceColor',[181,22,33]/255,'MarkerEdgeColor','k');
hold off





