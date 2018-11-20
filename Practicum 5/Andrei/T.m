function [T]=T(fun,a,b,k,j)
%A=zeros(k+1,j+1);
    for i=0:k
        A(i+1,1)=trapiter(fun,a,b,i);
    end
    if j==0;
        T=A(k+1,j+1);
    else
        for i=2:k+1;
            A(k+1,j+1)=(4^j*A(k+1,j)-A(k,j))/(4^(j)-1);
        end
        T=A(k+1,j+1);
    end
end