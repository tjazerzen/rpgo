format long
b=4+75/101;

B = [-1 0 1;
    5 0 -2;
    3 6 b;
    3 3 -5
    ];
Q=diff(B)*(size(B,1)-1);
QQ = diff(Q)*(size(Q,1)-1);
QQQ = diff(QQ)*(size(QQ,1)-1);
t = 1/4;
r = 1;
bezier(B,t);
nov = bezier(Q,t);


norm(nov);

norm(Q(3,:));

pc = bezier(Q,t);
pcc = bezier(QQ,t);
pccc = bezier(QQQ,t);

a = cross(pc,pcc);
tor = (dot(a,pccc))/(norm(a)^2)