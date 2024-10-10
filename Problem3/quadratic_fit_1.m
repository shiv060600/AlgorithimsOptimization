function xstar = quadratic_fit_1(f, a, b, c, tol)
  
  warning('off','MATLAB:nearlySingularMatrix');

  % Sample objective function at three points.
  ya = f(a);
  yb = f(b);
  yc = f(c);

 
  for i=1:100
    y = [ya; yb; yc];
    A = [1, a, a^2; 1, b, b^2; 1, c, c^2];
    p = A\y;
    
    
    x = -p(2)/(2*p(3));
    yx = f(x);

   

 
    if (abs(x - c) < tol)
      fprintf("converged at i = %f \n",i)
      xstar = x;
      return
    end

    % Now figure out new three points by just
    % removing the "oldest" point (a).
    a = b;
    ya = yb;
    b = c;
    yb = yc;
    c = x;
    yc = yx;
    
  end  
  % If we get here it's because we did not converge.  Error out.
  error('Did not converge!')
  
end
  
  