function [ LBP_hist, varargout ] = LBPH( img )
    img = rgb2hsv(img);
    img = img(:,:,1);
    LBP_hist=LBP(img);
end