A_a = 33;
a = 0.16;
g = 981;
h_eq = 3.2;
h1 = h_1.signals.values(end);
h2 = h_2.signals.values(end);
q_in = q.signals.values(end);
R = [1 0; 0 1];
Ts = 0.01;
D = 0;
EqPoint = h_2.signals.values(end);

A_const = a*sqrt(2*g)/2*A_a;

A = A_const * [-1/sqrt(2*g*(h1+h_eq)) 0 ; 
    1/sqrt(2*g*(h1+h_eq)) -1/sqrt(2*g*(h2+h_eq))];

A_2 = [-0.309 0;    
        0.309 -0.309];

B = [6.95/36.2; 0];
C = [0 1];
N = eye(2);

sys = ss(A,B,C,D);

sysd = c2d(sys, 0.01); 

[P,L,G] = care(A,B,R);

K = (P*C' + N*0)/[0 1];



