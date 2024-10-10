function [x_opt, f_opt] = newtons_method_wheeler(start_point, tol, max_iter, a)
    x = start_point;
    syms x1 x2
    v = [x1 ; x2];
    wheelers_ridge = -exp(-(x1*x2-3/2)^2-(x2-3/2)^2);
    wheelers_grad = gradient(wheelers_ridge,v);
    wheelers_hessian = hessian(wheelers_ridge,v);
    matlab_f_grad = matlabFunction(wheelers_grad);
    matlab_f_hessian = matlabFunction(wheelers_hessian);

    for iter = 1:max_iter
        grad = matlab_f_grad(x(1),x(2));
        hess = matlab_f_hessian(x(1),x(2));
        % Stopping condition based on the gradient norm
        if norm(grad) <= tol * (1 + abs(f_wheeler(x)))
            x_opt = x;
            f_opt = f_wheeler(x_opt);
            return
        end
        
        
        
        % Newton's update step
        step = -hess \ grad;
        
        % Update x1 and x2
        x = x + step;
        

    end
    
    
end