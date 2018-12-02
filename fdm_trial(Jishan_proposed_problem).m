
function [x,U] =fdm_trial(a,b,n) 
% Proposed problem with gauss
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
      if x(j)==(a+b)/2;
     F(j)=h^3;
      else 
     F(j)=0;
       end
 end
 F(1)=F(1)-2*h;
%A(1,1) = -2;
size(A);
size(F);
% disp([F]);
m = size(A, 1);  % Size of input matrix
r = zeros(m, 1); % Imitialize permutatiom vector
for i = 1 : 1 : m    
   r(i) = i;
end
% disp(r);
U = zeros(m, 1);
for k = 1 : 1 : m 
    max = abs(A(r(k), r(k)));    
    max_pos = k;    
    for l = k : 1 : m        
        if abs(A(r(l), r(k))) > max            
            max = abs(A(r(l), r(k)));            
            max_pos = l;            
        end
    end
    temp_r = r;
    r(k) = temp_r(max_pos);
    r(max_pos) = temp_r(k);     
    for i = 1 : 1 : m
        if i ~= k
            zeta = A(r(i), k) / A(r(k), k);
            for j = k : 1 : m
                A(r(i), j) = (A(r(i), j) - A(r(k), j) * zeta);                       
            end
            F(r(i)) = F(r(i)) - F(r(k)) * zeta;
        end
    end
end
for i = 1 : 1 : m
    U(i) = F(r(i)) / A(r(i), i);
end
end

