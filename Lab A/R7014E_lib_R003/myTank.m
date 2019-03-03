A_a = 33;
ao_1 = 0.16;
ao_2 = 0.16;
g = 981;
h_eq = 3.2;
h1 = 7;%h_1.signals(1).values(end);
h2 = 7.5;%h_2.signals.values(end);
q_in = q.signals.values(end);
R = [0.1 0; 0 0.1];
Q = [1];
Ts = 0.02;
D = 0;
EqPoint = 7;%h_2.signals.values(end);

a_1 = ao_1*sqrt(2*g)/2*A_a;
a_2 = ao_2*sqrt(2*g)/2*A_a;


A = [a_1*(-1/sqrt(2*g*(h1+EqPoint))) 0 ; 
    a_1*(1/sqrt(2*g*(h1+EqPoint))) a_2*(-1/sqrt(2*g*(h2+EqPoint)))];

B = [6.95/36.2; 0];
C = [0 1];
N = eye(2);

sys = ss(A,B,C,D);

sysd = c2d(sys, 0.01); 

[P,L,G] = care(A,B,R);

K = (P*C' + N*0)/[0 1];