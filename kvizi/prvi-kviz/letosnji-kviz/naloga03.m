format long

c = 348/101;
b0 = [-1, -1, 1];
b1 = [3, 2, -2];
b2 = [2, 5, c];
b3 = [4, 2, -1];
B = [b0; b1; b2; b3];

% nal 1

t = 1/2;
subdiv_curve = beziersub(B, t, 1);
B1 = subdiv_curve{1};
B2 = subdiv_curve{2};
n = size(B1, 1) - 1; % stopnja krivulje
dolzina1 = 0;
dolzina2 = 0;
for i = 1:n
    dolzina1 = dolzina1 + norm(B1(i+1, :) - B1(i, :));
    dolzina2 = dolzina2 + norm(B2(i+1, :) - B2(i, :));
end
razmerje = dolzina1 / dolzina2; % ans


% nal 2
k = 4; % Želimo zvišati stopnjo za 4 (3 + 4 = 7)
B_el = bezierelv(B, k);
n7 = size(B_el, 1) - 1;
dolzina_p7 = 0;
for i = 1:n7
    dolzina_p7 = dolzina_p7 + norm(B_el(i+1, :) - B_el(i, :));
end
% ans

% nal 3
[dB, ~] = bezierder(B, 1, [1/2]);
x_der = @(t) bezier(dB(:, 1), t);
y_der = @(t) bezier(dB(:, 2), t);
z_der = @(t) bezier(dB(:, 3), t);
% Funkcija pod integralom
integrand = @(t) sqrt(x_der(t).^2 + y_der(t).^2 + z_der(t).^2);
% Numerično od t = 0 do t = 1
% TODO: tu nekaj ni ok in se sesuje
% curve_length = integral(integrand, 0, 1);