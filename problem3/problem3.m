% Load the wind velocity data
data = readmatrix("/Users/shivvinnybhutani/Desktop/Algo & Optimization/HW/HW2/problem3/wind_speed_boston_corrected.csv");           
N = length(data);  % Number of data points
% Initial guess for k (shape) and lambda (scale)
k = 4;  % Reasonable initial guess for k
lambda = 2;  % Initial guess based on data scale

% Hyperparameters for gradient descent
alpha = 1e-9;  % Smaller step size
tolerance = 1e-5;  % Convergence tolerance
max_iterations = 40;  % Maximum iterations

% Gradients of the log-likelihood function
grad_lambda = @(k, lambda,x) sum(((k.*(x/lambda).^k) - 1)./(log(x-lambda)));
grad_k = @(k, lambda, x) sum((1/k) - (((x./lambda).^k - 1).*log(x./lambda)));

% Gradient descent loop
for iter = 1:max_iterations
    % Compute the gradient of the log-likelihood
    g_k = grad_k(k, lambda, data);
    g_lambda = grad_lambda(k, lambda, data);
    
    % Update k and lambda
    k_new = k - alpha * g_k;
    lambda_new = lambda - alpha * g_lambda;

    g = [k_new - k;
         lambda_new - lambda];
    
    % Check for convergence
    if norm(g) < tolerance
        return
    end
    
    % Update for next iteration
    k = k_new;
    lambda = lambda_new;
end

% Output results
fprintf('Estimated k (shape): %.4f\n', k);
fprintf('Estimated lambda (scale): %.4f\n', lambda);

% Compare with MATLAB's built-in wblfit function
[param_wbl, ~] = wblfit(data);
fprintf('wblfit k: %.4f\n', param_wbl(1));
fprintf('wblfit lambda: %.4f\n', param_wbl(2));

% Plot the results
figure;
histogram(data, 'Normalization', 'pdf');
hold on;

% Plot the fitted Weibull PDF
x_vals = linspace(min(data), max(data), 100);
y_vals = (k/lambda) * (x_vals/lambda).^(k-1) .* exp(-(x_vals/lambda).^k);
plot(x_vals, y_vals, 'r-', 'LineWidth', 2);

% Label the plot
xlabel('Wind Speed');
ylabel('Probability Density');
title('Weibull Fit to Wind Speed Data');
legend('Data Histogram', 'Fitted Weibull PDF');
grid on;
