from __utils__ import *

class LarangePolynomial1D():
    def __init__(self, points):
        self.degree = len(points) - 1
        self.points = points
        self.num_points = len(points) # This is n in the formula

    def __larange_polynomial__(self, point_idx):
        x = sym.Symbol('x')
        L = 1
        for i in range(0, self.num_points):
            if i == point_idx: continue
            xi = self.points[i][0]
            xk = self.points[point_idx][0]
            L *= (x - xi) / (xk - xi)
        return sym.nsimplify(L)

    def __approximated_polynomial__(self):
        P = 0
        for i in range(0, self.num_points):
            P += self.__larange_polynomial__(i) * self.points[i][1]
        return sym.nsimplify(P)

    def __approximated_value__(self, point):
        x = sym.Symbol('x')
        func = self.__approximated_polynomial__()
        f = sym.lambdify(x, func)
        return f(point)

    def larange_polynomial(self, point_idx):
        L = self.__larange_polynomial__(point_idx)
        print(f"L({self.degree}, {point_idx})(x) = ")
        sym.pprint(L)
        return L

    def approximated_polynomial(self):
        P = self.__approximated_polynomial__()
        print("f(x) \u2248 P(x) = ")
        return P

    def approximated_value(self, point):
        f = self.__approximated_value__(point)
        print(f"f({point}) \u2248 P({point}) = {f}")
        return f
    

class LarangePolynomial2D():
    def __init__(self, points, grid_type):
        self.degree = len(points) - 1
        self.points = points
        assert (len(points) in [3, 6, 4, 9])
        self.num_points = len(points) # This is n in the formula
        # grid_type can accept ["tri", "triangle", "quad", "quadrangle"]
        self.grid_type = grid_type 
    
    def __larange_polynomial__(self, point_idx):
        if self.grid_type in ["tri", "triangle"]:
            pass
        if self.grid_type in ["quad", "quadrangle"]:
            pass
        pass