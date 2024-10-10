function u = spi(f, a, b, x)
  

  tol = 1e-10;  
    
  warning('off','MATLAB:nearlySingularMatrix');
  warning('off','MATLAB:singularMatrix');

 
  ya = f(a);
  yb = f(b);
  yx = f(x);

  
  y = [ya; yb; yx];
  A = [1, a, a^2; 1, b, b^2; 1, x, x^2];
  p = A\y;
  
 
  
  if (abs(p(3)) < tol) 
    u = nan;
    return
  end
  
  
  u = -p(2)/(2*p(3));
  
  if ((u<a) || (u>b))
    u = nan;
    return
  end

  
  return
  
end
  
  