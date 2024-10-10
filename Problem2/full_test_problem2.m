% Test for all integer values of x and y in [-5, 5]
disp('Testing all integer values of x and y in the range [-5, 5]...');
epsilon = 1e-5;
stopping_tol = @(grad_val) norm(grad_val) <= epsilon;

for x_test = -5:5
    for y_test = -5:5
        % Initialize variables for the current test point
        x = x_test;
        y = y_test;
        x_prev = x;
        y_prev = y;
        grad_prev = grad_f(x_prev, y_prev);
        v_x = 0;  % Initial velocity for x (for momentum)
        v_y = 0;  % Initial velocity for y
        
        % Start gradient descent loop for the current test point
        for iter = 1:max_iterations
            % Compute the Nesterov momentum update (look ahead)
            x_nesterov = x + gamma * v_x;
            y_nesterov = y + gamma * v_y;
            
            % Compute the gradient at the Nesterov point
            grad = grad_f(x_nesterov, y_nesterov);
            
            % Armijo's rule with backtracking line search
            alpha = alpha_init; % Reset step size to initial
            while f(x_nesterov - alpha * grad(1), y_nesterov - alpha * grad(2)) > ...
                  f(x_nesterov, y_nesterov) - armijo_sigma * alpha * (grad' * grad)
                % Reduce step size (backtracking)
                alpha = alpha / 2;
            end
            
            % Update velocities with momentum
            v_x = gamma * v_x - alpha * grad(1);
            v_y = gamma * v_y - alpha * grad(2);
            
            % Update x and y using the velocity
            x = x + v_x;
            y = y + v_y;
            
            % Compute the new gradient after updating position
            grad_new = grad_f(x, y);
            
            % Check stopping condition
            if stopping_tol(grad_new)
                break;
            end
            
            % Update previous gradient for next iteration
            grad_prev = grad_new;
        end
        
        % Output final values for the current test point
        fprintf('Test point [x, y] = [%d, %d]: Optimized [x, y] = [%.5f, %.5f] after %d iterations.\n', ...
                x_test, y_test, x, y, iter);
        fprintf('Final function value f(x, y) = %.5f\n', f(x, y));
    end
end
disp("It is working for all values, test completed")