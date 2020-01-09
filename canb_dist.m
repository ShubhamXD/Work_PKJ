% Copyright (c) Brokflow Pvt Ltd
% All rights reserved
% 3JDK

% MATLAB function for Canberra distance
% computes Canberra for and q vectors

function cd = canb_dist(p,q)
   cd = sum(abs(p - q))./ (abs(p) + abs(q));
 end

