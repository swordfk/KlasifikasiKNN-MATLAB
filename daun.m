[num_train,txt,raw] = xlsread("train.xlsx",1);
[num_kelas,kelas,raw_kelas] = xlsread("train.xlsx",2); 
model = fitcknn(num_train,kelas);
model.Distance = 'euclidean';
%[file,path]=uigetfile({'*.jpg';'*.bmp';'*.gif';'*.tiff'}, 'Select file');
%img= imread(fullfile(path,file), 'jpg');
img = imread('a1.jpg');
img = imresize(img,0.3125);
SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 1 0; 1 0 1];
SE3 = [1 1 1; 1 1 1; 1 1 1];
gray = rgb2gray(img);
bw = imbinarize(gray);
bw = ~bw;
dil = imdilate(bw,SE3);
cc = bwconncomp(dil,4);
num = 1;
counter=0;
while(cc.NumObjects~=1)
    if(cc.NumObjects>1)
        num = cc.NumObjects;
        dil = imdilate(dil,SE2);
        counter = counter+1;
    end
    cc = bwconncomp(dil,4);
                    
end
while(counter>0)
    dil = imerode(dil,SE1);
    counter = counter-1;
end
SE = strel('disk', 3, 0);
op = imopen(dil, SE);
clo = imclose(op, SE);
adaun = false(size(clo));
adaun(cc.PixelIdxList{1}) = true;
daundata = regionprops(cc,"all");
getFeature = daundata;
%daundata()
data = [getFeature.Area getFeature.MajorAxisLength getFeature.MinorAxisLength getFeature.Eccentricity getFeature.Perimeter];
disp (data)
hasil = predict(model,data);
disp(hasil(1));