tic;
[X, U] = fdm_trial(0,1,200)
f = @(x) x.^4 - x;
plot(X,U,X,f(X),'-')  
toc;