
f = @(x)(-2+x*(7+x*(-5+x*(1))));
x0 = 2;
h = [0.0001,0.001,0.01,0.1];
real_val = -1.0;
forward_error = zeros(1,length(h));
centered_error = zeros(1,length(h));
for i = 1:length(h)
    forward_error(i) = abs((forward_diff(f,x0,h(i))) - real_val);
    centered_error(i) = abs((centered_diff(f,x0,h(i))) - real_val);
end

loglog(h,forward_error,'r.')
hold on
loglog(h,centered_error,'g.')
title("Finite difference error vs stepsize h")
legend("forward diff","mid diff")
ylabel("err")
xlabel("h")


