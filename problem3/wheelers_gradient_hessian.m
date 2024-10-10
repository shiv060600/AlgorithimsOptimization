syms x1 x2
v = [x1 ; x2];
wheelers_ridge = -exp(-(x1*x2-3/2)^2-(x2-3/2)^2);
wheelers_grad = gradient(wheelers_ridge,v);
wheelers_hessian = hessian(wheelers_ridge,v);
matlab_f_grad = matlabFunction(wheelers_grad);
matlab_f_hessian = matlabFunction(wheelers_hessian);
