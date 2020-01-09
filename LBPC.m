function [ LBP_hist, varargout ] = LBPC( img, ch )
R=img(:,:,1);
G=img(:,:,2);
B=img(:,:,3);
if ch == 1
    LBP_hist=LBP(R);
elseif ch == 2
    LBP_hist=LBP(G);
elseif ch == 3
    LBP_hist=LBP(B);
end