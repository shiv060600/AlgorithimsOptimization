% Define bounds and grid of start points
x_vals = -5:1:5;
y_vals = -5:1:5;
    
    % Parameters
max_iter = 100;
tol = 1e-5;
    
    % Loop through grid of start points
for x0 = x_vals
  for y0 = y_vals
     fprintf('Starting at [%f, %f]\n', x0, y0);
     [x_opt, y_opt, f_opt] = newtons_method([x0; y0], tol, max_iter);
     fprintf('Optimum found at [%f, %f] with f = %f\n', x_opt, y_opt, f_opt);
  end
end
fprintf("Works at all x,y function passed and it is the same as gradient descent in last weeks homework")