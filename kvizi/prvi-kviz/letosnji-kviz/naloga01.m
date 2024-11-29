format long

a = 67/101;
px = [-1 6 a];
py = [5 -4 1];
bx = power2bernstein(px);
by = power2bernstein(py);

b0 = [bx(1) by(1)];
b1 = [bx(2) by(2)];
b2 = [bx(3) by(3)];

% Oddaljenost od (0,0): ANS
o = norm(b2);

% opc 1
b0_new = b0 + [a, 1];
b1_new = b1 + [a, 1];
b2_new = b2 + [a, 1];

% rotacijska matrika za tako zrcaljenje
D = [1 0; 0 -1];


br0 = D*b0_new';
br1 = D*b1_new';
br2 = D*b2_new';

B_new = [br0'; br1'; br2'];
t = 1/2; 
pt = bezier(B_new, t);
distance = norm(pt - b2); % ANS
disp(distance);


p_new_x = bernstein2power(B_new(:,1));
prosti_clen = p_new_x(end); % ANS