%% 1. naloga:
a = 27/101;
px = [-1 7 2];
py = [2 -2 a];
bx = power2bernstein(px);
by = power2bernstein(py);

b0 = [bx(1) by(1)];
b1 = [bx(2) by(2)];
b2 = [bx(3) by(3)];

% Oddaljenost od (0,0):
o = norm(b1);

% Rotacija za 60°
fi = pi/3;
R = [cos(fi) -sin(fi); sin(fi) cos(fi)];

br0 = R*b0';
br1 = R*b1';
br2 = R*b2';

Br = [br0'; br1'; br2'];

t = 1/2;
tr = bezier(Br, t);
% Oddaljenost od prvotne:
o2 = norm(tr-b0);

% V potencno bazo:
p = bernstein2power(Br(:,2));
vk=p(1);

%% 2. naloga:
b = 282/101;
B = [-1 0 1; 6 0 -2; 3 6 b; 3 3 -4];
t = 1/4;
[dp, dB] = bezierder(B, 1, t);

% Dolzina tangentnega vektorja
norma_dp = norm(dp);

% Odvod ddtp(t) v standardni Bezierjevi obliki
o3 = norm(dB(2,:)); % oddaljenost od izhodisca

% Torzija
[ddp, ddB] = bezierder(B, 2, t);
[dddp, dddB] = bezierder(B, 3, t);
tau = (dot(cross(dp, ddp),dddp))/norm(cross(dp, ddp))^2;


%% 3. naloga:
c = 61/101;

% Ker imamo dodaten pogoj interpolacije v točki (1, 0) uporabimo 3 metodo
% interpolacije v funkciji bezierarc.m
B_arc = bezierarc(c, 3);

% Razdalja med b1 in b2:
dif = norm(B_arc(2,:)-B_arc(3,:));

% Subdivizija
t = 1/3;
sub = beziersub(B_arc, t, 1);
B1 = sub{1};
B2 = sub{2};
n = 3; %stopnja krivulje
dolzina1 = 0;
dolzina2 = 0;
for i=1:n
    dolzina1 = dolzina1 + norm(B1(i,:) - B1(i+1,:));
    dolzina2 = dolzina2 + norm(B2(i,:) - B2(i+1,:));
end

razmerje = dolzina1/dolzina2;

% Bezierjeva krivulja stopnje 7: (stopnjo želimo zvišati za 4)
p7 = bezierelv(B_arc, 4);
n7 = 7; %stopnja krivulje
dolzinap7 = 0;
for i=1:n7
    dolzinap7 = dolzinap7 + norm(p7(i,:) - p7(i+1,:));
end

%% 4. naloga:
d = 52/101;
m = 5; % stevilo kosov
D = zeros(m+3,2);
for j=-1:6
    tj = 2*pi*(j+1)/7;
    D(j+2,:) = [16*(sin(tj))^3 13*cos(tj)-5*cos(2*tj)-2*cos(3*tj)-cos(4*tj)];
end

% Iskani minimum
u = alphaparam(D(2:(end-1),:), d);
min_du = min(diff(u));

% Oddaljenost sticne tocke med drugim in tretjim kosom sestavljene 
% krivulje od kontrolne tocke d6
B = beziercubspline(u, D);
B_2 = B{2};
o4 = norm(B_2(end,:)-D(end,:));

% oddaljenost tocke na sestavljeni krivulji od kontrolne tocke d6
u_t = u(end)/2; % parameter, ki določa 
t = (u_t - u(3))/(u(4) - u(3));
s = bezier(B{3}, t);
o5 = norm(s-D(end,:));
