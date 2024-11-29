function b = bernstein2power ( p )
% Opis :
% bernstein2power pretvori polinom , predstavljen s
% koeficienti v Bernsteinovi bazi, v polinom , predstavljen
% v poten?ni bazi
%
% Definicija :
% b = bernstein2power (p)
%
% Vhodni podatek :
% p seznam koeficientov dol�ine n+1 , ki po vrsti
% pripadajo razvoju polinoma stopnje n v Bernsteinovi
% bazi od 0 - tega do n- tega Bernsteinovega baznega
% polinoma
%
% Izhodni podatek :
% b seznam koeficientov dol�ine n+1 , ki po vrsti
% pripadajo razvoju polinoma stopnje n v poten?ni
% bazi od x^n do 1

n = length(p);
b = zeros(1,n);

for i=0:n-1
    for j=i:n-1
        b(j+1) = b(j+1) + (p(i+1)*nchoosek(j, i)*nchoosek(n-1, j)*(-1)^(i+j));
    end
end

b = fliplr(b);

end