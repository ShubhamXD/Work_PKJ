function [ulbpHist]= ULBP(image)
ulbpHist=extractLBPFeatures(image,'Upright',true);
end