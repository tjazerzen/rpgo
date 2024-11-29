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