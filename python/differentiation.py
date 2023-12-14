from __utils__ import *

class ClosedNewtonCotes():
    def __init__(self, method, points, func):
        self.methods_list = ["trapezoidal", "simpson", "3/8", "Milne", "6-points", "weddle"]
        assert (method in self.methods_list)
        self.method = method
        assert (self.methods_list.index(self.method) + 2 == points)
        self.points = points
        assert(isinstance(func, func_type) for func_type in [sym.Expr, types.FunctionType])
        self.func = func
    
    def __get_methods_list__(self):
        return self.methods_list

    def __get_deriative__(self, point):
        pass
    
    def get_methods_list(self):
        return self.__get_methods_list__()
    
    def get_deriative(self, point):
        return self.__get_deriative__(point)