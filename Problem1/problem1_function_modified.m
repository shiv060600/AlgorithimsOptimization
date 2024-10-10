function X = problem1_function_modified( gradient1, hessian1, X0, tol)
  % This is the implementation of Newton's method for optimizing a scalar
  % fcn having multiple inputs.  This version computes the step
  % directly.

  global lim;
    
  X = X0;
  fprintf('start X = [%8.5f, %8.5f]\n', X(1), X(2) ); 
  fprintf('Hit any key to begin direction search....\n')
  pause

  % Do optimization in a for loop to prevent infinite loops
  % from nonconvergence
  for i = 1:100

    % Now get the gradient at point X
    gn = gradient1(X);
    disp(gn)

    % Now get the Hessian at point X
    Hn = hessian1(X);
    disp(Hn)

    % Get step vector
    pn = Hn\gn;

    % Draw a line segment pointing in the direction indicated by pn.
    %offset = 4*pn/norm(pn);
    %plot([X(1); X(1)+offset(1)], [X(2); X(2)+offset(2)], 'r','LineWidth',2)
    %fprintf('Hit any key to step ....\n')
    %pause
    
    % Update X by stepping in direction pn with stepsize delta*pn.
    X = X - pn;
    fprintf('new X = [%8.5f, %8.5f]\n', X(1), X(2) );

    plot(X(1), X(2), 'ro','MarkerFaceColor','r','MarkerSize',5)
    
    % Check if we're close enough to quit yet
    % Check if step length is less than tol
    if norm(pn) < tol
      fprintf('Terminating after %d iterations because norm(delta) < tol.\n', i)
      return
    end

    fprintf('Hit any key to find direction....\n')
    pause

  end  % end of for loop

  error('Terminated without convergence!\n')
end
