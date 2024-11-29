function B = beziercubspline(u,D)
% Opis:
%   beziercubspline  izraèuna  sestavljeno  Bezierjevo  krivuljo
%   stopnje 3, ki je  dvakrat  zvezno  odvedljiva v stikih
%
% Definicija:
%   B = beziercubspline(u,D)
%
% Vhodna  podatka:
%   u seznam  parametrov  delitve  dolžine m+1,
%   D matrika , v kateri  vsaka  izmed m+3  vrstic  predstavlja
% eno  kontrolno  toèko  sestavljene  krivulje
%
% Izhodni  podatek:
%   B seznam  dolžine m, v kateri  je vsak  element  matrika s
% štirimi  vrsticami , ki  doloèajo  kontrolne  toèke  kosa
% sestavljene  krivulje

m = size(u);
m = m(2)-1;
[n, d] = size(D);
B = cell(1,m);
for i = 1:m
    B{i} = zeros(4,d);
end
dif = diff(u);

B{1}(1,:) = D(1,:);
B{1}(2,:) = D(2,:);
B{1}(3,:) = (dif(2) / (dif(1) + dif(2))) * D(2,:) + (dif(1) / (dif(1) + dif(2))) * D(3,:);

B{m}(4,:) = D(m+3,:);
B{m}(3,:) = D(m+2,:);
B{m}(2,:) = (dif(m) / (dif(m-1) + dif(m))) * D(m+1,:) + (dif(m-1) / (dif(m-1) + dif(m))) * D(m+2,:);

for i = 2:m-1
    B{i}(2,:) = ((dif(i) + dif(i+1)) / (dif(i-1) + dif(i) + dif(i+1)))* D(i+1,:) + (dif(i-1) / (dif(i-1) + dif(i) + dif(i+1)))* D(i+2,:);
    B{i}(3,:) = (dif(i+1) / (dif(i-1) + dif(i) + dif(i+1)))* D(i+1,:) + ((dif(i) + dif(i-1)) / (dif(i-1) + dif(i) + dif(i+1)))* D(i+2,:);
end

for i = 2:m
    a = dif(i) / (dif(i) + dif(i-1)) * B{i-1}(3,:) + dif(i-1) / (dif(i) + dif(i-1)) * B{i}(2,:);
    B{i-1}(4,:) = a;
    B{i}(1,:) = a;
end

end