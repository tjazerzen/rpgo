format long;

d = 62/101;

% naloga 1
m = 5;
D = zeros(m+3,2);
for j = -1:6
    D(j+2,:) = [sin(pi*j/3), 2*cos(pi*j/4)+1];
end
u = alphaparam(D([1,3,4,5,6,8],:), d);
max_du = max(diff(u));

% naloga 2
B = beziercubspline(u, D);
B3 = B{3};
dist1 = norm(B3(end,:) - D(1,:));

% naloga 3
u_t = u(end) / 2;
t = (u_t - u(3)) / (u(4) - u(3));
s = bezier(B{3}, t);
dist2 = norm(s - D(1,:));
