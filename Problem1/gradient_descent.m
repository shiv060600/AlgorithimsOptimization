function  xn1 = gradient_descent(A,b,x0,tol)

xn = A*x0 + b;
alpha = 0.003;
for i = 1:2000
    gn = A*xn - b;
    delta = alpha*gn;
    xn1 = xn - delta;
    gn1 = A*xn1 - b;
    alpha = (gn'*gn)/(gn'*A*gn);

    if abs(gn1) < tol
        return
    end
    xn = xn1;
    gn = gn1;
end

    
end