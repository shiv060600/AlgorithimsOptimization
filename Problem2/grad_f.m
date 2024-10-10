function grad = grad_f(x, y)
    df_dx = x^3 - x + 1/10 + exp(x)/5;
    df_dy = y;
    grad = [df_dx; df_dy];
end