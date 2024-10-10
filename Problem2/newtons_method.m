function [x_opt, y_opt, f_opt] = newtons_method(start_point, tol, max_iter)
    x = start_point(1);
    y = start_point(2);
    
    for iter = 1:max_iter
        grad = grad_f(x, y);
        hess = hess_f(x, y);
        
        % Stopping condition based on the gradient norm
        if norm(grad) <= tol * (1 + abs(f_obj(x, y)))
            fprintf("Converged at %i \n",iter)
            break;
        end
        
        % Newton's update step
        step = -hess \ grad;
        
        % Update x and y
        x = x + step(1);
        y = y + step(2);
        
        % Ensure bounds are respected
        x = min(max(x, -5), 5);
        y = min(max(y, -5), 5);
    end
    
    x_opt = x;
    y_opt = y;
    f_opt = f_obj(x_opt, y_opt);
end