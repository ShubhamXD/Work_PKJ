% Created by: Shubham Sharma
% MATLAB function for Sqaure chord distance
% computes Square chord for p and q vectors

function sqchd = sqchord_dist(p,q)
     sqchd = sum((sqrt(p) - sqrt(q)).^2);
end