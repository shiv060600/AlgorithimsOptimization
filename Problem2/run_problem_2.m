% Aluffi-Pentini-like function with e^x / 5 term
f = @(x, y) (x.^4)/4 - (x.^2)/2 + x/10 + (y.^2)/2 + exp(x)/5;

% Gradient of the function
grad_f = @(x, y) [(x.^3 - x + 1/10 + exp(x)/5); y];

% Parameters for Nesterov momentum and backtracking
alpha_init = 1.0;       % Initial step size
beta = 0.9;             % Backtracking parameter (0 < beta < 1)
gamma = 0.9;            % Momentum parameter (0 < gamma < 1)
epsilon = 1e-5;         % Stopping tolerance
max_iterations = 100;   % Maximum number of iterations
armijo_factor = 0.5;    % Factor for Armijo's condition
armijo_sigma = 0.1;     % Armijo condition parameter (0 < sigma < 1)

% Define stopping tolerance
stopping_tol = @(grad_val) norm(grad_val) <= epsilon;

% Initialize variables
x = -5 + 10 * rand();  % Random start point for x in range [-5, 5]
y = -5 + 10 * rand();  % Random start point for y in range [-5, 5]
disp("Randomly Generated x and y")
fprintf("x is %x \n",x)
fprintf("y is %f \n",y)
x_prev = x;            % Store previous position for momentum
y_prev = y;

% Store gradient and position
grad_prev = grad_f(x_prev, y_prev);
v_x = 0;  % Initial velocity for x (for momentum)
v_y = 0;  % Initial velocity for y

% Start gradient descent loop
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
        alpha = alpha /2 ;
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

% Output final values
fprintf('Optimized [x, y] = [%.5f, %.5f] after %d iterations.\n', x, y, iter);
fprintf('Final function value f(x, y) = %.5f\n', f(x, y));

% Verify if [x, y] is a local minimum by small perturbations
epsilon_test = 1e-2;
fprintf('f(x + epsilon, y) = %.5f\n', f(x + epsilon_test, y ));
fprintf('f(x - epsilon, y) = %.5f\n', f(x - epsilon_test, y));
fprintf('f(x, y + epsilon) = %.5f\n', f(x, y + epsilon_test));
fprintf('f(x, y - epsilon) = %.5f\n', f(x, y - epsilon_test));

