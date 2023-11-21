clc
clear all
close all
format long

%Giai phuong trinh: y'' + (2/x)y' - (2/x^2)y = sin(log(x))/x^2
%y(1) = 1, y(2) = 2

%nghiem chinh xac y = c1*x + c2./x^2 - (3/10)*sin(log(x)) - (1/10)*cos(log(x));
%voi c2 = (1/70)*(8 - 12*sin(log(2)) - 4*cos(log(2)));
%va c1 = 11/10 - c2;


%Khai bao mien
a = 1; b = 2;
alpha = 1;
beta = 2;

%Chia luoi mien
kichthuocluoi = [32, 64, 128, 256, 512, 1024]; %So khoang chia tren Ox
for k = 1  : length(kichthuocluoi)
    Nx = kichthuocluoi(k);
    h = (b - a)/(Nx+1); %Buoc chia tren Ox

    %Khai bao bien
    G = @(x) 2./x;
    H = @(x) -2./x^2;
    F = @(x) sin(log(x))./x^2;

    A = sparse(Nx);

    for i=2:Nx
        x = a + i*h;
        A(i,i-1) = 1/h^2 - G(x)/(2*h);
    end

    for i=1:Nx
        x = a + i*h;
        A(i,i) = -2/h^2 + H(x);
    end

    for i=1:Nx-1
        x = a + i*h;
        A(i,i+1) = 1/h^2 + G(x)/(2*h);
    end

    B = zeros(Nx,1);

    x = a+h;
    B(1) = F(x) - (1/h^2 - G(x)/(2*h))*alpha;

    x_N = b - h;
    B(Nx) = F(x_N) - (1/h^2 + G(x_N)/(2*h))*beta;

    for i=2:Nx-1
        x = a + i*h;
        B(i) = F(x);
    end

    u = A\B;


    %nghiem chinh xac
    c2 = (1/70)*(8 - 12*sin(log(2)) - 4*cos(log(2)));
    c1 = 11/10 - c2;
    Y = @(x) c1*x + c2./x^2 - (3/10)*sin(log(x)) - (1/10)*cos(log(x));

    x = [];
    for i=1:Nx
        x(i) = a + i*h;
    end

    y = [];
    for i = 1:Nx
        y(i) = Y(x(i));
    end

    error2abs = 0; norm_u = 0;
    for i=1:Nx
        error2abs = error2abs + (abs(y(i) - u(i)))^2;
        norm_u = norm_u + u(i)^2;
    end

    errorabs = sqrt(error2abs);
    errorrel = errorabs/sqrt(norm_u);
    saisotuongdoi(k)  = errorrel;
    saisotuyetdoi(k)  =  errorabs;
end


figure
plot(x,u,'o')
hold on
plot(x,y,'r', 'LineWidth', 2)
xlabel('x')
ylabel('u')
legend('xap xi','nghiem chinh xac')

 

figure
plot(log(kichthuocluoi), -log(saisotuongdoi), 'r-',...
    log(kichthuocluoi), log(kichthuocluoi),'b-','LineWidth',2);
xlabel('Log(Kich Thuoc Luoi)');ylabel('-Log(Sai so tuong doi)');
%title('Errors');
legend('Sai so tuong doi voi chuan 2','duong thang y = 2x','Location', 'northwest');%,'x','1.5x','ene norm');





