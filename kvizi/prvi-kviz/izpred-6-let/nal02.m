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
