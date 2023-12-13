import numpy as np
import scipy as sp

def closed_newton_cotes(f, a, b, n=3, verbose=0):
    assert (n > 1) & (n < 7), "n must be in range [2; 6]"
    h = (b - a) / (n - 1)
    
    pass

if __name__ == "__main__":
    pass