% Created by: Shubham Sharma
% MATLAB function for Chi-Square distance
% computes Chi-Square for p and q vectors

function chisqd = chisq_dist(p,q)
     chisqd = sum(((p-q).^2)/(p+q));
end