X0 = [2 ; 2];
tol = 1e-5;
fprintf("At the second interation the program fails because the Hessian is Singular, same issue I had calculating by hand press cntrl+C to exit\n")
X = problem1_function_modified(@gradient1b,@hessian1b,X0,tol);
