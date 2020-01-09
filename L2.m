function L2(numOfReturnedImages, queryImageFeatureVector, dataset, metric)
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

% clear axes
arrayfun(@cla, findall(0, 'type', 'axes'));

% display query image
str_name = int2str(query_img_name);
query_img = imread( strcat('corel\', str_name, '.jpg') );
subplot(3, 11, 1);
imshow(query_img, []);
title('Query Image', 'Color', [1 0 0]);

% dispaly images returned by query
for m = 1:numOfReturnedImages
    img_name = sortedEuclidImgs(m);
    img_name = int2str(img_name);
    str_img_name = strcat('corel\', img_name, '.jpg');
    returned_img = imread(str_img_name);
    subplot(3, 11, m+1);
    imshow(returned_img, []);
end

end