format long

 c=3+71/101;
 
b0 = [1 c];
b1 = [2,5];
b3 = [3,2];
b2 = [c,3];

B = [b0;
    b0 + 1/3*b1;
    b3 - 1/3*b2;
    b3
    ]

norm(B(2,:)-B(3,:))
 
t = 1/2;
BS = beziersub (B , t, 1)

dolz1=0;
dolz2 = 0;

for i = 2:4
    dolz1 = dolz1 + norm(BS{1}(i-1,:)-BS{1}(i,:))
    dolz2 = dolz2 + norm(BS{2}(i-1,:)-BS{2}(i,:))
end

dolz1/dolz2