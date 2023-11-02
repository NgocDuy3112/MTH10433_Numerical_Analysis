clc;
clear all;
close all;

% Visualize first degree Larange polynomials in [-1; 1] x [-1; 1].
x1 = -1:0.01:1;
y1 = -1:0.01:1;
[X1, Y1] = meshgrid(x1, y1);
L11 = (-X1 + Y1 - X1.*Y1 + 1)/4;
L12 = (X1 + Y1 + X1.*Y1 + 1)/4;
L13 = (X1 - Y1 - X1.*Y1 + 1)/4;
L14 = (-X1 - Y1 + X1.*Y1 + 1)/4;

figure('Name', 'Do thi ham Larange bac 1 tren mien [-1; 1] x [-1; 1]'...
    ,'NumberTitle','off')
subplot(2, 2, 1)
surf(X1, Y1, L11)
title('Da thuc L1,1(x, y)')
xlabel('x')
ylabel('y')
zlabel('L1,1(x, y)')
subplot(2, 2, 2)
surf(X1, Y1, L12)
title('Da thuc L1,2(x, y)')
xlabel('x')
ylabel('y')
zlabel('L1,2(x, y)')
subplot(2, 2, 3)
surf(X1, Y1, L13)
title('Da thuc L1,3(x, y)')
xlabel('x')
ylabel('y')
zlabel('L1,3(x, y)')
subplot(2, 2, 4)
surf(X1, Y1, L14)
title('Da thuc L1,4')
xlabel('x')
ylabel('y')
zlabel('L1,4(x, y)')
sgtitle('Cac da thuc Larange bac 1 tren mien [-1; 1] x [-1; 1]')


% Visualize z(x, y) = sin(pi*x) + cos(pi*y) in [0, 2] x [0, 2].
x2 = 0:0.02:2;
y2 = 0:0.02:2;
[X2, Y2] = meshgrid(x2, y2);
Z2 = sin(pi*X2) + cos(pi*Y2);
figure('Name', 'Do thi ham so z = sin(pi*x) + cos(pi*y) tren mien [0, 2] x [0, 2]'...
    ,'NumberTitle','off')
surf(X2, Y2, Z2)
title('Do thi ham so z = sin(pi*x) + cos(pi*y) tren mien [0, 2] x [0, 2]')
xlabel('x')
ylabel('y')
zlabel('z')


% Visualize second degree Larange polynomials in [-1; 1] x [-1; 1].
% We have 9 points: 
% Q1(-1, 1), Q2(0, 1), Q3(1, 1)
% Q4(1, 0), Q5(1, -1), Q6(0, -1)
% Q7(-1, -1), Q8(-1, 0), Q9(0, 0)
x3 = -1:0.01:1;
y3 = -1:0.01:1;
[X3, Y3] = meshgrid(x3, y3);
L21 = (X3.^2.*Y3.^2)/4 + (X3.^2.*Y3)/4 - (X3.*Y3.^2)/4 - (X3.*Y3)/4;
L22 = Y3.^2/2 - (X3.^2.*Y3)/2 - (X3.^2.*Y3.^2)/2 + Y3/2;
L23 = (X3.^2.*Y3.^2)/4 + (X3.^2.*Y3)/4 + (X3.*Y3.^2)/4 + (X3.*Y3)/4;
L24 = X3.^2/2 - (X3.^2.*Y3.^2)/2 - (X3.*Y3.^2)/2 + X3/2;
L25 = (X3.^2.*Y3.^2)/4 - (X3.^2.*Y3)/4 + (X3.*Y3.^2)/4 - (X3.*Y3)/4;
L26 = -(X3.^2.*Y3.^2)/2 + (X3.^2.*Y3)/2 + Y3.^2/2 - Y3/2;
L27 = (X3.^2.*Y3.^2)/4 - (X3.^2.*Y3)/4 - (X3.*Y3.^2)/4 + (X3.*Y3)/4;
L28 = -(X3.^2.*Y3.^2)/2 + X3.^2/2 + (X3.*Y3.^2)/2 - X3/2;
L29 = X3.^2.*Y3.^2 - X3.^2 - Y3.^2 + 1;

figure('Name', 'Do thi ham Larange bac 2 tren mien [-1; 1] x [-1; 1]'...
    ,'NumberTitle','off')
subplot(3, 3, 1)
surf(X3, Y3, L21)
title('Da thuc L2,1(x, y)')
xlabel('x')
ylabel('y')
zlabel('L2,1(x, y)')
subplot(3, 3, 2)
surf(X3, Y3, L22)
title('Da thuc L2,2(x, y)')
xlabel('x')
ylabel('y')
zlabel('L2,2(x, y)')
subplot(3, 3, 3)
surf(X3, Y3, L23)
title('Da thuc L2,3(x, y)')
xlabel('x')
ylabel('y')
zlabel('L2,3(x, y)')
subplot(3, 3, 4)
surf(X3, Y3, L24)
title('Da thuc L2,4(x, y)')
xlabel('x')
ylabel('y')
zlabel('L2,4(x, y)')
subplot(3, 3, 5)
surf(X3, Y3, L25)
title('Da thuc L2,5(x, y)')
xlabel('x')
ylabel('y')
zlabel('L2,5(x, y)')
subplot(3, 3, 6)
surf(X3, Y3, L26)
title('Da thuc L2,6(x, y)')
xlabel('x')
ylabel('y')
zlabel('L2,6(x, y)')
subplot(3, 3, 7)
surf(X3, Y3, L27)
title('Da thuc L2,7(x, y)')
xlabel('x')
ylabel('y')
zlabel('L2,7(x, y)')
subplot(3, 3, 8)
surf(X3, Y3, L28)
title('Da thuc L2,8(x, y)')
xlabel('x')
ylabel('y')
zlabel('L2,8(x, y)')
subplot(3, 3, 9)
surf(X3, Y3, L29)
title('Da thuc L2,9(x, y)')
xlabel('x')
ylabel('y')
zlabel('L2,9(x, y)')
sgtitle('Cac da thuc Larange bac 2 tren mien [-1; 1] x [-1; 1]')