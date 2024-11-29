function [d1b,d1B] = bezierder(B,r,t)
% Opis:
% bezierder vrne točke na krivulji, ki predstavlja odvod dane
% Bezierjeve krivulje

% Definicija:
% db = bezierder(B,r,t)

% Vhodni podatki:
% B     matrika kontrolnih točk Bezierjeve krivulje, v kateri vsaka
%       vrstica predstavlja eno kontrolno točko,
% r     stopnja odvoda, ki ga računamo,
% t     seznam parameterov, pri katerih računamo odvod

% Izhodni podatek:
% db    matrika, v kateri vsaka vrstica predstavlja točko r-tega
%       odvoda pri istoležnem parametru iz seznama t

[n,d] = size(B); % velikost

n = n-1; % stopnja

d1B = factorial(n)/factorial(n-r)*diff(B,r);
d1b = bezier(d1B,t);

end