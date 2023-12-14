from larange import *

if __name__ == "__main__":
    x = [0, 1, 2, 3]
    y = [xi**3 + 1 for xi in x]
    points = []
    for i in range(4):
        points.append((x[i], y[i]))
    larange_poly = LarangePolynomial1D(points)
    print(type(larange_poly.approximated_polynomial()).__bases__)