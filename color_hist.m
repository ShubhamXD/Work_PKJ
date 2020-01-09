function ch=color_hist(image) 
%image=imread('peppers.png');
    Red = image(:,:,1);
    Green = image(:,:,2);
    Blue = image(:,:,3);
    %Get histValues for each channel
    yRed = imhist(Red,10);
    yGreen = imhist(Green,10);
    yBlue= imhist(Blue,10);
    ch=[yRed' yGreen' yBlue'];
end