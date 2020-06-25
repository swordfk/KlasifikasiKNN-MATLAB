a1 = imread('a1.jpg');
a2 = imread('a2.jpg');
a3 = imread('a3.jpg');
a4 = imread('a4.jpg');
a5 = imread('a5.jpg');
b1 = imread('b1.jpg');
b2 = imread('b2.jpg');
b3 = imread('b3.jpg');
b4 = imread('b4.jpg');
b5 = imread('b5.jpg');
c1 = imread('c1.jpg');
c2 = imread('c2.jpg');
c3 = imread('c3.jpg');
c4 = imread('c4.jpg');
c5 = imread('c5.jpg');
d1 = imread('d1.jpg');
d2 = imread('d2.jpg');
d3 = imread('d6.jpg');
d4 = imread('d4.jpg');
d5 = imread('d5.jpg');
e1 = imread('e1.jpg');
e2 = imread('e2.jpg');
e3 = imread('e3.jpg');
e4 = imread('e4.jpg');
e5 = imread('e5.jpg');
f1 = imread('f1.jpg');
f2 = imread('f2.jpg');
f3 = imread('f3.jpg');
f4 = imread('f4.jpg');
f5 = imread('f5.jpg');

%menampilkan gambar
%imshow([b1 b2 b3 b4 b5])
%imshow([c1 c2 c3 c4 c5])
%imshow([d3 d2])

%imshow([e1 e2 e3 e4 e5])
%imshow(d5);


%mengubah image menjadi grayscale
%Train daun A
grayA1 = rgb2gray(a1);
grayA3 = rgb2gray(a3);
grayA2 = rgb2gray(a2);
%Train daun B
grayB1 = rgb2gray(b1);
grayB3 = rgb2gray(b3);
grayB2 = rgb2gray(b2);
%Train daun C
grayC1 = rgb2gray(c1);
grayC3 = rgb2gray(c3);
grayC2 = rgb2gray(c2);
%Train daun D
grayD1 = rgb2gray(d1);
grayD3 = rgb2gray(d3);
grayD2 = rgb2gray(d2);
%Train daun E
grayE1 = rgb2gray(e1);
grayE3 = rgb2gray(e3);
grayE2 = rgb2gray(e2);
%Train Daun F
grayF1 = rgb2gray(f1);
grayF3 = rgb2gray(f3);
grayF2 = rgb2gray(f2);
%Menampilkan hasil dari grayscale image
%figure, imshow([grayA1 grayA2 grayA3]);

%Median filter
%train Daun A
mfA1 = medfilt2(grayA1, [5 5]);
mfA2 = medfilt2(grayA2, [5 5]);
mfA3 = medfilt2(grayA3, [5 5]);
%train Daun B
mfB1 = medfilt2(grayB1, [5 5]);
mfB2 = medfilt2(grayB2, [5 5]);
mfB3 = medfilt2(grayB3, [5 5]);
%train Daun C
mfC1 = medfilt2(grayC1, [5 5]);
mfC2 = medfilt2(grayC2, [5 5]);
mfC3 = medfilt2(grayC3, [5 5]);
%train Daun D
mfD1 = medfilt2(grayD1, [5 5]);
mfD2 = medfilt2(grayD2, [5 5]);
mfD3 = medfilt2(grayD3, [5 5]);
%train Daun E
mfE1 = medfilt2(grayE1, [5 5]);
mfE2 = medfilt2(grayE2, [5 5]);
mfE3 = medfilt2(grayE3, [5 5]);
%train Daun F
mfF1 = medfilt2(grayF1, [5 5]);
mfF2 = medfilt2(grayF2, [5 5]);
mfF3 = medfilt2(grayF3, [5 5]);

%menampilkan median filter dan membandingkan dengan grayscale
%figure, imshow([grayA1 mfA1 ]);
%figure, imshow([grayB2 mfB2 ]);

