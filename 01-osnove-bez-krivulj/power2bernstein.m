function b = power2bernstein ( p )
% Opis :
% power2bernstein pretvori polinom , predstavljen s
% koeficienti v poten?ni bazi , v polinom , predstavljen
% v Bernsteinovi bazi
%
% Definicija :
% b = power2bernstein (p)
%
% Vhodni podatek :
% p seznam koeficientov dolzine n+1 , ki po vrsti
% pripadajo razvoju polinoma stopnje n v poten?ni
% bazi od x^n do 1
%
% Izhodni podatek :
% b seznam koeficientov dolžine n+1 , ki po vrsti
% pripadajo razvoju polinoma stopnje n v Bernsteinovi
% bazi od 0 - tega do n- tega Bernsteinovega baznega
% polinoma

p = fliplr(p);

n = length(p);
b = zeros(1,n);

for i=0:n-1
    for j=i:n-1
        b(j+1) = b(j+1) + (p(i+1)*nchoosek(j, i)/nchoosek(n-1, i));
    end
end

end