function test= test(path,dataSet,metric)

% construct folder name foreach image type
jpgImagesDir = fullfile(path, '*.jpg');

% calculate total number of images

num_of_jpg_images = numel( dir(jpgImagesDir) );

totalImages =  num_of_jpg_images;

jpg_files = dir(jpgImagesDir);


if ( ~isempty( jpg_files ) )
    jpg_counter = 0;
    accMeasure=zeros([1000 2]);
    for k = 1: totalImages
        if ( (num_of_jpg_images - jpg_counter) > 0)
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
        FVP=[FVP str2num(name)];
        numOfImageFromSameCategory=returnedImages(100,FVP,dataSet, metric)
        accMeasure(k,1)=str2num(name);
        accMeasure(k,2)=numOfImageFromSameCategory;
        % dataset(k, :) = [ FVP str2num(name)];
        
        
    end
    
    % prompt to save dataset
    uisave('accMeasure', 'accMeasure');
    
    
end