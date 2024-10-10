L = randn(5,5);
C = randn(5,5);
A = L'*L;
x0 = rand(5,1);
tol = 1e-5;
b = rand(5,1);
f = @(x)((0.5*x'.*A.*x) - (x'*b + C));
sol_backslash = A\b;
sol_gradient = gradient_descent(A,b,x0,tol);
disp("The soultion using matlabs backslash Operator is:")
disp(sol_backslash)
disp("The solution using gradient descent is : ")
disp(sol_gradient)






