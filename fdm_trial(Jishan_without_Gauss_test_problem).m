
function [x,U] =fdm_trial(a,b,n)
%Test example without Gauss
 h=(b-a)/n; 
 A=sparse(n,n);
 F=zeros(n,1);
 for i =1:n
     A(i,i)=-3;
 end
 for i =1:n-1
     A(i+1,i)=3;
 end

 for i =1:n-2
     A(i+2,i)=-1; 
 end

for i =1:n-1
     A(i,i+1)=1;
 end

 for j=1:n
     x(j)=a+j*h-h/2;
 end
 for j=1:n
     F(j)=(h^3*24*x(j));
 end

F(1) = F(1) + h;

%A(1,1) = -2;
size(A);
size(F);
% disp([F]);
 U=A\F
end


