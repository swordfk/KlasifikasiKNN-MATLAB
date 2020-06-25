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
%menampilkan gambar
%imshow([b1 b2 b3 b4 b5])
%imshow([c1 c2 c3 c4 c5])
%imshow([d3 d2])

%rotasi gambar yang tidak sesuai
a5 = imrotate(a5,90,'bilinear');
d1 = imrotate(d1,90,'bilinear');
d3 = imrotate(d3,90,'bilinear');
d5 = imrotate(d5,90,'bilinear');
e1 = imrotate(e1,90,'bilinear');
e2 = imrotate(e2,90,'bilinear');
e3 = imrotate(e3,90,'bilinear');
e4 = imrotate(e4,90,'bilinear');
e5 = imrotate(e5,90,'bilinear');
%imshow([e1 e2 e3 e4 e5])
%imshow(d5);

%resize image menjadi 1000x1000
%a1 = imresize(a1, [1000 1000]);
%a2 = imresize(a2, [1000 1000]);
%a3 = imresize(a3, [1000 1000]);
%a4 = imresize(a4, [1000 1000]);
%a5 = imresize(a5, [1000 1000]);
%b1 = imresize(b1, [1000 1000]);
%b2 = imresize(b2, [1000 1000]);
%b3 = imresize(b3, [1000 1000]);
%b4 = imresize(b4, [1000 1000]);
%b5 = imresize(b5, [1000 1000]);
%c1 = imresize(c1, [1000 1000]);
%c2 = imresize(c2, [1000 1000]);
%c3 = imresize(c3, [1000 1000]);
%c4 = imresize(c4, [1000 1000]);
%c5 = imresize(c5, [1000 1000]);
%d1 = imresize(d1, [1000 1000]);
%d2 = imresize(d2, [1000 1000]);
%d3 = imresize(d3, [1000 1000]);
%d4 = imresize(d4, [1000 1000]);
%d5 = imresize(d5, [1000 1000]);
%e1 = imresize(e1, [1000 1000]);
%e2 = imresize(e2, [1000 1000]);
%e3 = imresize(e3, [1000 1000]);
%e4 = imresize(e4, [1000 1000]);
%e5 = imresize(e5, [1000 1000]);


%mengubah image menjadi grayscale
%Train
grayA1 = rgb2gray(a1);
grayA3 = rgb2gray(a3);
grayA2 = rgb2gray(a2);
%Test
grayA4 = rgb2gray(a4);
grayA5 = rgb2gray(a5);


%Menampilkan hasil dari grayscale image
%figure, imshow([grayA1 grayA2 grayA3]);

%Median filter
%train
mfA1 = medfilt2(grayA1, [5 5]);
mfA2 = medfilt2(grayA2, [5 5]);
mfA3 = medfilt2(grayA3, [5 5]);
%Test
mfA4 = medfilt2(grayA4, [5 5]);
mfA5 = medfilt2(grayA5, [5 5]);

%menampilkan median filter dan membandingkan dengan grayscale
%figure, imshow([grayA1 mfA1 ]);

%Binary(Hitam putih)
%train
bwA1 = im2bw(mfA1);
%imshow(bwA1)
bwA2 = im2bw(mfA2,115/255);
bwA3 = im2bw(mfA3,115/255);
%test
bwA4 = im2bw(mfA4,115/255);
bwA5 = im2bw(mfA5,115/255);

%menampilkan binary
%figure, imshow(bwA5)
%figure, imshow([bwA1 bwA2 bwA3 bwA4 bwA5]);
%imshow([bwA5 bwA4])
%erosi citra
SEdis1= strel('disk', 10);
SEdis2= strel('disk', 5);
SEdis3= strel('disk', 3);

%train
eroA1 = imerode(bwA1, SEdis2);
eroA2 = imerode(bwA2, SEdis3);
eroA3 = imerode (bwA3, SEdis3);
%Test


%Menampilkan hasil erosi
%figure, imshow([eroA1 eroA2 eroA3]);

%Reverse citra
reA1 =  imcomplement(eroA1);
reA2 =  imcomplement(eroA2);
reA3 =  imcomplement(eroA3);
%Test
reA4 = imcomplement(bwA4);
reA5 = imcomplement(bwA5);

%menampilkan hasil reverse
%figure, imshow([reA1 reA2 reA3 reA4 reA5]);

disp(stats)