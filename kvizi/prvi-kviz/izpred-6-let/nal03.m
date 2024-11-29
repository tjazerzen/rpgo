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