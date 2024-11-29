resujem nalogo

Naj bo d=62/101
. Dvakrat zvezno odvedljiva sestavljena Bezierjeva krivulja stopnje 3 je podana s kontrolnimi tockami
dj=(sin(πj3),2cos(πj4)+1),j=−1,0,…,6,
in delitvijo 0=u0<u1<…<u5
, ki je dolocena z α
-parametrizacijo na podlagi tock d−1,d1,d2,d3,d4,d6
 pri parametru α=d
.

Kaksna je vrednost max{Δuj; j=0,1,…,4}
? Answer 1 Question 4

Kaksna je oddaljenost sticne tocke med tretjim in cetrtim kosom sestavljene krivulje od kontrolne tocke d−1
? Answer 2 Question 4

Kaksna je oddaljenost tocke na sestavljeni krivulji pri parametru 12u5
 od kontrolne tocke d−1
? Answer 3 Question 4

sorodna naloga 



% Naj bo d=52/101. Dvakrat zvezno odvedljiva sestavljena Bezierjeva krivulja stopnje 3 
% je podana s kontrolnimi tockami
% dj=(16(sin(tj))3,13cos(tj)−5cos(2tj)−2cos(3tj)−cos(4tj)),tj=2π(j+1)/7,j=−1,0,…,6,
% in delitvijo 0=u0<u1<…<u5, ki je dolocena z α-parametrizacijo na podlagi tock 
% d0, d1, d2, d3, d4, d5 pri parametru α=d.
% 
% Kaksna je vrednost min{Δui; i=0,1,…,4}? Odgovor
% 1.639955754603203
% 
% Kaksna je oddaljenost sticne tocke med drugim in tretjim kosom sestavljene 
% krivulje od kontrolne tocke d6? Odgovor
% 1
% 
% Kaksna je oddaljenost tocke na sestavljeni krivulji pri parametru u5/2 od 
% kontrolne tocke d6? Odgovor
% 7,422853319336791e+04 (ne vem ali je to ok ali ni, meni pride drugace)
% Odgovorite na vse dele vprašanja.

resitev te sorodne naloge 

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

napisi mi matlab kodo za resitev zgornje naloge. brez disp funkcije. imenovanja
naj bodo zelo ZELO preprosta