a5 = imread('a5.jpg');
grayA5 = rgb2gray(a5);
mfA5 = medfilt2(grayA5, [5 5]);
bwA5 = im2bw(mfA5,115/255);
reA5 = imcomplement(bwA5);
sa5 = regionprops(reA1, 'all')
aa = struct2table(sa5);
disp(aa)