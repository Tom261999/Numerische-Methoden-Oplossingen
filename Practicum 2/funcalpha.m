function [alpha] = funcalpha(c,A,d)
%FUNCALPHA returns the value for alpha given by alpha=c'*A^-1*d
%   This function will find the value for alpha using vectors c, d and
%   matrix A without directly calculating the inverse matrix A.
alpha = c'*(A\d)
end

