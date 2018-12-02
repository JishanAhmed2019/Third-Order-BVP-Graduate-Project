[X, U] = fdm_trial(0,1,64)
plot(X,U)                           
hold on
f = @(x) x.^4 - x;
%plot(X(1:50:end),f(X(1:50:end)),'o')
plot(X,f(X),'o')
