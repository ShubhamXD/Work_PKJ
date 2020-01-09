% Created by: Shubham Sharma
% MATLAB function for Canberra distance
% computes Canberra for p and q vectors

function ecd = extended_canb_dist(p,q)
     %u_p=mean(p)            % mean of p vector
     %u_q=mena(q)            % mean of q vector
     ecd = sum(abs(p - q))./ ((abs(p)+mean(p)) + (abs(q)+mean(q)));
end