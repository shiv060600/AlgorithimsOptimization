function xstar = brents_method(f, a, b, tol)
 
    
  
  % Compute starting values
  psi = (sqrt(5)-1)/2;
  x = a + psi*(b-a); 
  
  sm1 = inf;

  for cnt = 1:50
    u = spi(f, a, b, x);
    do_gss = 0;
    if (isnan(u))
      do_gss = 1;
    end
    
    s = abs(u-x);  
    if (s > sm1/2)   
      do_gss = 1;
    end
    
    if (do_gss)
      u = gss(f, a, b, x);
    else
      
    end
    
    
    fu = f(u);
    fx = f(x);
    
    if (fu <= fx)
      if (u >= x)
	a = x;
	x = u;
      else
	b = x;
	x = u;
      end
    else
      if (u<x)
	a = u;
	x = x;
      else
	b = u;
	x = x;
      end
    end
   
    
    
    if ((b-a)<tol)
      fprintf('Converged at iteration %d!\n', cnt)      
      xstar = u;
      return
    end

    
    sm1 = s;
    
  end
  
  error('Brents method failed to converge!')
  
end
  