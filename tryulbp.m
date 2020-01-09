myDir = 'C:/DataSets/WANG/'; %gets directory
myFiles = dir(fullfile(myDir,'*.jpg')); %gets all JPG files in struct
dataset=zeros([1000 178]);
for k = 1:length(myFiles)
    baseFileName = myFiles(k).name
    %fullFileName = fullfile(myDir, baseFileName)
    [filepath,name,ext]=fileparts(fullfile(myDir,baseFileName));
    img=imread(fullfile(myDir,baseFileName));
    R=img(:,:,1);G=img(:,:,2);B=img(:,:,3);
    tmp1=ULBP(R);tmp2=ULBP(G);tmp3=ULBP(B);
    tmp1=bsxfun(@rdivide,tmp1,sum(tmp1));tmp2=bsxfun(@rdivide,tmp2,sum(tmp2));tmp3=bsxfun(@rdivide,tmp3,sum(tmp3));
    %bsxfun(@rdivide,tmp,sum(tmp))
    dataset(k,:)=[tmp1,tmp2,tmp3,str2num(name)];
    %dataset(k,:)=[tmp,str2num(name)];
    clc;
end

countf=zeros([1000 2]);
distm=zeros([1000 2]);
for k=1:1000
    clc;
    p=dataset(k,1:end-1);
    pname=dataset(k,end)
    for i=1:1000
        q=dataset(i,1:end-1);
        qname=dataset(i,end);
        dis=double(dist(p,q,'extendedcanberra'));
        distm(i,:)=[dis,qname];
    end
    distm=sortrows(distm,1);
    count=0;
    for i=1:100
        if floor(distm(i,2)/100) == floor(distm(1,2)/100)
            count = count+1;
        end
    end
    countf(k,:)=[pname,count];
    count=0;
end

avgpre = sum(countf(:,2)/1000)






