clc;
clear all;
close all;

syms a1 a2 a3 a4 a5 a6 a7 a8 a9 x y;
vars = [a1 a2 a3 a4 a5 a6 a7 a8 a9];
P2 = a1*x^2 + a2*y^2 + a3*x^2*y^2 + ...
+ a4*x^2*y + a5*x*y^2 + a6*x*y + a7*x + a8*y + a9;
A = zeros(9);

% Q1(-1, 1), Q2(0, 1), Q3(1, 1)
% Q4(1, 0), Q5(1, -1), Q6(0, -1)
% Q7(-1, -1), Q8(-1, 0), Q9(0, 0)
Q1 = [-1, 1];
Q2 = [0, 1];
Q3 = [1, 1];
Q4 = [1, 0];
Q5 = [1 -1];
Q6 = [0 -1];
Q7 = [-1 -1];
Q8 = [-1 0];
Q9 = [0 0];

subs(P2, [x y], Q1)
% P2(Q1) = a1 + a2 + a3 + a4 - a5 - a6 - a7 + a8 + a9
A(1, :) = [1 1 1 1 -1 -1 -1 1 1];

subs(P2, [x y], Q2)
% P2(Q2) = a2 + a8 + a9
A(2, :) = [0 1 0 0 0 0 0 1 1];

subs(P2, [x y], Q3)
% P2(Q3) = a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9
A(3, :) = [1 1 1 1 1 1 1 1 1];

subs(P2, [x y], Q4)
% P2(Q4) = a1 + a7 + a9
A(4, :) = [1 0 0 0 0 0 1 0 1];

subs(P2, [x y], Q5)
% P2(Q5) = a1 + a2 + a3 - a4 + a5 - a6 + a7 - a8 + a9
A(5, :) = [1 1 1 -1 1 -1 1 -1 1];

subs(P2, [x y], Q6)
% P2(Q6) = a2 - a8 + a9
A(6, :) = [0 1 0 0 0 0 0 -1 1];

subs(P2, [x y], Q7)
% P2(Q7) = a1 + a2 + a3 - a4 - a5 + a6 - a7 - a8 + a9
A(7, :) = [1 1 1 -1 -1 1 -1 -1 1];

subs(P2, [x y], Q8)
% P2(Q8) = a1 - a7 + a9
A(8, :) = [1 0 0 0 0 0 -1 0 1];

subs(P2, [x y], Q9)
% P2(Q9) = a9
A(9, :) = [0 0 0 0 0 0 0 0 1];

syms f1 f2 f3 f4 f5 f6 f7 f8 f9;
f = [f1; f2; f3; f4; f5; f6; f7; f8; f9];

X = linsolve(A, f)
P2_new = subs(P2, transpose(vars), X)

collect(P2_new, f1)
% L21 = (x^2*y^2)/4 + (x^2*y)/4 - (x*y^2)/4 - (x*y)/4
collect(P2_new, f2)
% L22 = y^2/2 - (x^2*y)/2 - (x^2*y^2)/2 + y/2
collect(P2_new, f3)
% L23 = (x^2*y^2)/4 + (x^2*y)/4 + (x*y^2)/4 + (x*y)/4
collect(P2_new, f4)
% L24 = x^2/2 - (x^2*y^2)/2 - (x*y^2)/2 + x/2
collect(P2_new, f5)
% L25 = (x^2*y^2)/4 - (x^2*y)/4 + (x*y^2)/4 - (x*y)/4
collect(P2_new, f6)
% L26 = -(x^2*y^2)/2 + (x^2*y)/2 + y^2/2 - y/2
collect(P2_new, f7)
% L27 = (x^2*y^2)/4 - (x^2*y)/4 - (x*y^2)/4 + (x*y)/4
collect(P2_new, f8)
% L28 = -(x^2*y^2)/2 + x^2/2 + (x*y^2)/2 - x/2
collect(P2_new, f9)
% L29 = x^2*y^2 - x^2 - y^2 + 1