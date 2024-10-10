% Define bounds and grid of start points
x1_vals = 0:1:4;
x2_vals = 0:1:4;
    
    % Parameters
max_iter = 100;
tol = 1e-5;
a = 3/2;  % Parameter 'a' in the Wheeler's Ridge function
    
    % Loop through grid of start points
for x1_0 = x1_vals
   for x2_0 = x2_vals
      fprintf('Starting at [%f, %f]\n', x1_0, x2_0);
      hess = matlab_f_hessian(x1_0,x2_0);
      eig_hess = eig(hess);
      fprintf("eigen value at the above start point is : \n")
      disp(eig_hess)
      [x_opt, f_opt] = newtons_method_wheeler([x1_0; x2_0], tol, max_iter, a);
      fprintf('Optimum found at [%f, %f] with f = %f\n', x_opt(1), x_opt(2), f_opt);
      
   end
end

fprintf("The convergence is difficult at some starting points because the eigen values of the hessian matrix are extemrely small or negative! \n")