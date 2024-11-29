format long

d=78/101;

D = zeros(8,2);
for j = 1:8
    tj = 2*pi*(j-1)/7;
    D(j,1) = (16*(sin(tj))^3);
    D(j,2) = (13*cos(tj)-5*cos(2*tj)- 2*cos(3*tj)-cos(4*tj));
end

U = alphaparam(D(2:(end-1),:),d);

diff(U);

vred= beziercubspline(U,D);

vec = vred{2}(4,:);
d6 = D(8,:);

norm(vec-d6)

U
par = U(6)/2
dol = U(4)-U(3)
vpar = par - U(4)

vvpar = vpar/dol
B = vred{3}(:,:);
B
vrednost = bezier(B,vvpar)

norm(vrednost-d6)