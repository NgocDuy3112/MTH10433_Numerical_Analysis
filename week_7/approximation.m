clear all;
close all;
clc;

% y" + (2/x)y' + (2/x^2)y = (sin(ln(x))/x^2
% y(1) = 1, y(2) = 2
% Approximate y(1.25), y(1.5), y(1.75)

h = 0.25;
syms x;
alpha = sym(1); % We don't need this thing.
beta = 2 / x;
gamma = 2 / x^2;
f = sin(log(x)) / x^2;
y0 = 1;
y4 = 2;

alpha_1 = subs(alpha, x, 1.25);
beta_1 = subs(beta, x, 1.25);
gamma_1 = subs(gamma, x, 1.25);
f1 = subs(f, x, 1.25);

alpha_2 = subs(alpha, x, 1.5);
beta_2 = subs(beta, x,  1.5);
gamma_2 = subs(gamma, x, 1.5);
f2 = subs(f, x, 1.5);

alpha_3 = subs(alpha, x, 1.75);
beta_3 = subs(beta, x, 1.75);
gamma_3 = subs(gamma, x, 1.75);
f3 = subs(f, x, 1.75);

A = [(-2*alpha_1/h^2 + gamma_1), (alpha_1/h^2 + beta_1/(2/h)), 0;...
    (alpha_2/h^2 - beta_2/(2*h)), (-2*alpha_2/h^2 + gamma_2), (alpha_2/h^2 + beta_2/(2*h)),
    0, (alpha_3/h^2 - beta_3/(2*h)), (-2*alpha_3/h^2 + gamma_3)];
b = [f1 - (alpha_1/h^2  - beta_1/(2*h))*y0; f2; f3 - (alpha_3/h^2  - beta_3/(2*h))*y4];
Y = inv(A) * b
Y = round(Y, 10)