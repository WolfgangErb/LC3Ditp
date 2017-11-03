function noLC = sizeLC3D(n,kappa)

a = zeros(3,1);
b = zeros(3,1);

for i=1:3
if (mod(n(i),2) == 0)
    if (mod(kappa(i),2) == 0)
        a(i) = n(i); b(i)=n(i)+2;
    else
        a(i) = n(i)+2; b(i)=n(i);
    end
else
    a(i) = n(i)+1; b(i) = n(i)+1;
end
end

noLC = a(1)*a(2)*a(3)/8+b(1)*b(2)*b(3)/8;

return