%% 1.naloga
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
%%
rb1 = rot*b0;
rb2 = rot*b1;
rb3 = rot*b2;
B = [rb1(1);rb2(1);rb3(1)]
B2 = [rb1(2);rb2(2);rb3(2)]
%%
t = 1/2;
vred =  decasteljau(B, t )
vred2 = decasteljau(B2, t )

vec = [vred(1,3) vred2(1,3)]

dec = vec - b00
norm(dec)

poli = bernstein2power(B2)

%% 2.naloga
format long
b=282/101;

B = [-1 0 1;
    6 0 -2;
    3 6 b;
    3 3 -4
    ];
Q=diff(B)*(size(B,1)-1);
QQ = diff(Q)*(size(Q,1)-1);
QQQ = diff(QQ)*(size(QQ,1)-1);
t = 1/4;
r = 1;
bezier(B,t);
nov = bezier(Q,t);


norm(nov)

norm(Q(3,:));

pc = bezier(Q,t);
pcc = bezier(QQ,t);
pccc = bezier(QQQ,t);

a = cross(pc,pcc);
tor = (dot(a,pccc))/(norm(a)^2);

%% 3.naloga
format long

 c=3+71/101;
 
b0 = [1 c];
b1 = [2,5];
b3 = [3,2];
b2 = [c,3];

B = [b0;
    b0 + 1/3*b1;
    b3 - 1/3*b2;
    b3
    ]

norm(B(2,:)-B(3,:))
 
t = 1/2;
BS = beziersub (B , t, 1)

dolz1=0;
dolz2 = 0;

for i = 2:4
    dolz1 = dolz1 + norm(BS{1}(i-1,:)-BS{1}(i,:))
    dolz2 = dolz2 + norm(BS{2}(i-1,:)-BS{2}(i,:))
end

dolz1/dolz2

%% 4.naloga
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