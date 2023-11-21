import numpy as np
from scipy import sparse
import matplotlib.pyplot as plt

# Giai phuong trinh y" + (2/x)y' - (2/x^2)y = sin(log(x))/x^2 voi y(1) = 1, y(2) = 2.
# Nghiem chinh xac: y = c1*x + c2/x^2 - (3/10)*sin(log(x)) - (1/10)*cos(log(x))
# c2 = (1/70) * (8 - 12*sin(log(2)) - 4*cos(log(2)))
# c1 = (11/10) - c2

if __name__ == "__main__":
    # Mien gioi han cua x
    a = 1
    b = 2
    alpha = 1 # y(1)
    beta = 2 # y(2)

    grid_size = [32, 64, 128, 256, 512, 1024]
    error_abs = np.zeros(len(grid_size))
    error_rel = np.zeros(len(grid_size))

    for k in range(0, len(grid_size)):
        Nx = grid_size[k]
        h = (b - a) / (Nx + 1)

        G = lambda x: 2 / x
        H = lambda x: -2 / x ** 2
        F = lambda x: np.sin(np.log(x)) / x ** 2

        A = sparse.lil_matrix((Nx, Nx), dtype=np.float32)
        for i in range(1, Nx):
            x = a + i*h
            A[i, i - 1] = 1/h**2 - G(x)/(2*h)
        
        for i in range(0, Nx):
            x = a + i*h
            A[i, i] = -2/h**2 + H(x)
        
        for i in range(0, Nx - 1):
            x = a + i*h
            A[i, i + 1] = 1/h**2 + G(x)/(2*h)
        
        B = np.zeros(Nx)

        x = a + h
        B[0] = F(x) - (1/h**2 - G(x)/(2*h))*alpha

        xN = b - h
        B[Nx - 1] = F(xN) -  (1/h**2 - G(x)/(2*h))*beta

        for i in range(1, Nx - 1):
            x = a + i*h
            B[i] = F(x)
        
        A = A.toarray()
        global u
        u = np.linalg.solve(A, B)

        # Nghiem chinh xac
        c2 = (1/70)*(8 - 12*np.sin(np.log(2)) - 4*np.cos(np.log(2)))
        c1 = 11/10 - c2
        Y = lambda x: c1*x + c2/x**2 - (3/10)*np.sin(np.log(x)) -  (1/10)*np.cos(np.log(x))

        global X_plot
        X_plot = np.zeros(Nx)
        global Y_plot
        Y_plot = np.zeros(Nx)
        for i in range(len(X_plot)):
            X_plot[i] = a + (i + 1) * h
            Y_plot[i] = Y(X_plot[i])
        
        error_2_abs = 0
        
        for i in range(0, Nx):
            error_2_abs += (abs(Y_plot[i] - u[i]))**2
        
        norm_u = np.sum(np.square(u))
        
        error_abs[k] = np.sqrt(error_2_abs)
        error_rel[k] = error_abs[k] / np.sqrt(norm_u)

    plt.figure(figsize=(10,8))
    plt.plot(X_plot, u, 'o')
    plt.plot(X_plot, Y_plot, 'r-', linewidth=3)
    plt.xlabel('x')
    plt.ylabel('u')
    plt.legend(['Nghiem xap xi', 'Nghiem chinh xac'])
    plt.show()

    plt.figure(figsize=(10,8))
    plt.plot(grid_size, error_rel, 'r-')
    plt.plot(grid_size, error_abs, 'b-')
    plt.legend(['Sai so tuong doi', 'Sai so tuyet doi'])
    plt.xscale('log', base=2)
    plt.show()

