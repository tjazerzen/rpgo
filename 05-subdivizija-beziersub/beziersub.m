function BS = beziersub(B,t,k)
% Opis:
% beziersub izvede subdivizijo Bezierjeve krivulje
%
% Definicija:
% BS = beziersub(B,t)
%
% Vhodni podatki:
% B     matrika kontrolnih točk Bezierjeve krivulje, v kateri
%       vsaka vrstica predstavlja eno kontrolno točko,
% t     parameter subdivizije Bezierjeve krivulje
%
% Izhodni podatek:
% BS    celica, ki vsebuje kontrolne točke dveh krivulj, ki jih
%       dobimo s subdivizijo prvotne Bezierjeve krivulje

d = size(B,2); % stevilo koordinat
n = size(B,1)-1;  % stopnja krivulje
BS = cell(1,2^k);
A_1 = zeros(n+1,d);
A_2 = zeros(n+1,d);

% 1. korak naredim normalno, le da drugega de Casteljauja shranim na eno
% mesto čez polovico
for i = 1:d
    D = decasteljau(B(:,i),t);
    A_1(:,i) = D(1,:);
    A_2(:,i) = diag(fliplr(D));
end
BS{1} = A_1;
BS{2^(k-1)+1} = A_2;

for j=2:k
    for l=1:2^(k-j+1):2^k
        for i=1:d
        D = decasteljau(BS{l}(:,i),t);
        A_1(:,i) = D(1,:);
        A_2(:,i) = diag(fliplr(D));
        end
        BS{l} = A_1;
        BS{l+2^(k-j)} = A_2;
    end
end

end