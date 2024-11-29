format long

a=73/101;

P1 = [-1 7 2];
P2 = [3 -2 a];

Kon1 = power2bernstein(P1);
Kon2 = power2bernstein(P2);


A = [Kon1(2) Kon2(2)];
norm(A);

b00 = [Kon1(1) Kon2(1)];

phi = pi/3;
rot = [cos(phi) -sin(phi);
       sin(phi) cos(phi)];
   
b0 = [Kon1(1); Kon2(1)];
b1 = [Kon1(2); Kon2(2)];
b2 = [Kon1(3); Kon2(3)];

rb1 = rot*b0;
rb2 = rot*b1;
rb3 = rot*b2;
B = [rb1(1);rb2(1);rb3(1)];
B2 = [rb1(2);rb2(2);rb3(2)];

t = 1/2;
vred =  decasteljau(B, t )
vred2 = decasteljau(B2, t )

vec = [vred(1,3) vred2(1,3)]

dec = vec - b00
norm(dec)

poli = bernstein2power(B2)