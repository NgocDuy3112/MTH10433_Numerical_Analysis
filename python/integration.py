from __utils__ import *

class ClosedNewtonCotes():
    def __init__(self, func, method="trapezoidal"):
        assert(isinstance(func, func_type) for func_type in [sym.Expr, types.FunctionType, list])
        if isinstance(func, list):
            assert (len(element) == 2 for element in func)
        self.func = func
        self.methods_list = ["trapezoidal", "simpson", "3/8", "Milne", "6-points", "weddle"]
        assert (method in self.methods_list)
        self.method = method
        self.num_points = len(self.func) if isinstance(self.func, list) else 2 + self.methods_list.index(self.method)
    
    def __get_methods_list__(self):
        return self.methods_list

    def __intergral_value__(self, interval):
        x = sym.Symbol('x')
        assert (len(interval) == 2)
        a, b = interval
        h = abs(a - b) / (self.num_points - 1)
        f = None
        points = []
        res = 0
        if isinstance(self.func, list):
            points = [self.func[i][0] for i in range(self.num_points)]
            f = [self.func[i][1] for i in range(self.num_points)]
        elif isinstance(self.func, sym.Expr):
            f = sym.lambdify(x, self.func)
            for i in range(self.num_points):
                points.append(a + i * h)
        else:
            f = self.func
            for i in range(self.num_points):
                points.append(a + i * h)
        outside_coef = 0
        inside_coefs = None
        if self.num_points == 2:
            outside_coef = 1/2
            inside_coefs = [1, 1]
        if self.num_points == 3:
            outside_coef = 2/6
            inside_coefs = [1, 4, 1]
        if self.num_points == 4:
            outside_coef = 3/8
            inside_coefs = [1, 3, 3, 1]
        if self.num_points == 5:
            outside_coef = 4/90
            inside_coefs = [7, 32, 12, 32, 7]
        if self.num_points == 6:
            outside_coef = 5/288
            inside_coefs = [19, 75, 50, 50, 75, 19]
        if self.num_points == 7:
            outside_coef = 6/840
            inside_coefs = [41, 216, 27, 272, 27, 216, 27, 41]
        res = outside_coef * sum([f(points[i]) * inside_coefs[i] for i in range(self.num_points)])
        del outside_coef, inside_coefs, x, points
        return res

    
    def get_methods_list(self):
        return self.__get_methods_list__()
    
    def intergral_value(self, interval):
        return self.__intergral_value__(interval)