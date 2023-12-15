from larange import *
from integration import *

if __name__ == "__main__":
    f = lambda x: x**3
    integral = ClosedNewtonCotes(f, (0, 1))
    print(integral.intergral_value())
    print(sci.integrate.quad(f, 0, 1))
