function retImg = returnedImages(numOfReturnedImages,imageFeature,dataSet,metric)
load(dataSet,'-mat');

query_img_name = imageFeature(:, end);
dataset_img_names = dataset(:, end);

imageFeature(:, end) = [];
dataset(:, end) = [];

d = zeros(size(dataset, 1), 1);

for q=1:size(dataset,1)
    d=dist(dataset,imageFeature,metric);
end
% add image fnames to euclidean
d = [d' dataset_img_names]

% sort them according to smallest distance
[sortDist indxs] = sortrows(d);
sortedImgs = sortDist(:, 2);


% dispaly images returned by query
qin=query_img_name;
imgCategory=floor(qin/100);
numOfImagesFromSameCategory=0;
for m = 1:numOfReturnedImages
    img_name = sortedImgs(m);
    timgc=floor(img_name/100);
    if(imgCategory == timgc)
        numOfImagesFromSameCategory= numOfImagesFromSameCategory +1;
    end
end
retImg=numOfImagesFromSameCategory;
end