%Binary(Hitam putih)
%train Daun A
bwA1 = im2bw(mfA1);
bwA2 = im2bw(mfA2);
bwA3 = im2bw(mfA3);
%train Daun B
bwB1 = im2bw(mfB1);
bwB2 = im2bw(mfB2);
bwB3 = im2bw(mfB3);
%train Daun C
bwC1 = im2bw(mfC1);
bwC2 = im2bw(mfC2);
bwC3 = im2bw(mfC3);
%train Daub D
bwD1 = im2bw(mfD1);
bwD2 = im2bw(mfD2);
bwD3 = im2bw(mfD3);
%train Daun E
bwE1 = im2bw(mfE1);
bwE2 = im2bw(mfE2);
bwE3 = im2bw(mfE3);
%train Daun F
bwF1 = im2bw(mfF1);
bwF2 = im2bw(mfF2);
bwF3 = im2bw(mfF3);

%menampilkan binary
%figure, imshow(bwA1)
%figure, imshow([bwA1 bwA2 bwA3]);
%figure, imshow([bwB2 bwB3])

%erosi citra
SEdis1= strel('disk', 10, 0);
SEdis2= strel('disk', 5, 0 );
SEdis3= strel('disk', 1, 0);
%train Daun A
eroA1 = imerode(bwA1, SEdis2);
eroA2 = imerode(bwA2, SEdis2);
eroA3 = imerode (bwA3, SEdis3);
%train Daun B
eroB1 = imerode(bwB1, SEdis3);
eroB2 = imerode(bwB2, SEdis3);
eroB3 = imerode (bwB3, SEdis3);
%train Daun C
eroC1 = imerode(bwC1, SEdis3);
eroC2 = imerode(bwC2, SEdis3);
eroC3 = imerode (bwC3, SEdis3);
%train Daun D
eroD1 = imerode(bwD1, SEdis3);
eroD2 = imerode(bwD2, SEdis3);
eroD3 = imerode (bwD3, SEdis3);
%train Daun E
eroE1 = imerode(bwE1, SEdis2);
eroE2 = imerode(bwE2, SEdis3);
eroE3 = imerode (bwE3, SEdis3);
%train Daun F
eroF1 = imerode(bwF1, SEdis2);
eroF2 = imerode(bwF2, SEdis3);
eroF3 = imerode (bwF3, SEdis3);

%Menampilkan hasil erosi
%figure, imshow([eroA1]);
%figure, imshow([eroB1 eroB2 eroB3]);
%figure, imshow([eroC1 eroC2 eroC3]);
%figure, imshow([eroD1 eroD2 eroD3]);
%figure, imshow([eroE1 eroE2 eroE3]);

%Reverse citra
%Daun A
reA1 =  imcomplement(eroA1);
reA2 =  imcomplement(eroA2);
reA3 =  imcomplement(eroA3);
%Daun B
reB1 =  imcomplement(eroB1);
reB2 =  imcomplement(eroB2);
reB3 =  imcomplement(eroB3);
%Daun C
reC1 =  imcomplement(eroC1);
reC2 =  imcomplement(eroC2);
reC3 =  imcomplement(eroC3);
%Daun D 
reD1 =  imcomplement(eroD1);
reD2 =  imcomplement(eroD2);
reD3 =  imcomplement(eroD3);
%Daun E
reE1 =  imcomplement(eroE1);
reE2 =  imcomplement(eroE2);
reE3 =  imcomplement(eroE3);
%Daun F
reF1 =  imcomplement(eroF1);
reF2 =  imcomplement(eroF2);
reF3 =  imcomplement(eroF3);


%menampilkan hasil reverse
%figure, imshow([reA1]);

%Menampilkan setiap proses
%figure, imshow(reA1);
%figure, imshow(eroA1);
%figure, imshow(bwA1);
%figure, imshow(grayA1);
%figure, imshow(a1);

%Mndapatkan Fitur image
%ubah variabel pada fungsing bwconcomp
%dengan variabel hasil reverse image
cc = bwconncomp(reA1,4);
adaun(cc.PixelIdxList{1}) = true;
getFeature = regionprops(cc,'Area','MajorAxisLength','MinorAxisLength', 'Eccentricity','Perimeter');
disp(getFeature(3));
aa = struct2table(getFeature(3));
%filename = 'data_train.xlsx';
%writetable(aa,filename,'Sheet',1,'Range','A29');
