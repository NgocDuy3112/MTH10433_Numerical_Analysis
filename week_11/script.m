clc;
clear all;
close all;

syms x;
T0 = symfun(1, x)
w1 = 1/sqrt(1 - x^2);


% T1(x) = x - a1
a1 = integral(matlabFunction(w1 * (x * T0) * T0), -1, 1) /...
    integral(matlabFunction(w1 * T0 * T0), -1, 1)
T1 = x - a1


% T2(x) = (x - a2)T1(x) - b2*T0(x)
a2 = integral(matlabFunction(w1 * (x * T1) * T1), -1, 1) /...
    integral(matlabFunction(w1 * T1 * T1), -1, 1) 
b2 = integral(matlabFunction(w1 * (x * T1) * T0), -1, 1) /...
    integral(matlabFunction(w1 * T0 * T0), -1, 1)
T2 = (x - a2) * T1 - b2 * T0
S = solve(T2, x);
x0 = S(1)
x1 = S(2)
L10 = (x - x1) / (x0 - x1);
L11 = (x - x0) / (x1 - x0);
c0 = integral(matlabFunction(L10), -1, 1)
c1 = integral(matlabFunction(L11), -1, 1)


% T3(x) = (x - a3)T2(x) - b3*T1(x)
a3 = integral(matlabFunction(w1 * (x * T2) * T2), -1, 1) /...
    integral(matlabFunction(w1 * T2 * T2), -1, 1) 
b3 = integral(matlabFunction(w1 * (x * T2) * T1), -1, 1) /...
    integral(matlabFunction(w1 * T1 * T1), -1, 1)
T3 = (x - a3) * T2 - b3 * T1
S = solve(T3, x);
x0 = S(1)
x1 = S(2)
x2 = S(3)
L20 = ((x - x1) * (x - x2))  / ((x0 - x1) * (x0 - x2));
L21 = ((x - x0) * (x - x2))  / ((x1 - x0) * (x1 - x2));
L22 = ((x - x0) * (x - x1))  / ((x2 - x0) * (x2 - x1));
c0 = integral(matlabFunction(L20), -1, 1)
c1 = integral(matlabFunction(L21), -1, 1)
c2 = integral(matlabFunction(L22), -1, 1)



clc;
clear all;
close all;

syms x;
L0 = symfun(1, x)
w2 = exp(-x);


% T1(x) = x - a1
a1 = integral(matlabFunction(w2 * (x * L0) * L0), 0, inf) /...
    integral(matlabFunction(w2 * L0 * L0), 0, inf)
L1 = x - a1


% T2(x) = (x - a2)T1(x) - b2*T0(x)
a2 = integral(matlabFunction(w2 * (x * L1) * L1), 0, inf) /...
    integral(matlabFunction(w2 * L1 * L1), 0, inf) 
b2 = integral(matlabFunction(w2 * (x * L1) * L0), 0, inf) /...
    integral(matlabFunction(w2 * L0 * L0), 0, inf)
L2 = (x - a2) * L1 - b2 * L0
S = solve(L2, x);
x0 = S(1)
x1 = S(2)
L10 = (x - x1) / (x0 - x1);
L11 = (x - x0) / (x1 - x0);
c0 = integral(matlabFunction(L10), -1, 1)
c1 = integral(matlabFunction(L11), -1, 1)