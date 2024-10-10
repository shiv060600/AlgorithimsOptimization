import numpy as np 
import matplotlib.pyplot as plt
# using NP create the polynomial x^3 -5x^2 +7x -2 == -2+x(7+x(-5+x(1))) (horners) using poly1d we can get a fast implementation
f = np.poly1d([1,-5,7,-2])
#establish h values:
h = [0.0001,0.001,0.01,0.1]
#estable fprime using np.polyder
fprime = np.polyder(f)
def fwd_diff(p,x0,h):
    #p is a polynomial, must be np.poly1d
    #x0 is the value to differentiate at
    #h is the step size
    val = (p(x0 + h) - p(x0))/h
    return val
def mid_diff(p,x0,h):
    #p is a polynomial, must be np.poly1d
    #x0 is the value to differentiate at
    #h is the step size
    val = (p(x0+h) - p(x0-h))/(2*h)
    return val

print("Derivative calculated using numpy and fwd_diff at h =1e-4: ",fwd_diff(f,2,0.0001),"\n")
print("Derivative calculated using numpy and mid_diff at h =1e-4: ",mid_diff(f,2,0.0001),"\n")
print("Derivative calcuated by numpy built in function np.polyder: ",float(fprime(2)),"\n")

def test_fwd(x0):
    tol = 1e-3
    val = fprime(x0)
    #This functions tests fwd_diff for all h at tol 1e-3 
    for i in range(len(h)-1):
        if abs(fwd_diff(f,x0,h[i]) - val) < tol:
            print("fwd_diff passed at h=",h[i],"\n")
    return
def test_mid(x0):
    tol = 1e-3
    val = fprime(x0)
    #This functions tests fwd_diff for all h at tol 1e-3 
    for i in range(len(h)-1):
        if abs(mid_diff(f,x0,h[i]) - val) < tol:
            print("mid_diff passed at h=",h[i],"\n")
    return
test_fwd(2)
test_mid(2)
print("It is easy to see that fwd_diff and mid_diff are not that accurate, however, mid_diff is clearly more accurate \n"+
      "than fwd_diff as at the same tolerance of 1e-3, mid_diff passed at h = 0.01,0.001,0.0001 while fwd_diff only passed at h =0.0001\n")
print("lets compare using a graph of matplot lib\n")
fwd_errors = [0]  * 4
mid_errors = [0] * 4
for i in range(3):
    fwd_errors[i] = float(fwd_diff(f,2,h[i]) - float(fprime(2)))
    mid_errors[i] = float(mid_diff(f,2,h[i]) - float(fprime(2)))

plt.plot(h,fwd_errors,'r.',h,mid_errors,'b.')
plt.show()











