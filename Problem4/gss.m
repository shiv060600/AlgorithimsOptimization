function u = gss(f, a, b, x)
  
  
  phi = 0.618;
    
  
  x = a + phi*(b-a);
    
  
  xnew = a + phi*(x-a);
  
  
  fx = f(x);
  fxnew = f(xnew);
  
  if (fxnew < fx)
    
    u = x;
  else
    
    u = xnew;
  end

  return
  
end


