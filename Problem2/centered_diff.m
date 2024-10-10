function val = centered_diff(f,x0,h)
val = (f(x0+h)-f(x0-h))/(2*h);
end