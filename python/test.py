from larange import *
from integration import *
from differentiation import *

if __name__ == "__main__":
    f = lambda x: x ** 2
    integral_trap = ClosedNewtonCotes(f)
    print(integral_trap.intergral_value((0, 2)))
    integral_simpson = ClosedNewtonCotes(f, "simpson")
    print(integral_simpson.intergral_value((0,2)))
    print(sci.integrate.quad(f, 0, 2))
