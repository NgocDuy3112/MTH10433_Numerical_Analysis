from __utils__ import *

class FirstDeriative():
    def __init__(self, func, method="end", num_points=3, h=0.001):
        assert(isinstance(func, func_type) for func_type in [sym.Expr, types.FunctionType])
        self.func = func
        self.methods_list = ["end", "mid", "left", "right"]
        assert (method in self.methods_list)
        self.method = method
        assert (num_points in [3, 5]) 
        self.num_points = num_points
        if self.method == "right":
            assert (h < 0)
        elif self.method == "left":
            assert (h > 0)
        else:
            assert (h != 0)
        self.h = h
    
    def __get_diff_at__(self, point):
        x = sym.Symbol('x')
        points = [None] * self.num_points
        f = None
        outside_coef = 0
        inside_coefs = []
        res = 0
        if isinstance(self.func, sym.Expr):
            f = sym.lambdify(x, self.func)
        else:
            f = self.func
        if self.method == "mid":
            for i in range(self.num_points):
                points[i] = point + (i - int(self.num_points / 2)) * self.h
            if self.num_points == 3:
                outside_coef = 1/2
                inside_coefs = [-1, 0, 1]
            if self.num_points == 5:
                outside_coef = 1/12
                inside_coefs = [1, -8, 0, 8, -1]
        else:
            for i in range(self.num_points):
                points[i] = point + i * self.h
            if self.num_points == 3:
                outside_coef = 1/2
                inside_coefs = [-3, 4, -1]
            if self.num_points == 5:
                outside_coef = 1/12
                inside_coefs = [-25, 48, -36, 16, -3]
        res = outside_coef / self.h * sum([f(points[i]) * inside_coefs[i] for i in range(self.num_points)])
        del points, outside_coef, inside_coefs, x
        return res
    
    def get_diff_at(self, point):
        return self.__get_diff_at__(point)

