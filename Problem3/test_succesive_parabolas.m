% Nice function 
f1 = @(x)(x*tanh((x-5)/3));
% Nasty function
f2 = @(x)(1 - exp(-((x+1)^2/4)));
x = linspace(-10,10,50);

f1_vals = zeros(1,50);
f2_vals = zeros(1,50);
for i = 1:50
    f1_vals(i) = f1(x(i));
    f2_vals(i) = f2(x(i));
end

%lets check the parabolas looks comparable to homework question
figure(1);
plot(x,f1_vals)
title("Nice Parabola")
figure(2)
plot(x,f2_vals)
title("Nasty Parabola")
%Plot looks good. 

% Finding the minimum of the Nice function
x_min_f1 = fminbnd(f1, -10, 10); % Minimize within range [-10, 10]
min_value_f1 = f1(x_min_f1);      % Calculate the minimum value

% Finding the minimum of the Nasty function
x_min_f2 = fminbnd(f2, -10, 10); % Minimize within range [-10, 10]
min_value_f2 = f2(x_min_f2);      % Calculate the minimum value

% Display the results
fprintf('Minimum value of Nice function f1 is %.4f at x = %.4f\n', min_value_f1, x_min_f1);
fprintf('Minimum value of Nasty function f2 is %.4f at x = %.4f\n', min_value_f2, x_min_f2);

%Set a,b,c we can pick any in interveral [-10,10] and tol 1e-5
a = -10;
b = 0;
c = 10;
tol = 1e-5;

warning('off','MATLAB:nearlySingularMatrix');

f1_min = quadratic_fit_1(f1,a,b,c,tol);
%f2_min = quadratic_fit_1(f2,a,b,c,tol);
fprintf("f1 min is at x = " + f1_min + " and its value is" + f1(f1_min) + "\n")
%fprintf("f2 min is at x = " + f2_min + " and its value is" + f2(f2_min) + "\n")
fprintf("Min values are the same for calculated using matlabs inbuilt function for the nice function regarding quadratic fit\n " + ...
    "unfortunately, f2 does not converge, in order to not have the error message, I have commented out the code.")

