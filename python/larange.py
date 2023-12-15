from __utils__ import *

class LarangePolynomial1D():
    def __init__(self, points):
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

    def __approximated_value_at__(self, point):
        x = sym.Symbol('x')
        func = self.__approximated_polynomial__()
        f = sym.lambdify(x, func)
        return f(point)

    def larange_polynomial(self, point_idx):
        xi = self.points[point_idx]
        L = self.__larange_polynomial__(point_idx)
        degree = self.num_points - 1
        print(f"With x{point_idx}= {xi}, L({degree}, {point_idx})(x) = ")
        sym.pprint(L)
        return L

    def approximated_polynomial(self):
        P = self.__approximated_polynomial__()
        print("Approximated polynomial: f(x) \u2248 P(x) = ")
        sym.pprint(P)
        return P

    def approximated_value_at(self, point):
        f = self.__approximated_value_at__(point)
        print(f"With x = {point}, f({point}) \u2248 P({point}) = {f}")
        return f
    

class LarangePolynomial2DGrid():
    def __init__(self, points):
        assert (len(points) in [3, 4, 6, 9])
        assert (len(point) == 3 for point in points)
        self.num_points = len(points) # This is n in the formula
        self.points = []
        self.f_values = []
        for point in points:
            self.points.append((point[0], point[1]))
            self.f_values.append(point[2])
        
    def __larange_polynomial__(self, point_idx):
        assert point_idx < self.num_points
        x = sym.Symbol('x')
        y = sym.Symbol('y')
        L = 1
        X = None
        A = np.zeros((self.num_points, self.num_points))
        
        
        if self.num_points == 3:
            X = sym.Matrix([x, y, 1])
    
        if self.num_points == 4:
            X = sym.Matrix([x, y, x*y, 1])
        
        if self.num_points == 6:
            X = sym.Matrix([x**2, y**2, x*y, x, y, 1])

        if self.num_points == 9:
            X = sym.Matrix([x**2 * y**2, x**2 * y, x * y**2, x**2, y**2, x*y, x, y, 1])

        mat_func = sym.lambdify((x, y), X, 'numpy')
        for i, point in enumerate(self.points):
            mat_num = mat_func(point[0], point[1])
            A[i] = mat_num.reshape(mat_num.shape[0])
        L = (sym.Matrix(np.linalg.inv(A)[:, point_idx]).T * X)[0]
        del X, A
        return sym.nsimplify(L)
    
    def __approximated_polynomial__(self):
        P = 0
        for i in range(0, self.num_points):
            P += self.__larange_polynomial__(i) * self.f_values[i]
        return sym.nsimplify(P)

    def __approximated_value_at__(self, point):
        x = sym.Symbol('x')
        y = sym.Symbol('y')
        func = self.__approximated_polynomial__()
        f = sym.lambdify((x, y), func)
        return f(point[0], point[1])
    
    def larange_polynomial(self, point_idx):
        assert point_idx < self.num_points
        xi, yi = self.points[point_idx]
        L = self.__larange_polynomial__(point_idx)
        degree = 1 if self.num_points in [3, 4] else 2
        print(f"With (x{point_idx}, y{point_idx}) = ({xi}, {yi}), L({degree}, {point_idx})(x, y) = ")
        sym.pprint(L)
        return L
    
    def approximated_polynomial(self):
        P = self.__approximated_polynomial__()
        print("Approximated polynomial: f(x, y) \u2248 P(x, y) = ")
        sym.pprint(P)
        return P

    def approximated_value_at(self, point):
        f = self.__approximated_value_at__(point)
        print(f"With x = {point[0]}, y = {point[1]}, f({point[0], point[1]}) \u2248 P({point[0], point[1]}) = {f}")
        return f