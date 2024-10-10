function hess = hess_f(x, y)
    d2f_dx2 = 3*x^2 - 1 + exp(x)/5;
    d2f_dy2 = 1;
    d2f_dxdy = 0; % Cross partial derivative is 0 since the function is separable in x and y
    hess = [d2f_dx2, 0; 0, d2f_dy2];
end