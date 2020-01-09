function trainedDataSet= train(path,dataSetName)

% construct folder name foreach image type
jpgImagesDir = fullfile(path, '*.jpg');

% calculate total number of images
totalImages = numel( dir(jpgImagesDir) );

jpg_files = dir(jpgImagesDir);

if ( ~isempty( jpg_files ) )
    % read jpg images from stored folder name
    % directory and construct the feature dataset
    jpg_counter = 0;
    for k = 1:totalImages
        if ( (totalImages - jpg_counter) > 0)
            imgInfoJPG = imfinfo( fullfile( path, jpg_files(jpg_counter+1).name ) );
            if ( strcmpi( imgInfoJPG.Format, 'jpg') == 1 )
                % read images
                sprintf('%s \n', jpg_files(jpg_counter+1).name)
                % extract features
                image = imread( fullfile( path, jpg_files(jpg_counter+1).name ) );
                [pathstr, name, ext] = fileparts( fullfile( path, jpg_files(jpg_counter+1).name ) );
                image = imresize(image, [384 256]);
            end
            jpg_counter = jpg_counter + 1;
        end
        queryImage = imresize(image, [384 256]);
        FVP = color_hist(queryImage);
        dataset(k, :) = [ FVP str2num(name)];
        % clear workspace
        clear('image', 'img', 'hsvHist', 'autoCorrelogram', 'color_moments', ...
            'gabor_wavelet', 'wavelet_moments', 'set', 'imgInfoJPG', 'imgInfoPNG', ...
            'imgInfoGIF');
    end
    
    % prompt to save dataset
     uisave('dataset', dataSetName);
    %save(dataSetName+'.mat', 'dataset', '-mat');
    clear('dataset', 'jpg_counter', 'png_counter', 'bmp_counter');
end