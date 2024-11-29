function B = bezierarc(fi,m)
% Opis:
% bezierarc izračuna kontrole točke Bezierjeve krivulje, ki
% predstavlja interpolacijo krožnega loka po izbrani metodi

% Definicija:
% B = bezierarc(fi,m)

% Vhodna podatka:
% fi    kot, ki določa krozni lok v območju (-fi,fi),
% m     metoda interpolacije:
%       1 = kvadratični G1 interpolant,
%       2 = kubični C1 interpolant,
%       3 = kubični G1 interpolant s C0 interpolacijo v srednji točki

% Izhodni podatek:
% B     tabela velikosti 3 x 2 ali 4 x 2, v kateri vsaka vrstica
%       predstavlja kontrolno točko Bezierjeve krivulje

b_0 = [cos(fi) -sin(fi)];

if m==1
    b_2 = [cos(fi) sin(fi)];
    b_1 = [1/cos(fi) 0];
    B = [b_0;b_1;b_2];
elseif m==2
    b_3= [cos(fi) sin(fi)];
    b_1 = [cos(fi) + 1/3*sin(fi) -sin(fi)+1/3*cos(fi)];
    b_2 = [cos(fi) + 1/3*sin(fi) sin(fi)-1/3*cos(fi)];
    B = [b_0;b_1;b_2;b_3];

elseif m==3
    b_3= [cos(fi) sin(fi)];
    b_1 = 1/3*[4-cos(fi) 4*cot(fi)-4/sin(fi)+sin(fi)];
    b_2 = 1/3*[4-cos(fi) -4*cot(fi)+4/sin(fi)-sin(fi)];
    B = [b_0;b_1;b_2;b_3];

end