function numOfImagesFromSameCategory=L2_A(numOfReturnedImages, queryImageFeatureVector, dataset, metric)
% input:
%   numOfReturnedImages : num of images returned by query
%   queryImageFeatureVector: query image in the form of a feature vector
%   dataset: the whole dataset of images transformed in a matrix of
%   features
%
% output:
%   plot: plot images returned by query

% extract image fname from queryImage and dataset
query_img_name = queryImageFeatureVector(:, end);
dataset_img_names = dataset(:, end);

queryImageFeatureVector(:, end) = [];
dataset(:, end) = [];

euclidean = zeros(size(dataset, 1), 1);
   
    % compute standardized euclidean distance
    weights = nanvar(dataset, [], 1);
    weights = 1./weights;
    for q = 1:size(dataset, 2)
        euclidean = euclidean + weights(q) .* (dataset(:, q) - queryImageFeatureVector(1, q)).^2;
    end
    euclidean = sqrt(euclidean);

% add image fnames to euclidean
euclidean = [euclidean dataset_img_names];

% sort them according to smallest distance
[sortEuclidDist indxs] = sortrows(euclidean);
sortedEuclidImgs = sortEuclidDist(:, 2);


% dispaly images returned by query
qin=query_img_name;
imgCategory=floor(qin/100);
numOfImagesFromSameCategory=0;
for m = 1:numOfReturnedImages
    img_name = sortedEuclidImgs(m);
    timgc=floor(img_name/100);
    if(imgCategory == timgc)
        numOfImagesFromSameCategory= numOfImagesFromSameCategory +1;
    end
end



end