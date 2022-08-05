% Roche BIF

%% Example 1
clc;close all;clear
filename1 = 'C:\Users\SavirLab\Downloads\VT0000194749_D113558_BC286_PDL1.bif';
imf1 = imfinfo(filename1);
disp(imf1(3).ImageDescription)
im1 = imread(imf1(3).Filename,3);
[m,n,c] = size(im1);
imshow(im1)
%zoom-in
imshow(im1(m/3:m/3+512,n/2:n/2+969,:))
imwrite(im1(m/3:m/3+512,n/2:n/2+969,:),'im1_roche.tif')
imwrite(im1(m/3:m/3+512,n/2:n/2+969,:),'im1_roche.png')


%% Example 2
clc;close all;clear
filename2 = 'C:\Users\SavirLab\Downloads\VT0000198794_D113558_BC295_PDL1.bif';
imf2 = imfinfo(filename2);
disp(imf2(3).ImageDescription)
im2 = imread(imf2(3).Filename,3);
[m,n,c] = size(im2);
imshow(im2)
%zoom-in
imshow(im2(m/3:m/3+512,n/2:n/2+895,:))
imwrite(im2(m/3:m/3+512,n/2:n/2+895,:),'im2_roche.tif')
imwrite(im2(m/3:m/3+512,n/2:n/2+895,:),'im2_roche.png')


%% Example 3
clc;close all;clear
filename3 = 'C:\Users\SavirLab\Downloads\VT0000126451_D113558_BC248_PDL1.bif';
imf3 = imfinfo(filename3);
disp(imf3(3).ImageDescription)
im3 = imread(imf3(3).Filename,3);
[m,n,c] = size(im3);
imshow(im3)
%zoom-in
imshow(im3(m/1.5:m/1.5+512,n/1.5:n/1.5+969,:))
imwrite(im3(m/1.5:m/1.5+512,n/1.5:n/1.5+969,:),'im3_roche.tif')
imwrite(im3(m/1.5:m/1.5+512,n/1.5:n/1.5+969,:),'im3_roche.png')


%% Example 4
clc;close all;clear
filename4 = 'C:\Users\SavirLab\Downloads\VT0000194767_D113558_BC143_PDL1.bif';
imf4 = imfinfo(filename4);
disp(imf4(3).ImageDescription)
im4 = imread(imf4(3).Filename,3);
[m,n,c] = size(im4);
imshow(im4)
%zoom-in
imshow(im4(m/3:m/3+512,n/2:n/2+895,:))
imwrite(im4(m/3:m/3+512,n/2:n/2+895,:),'im4_roche.tif')
imwrite(im4(m/3:m/3+512,n/2:n/2+895,:),'im4_roche.png')


%% Example 5
clc;close all;clear
filename5 = 'C:\Users\SavirLab\Downloads\VT0000131897_D113558_BC015_PDL1.bif';
imf5 = imfinfo(filename5);
disp(imf5(3).ImageDescription)
im5 = imread(imf5(3).Filename,3);
[m,n,c] = size(im5);
imshow(im5)
%zoom-in
imshow(im5(m/3:m/3+512,n/2:n/2+895,:))
imwrite(im5(m/3:m/3+512,n/2:n/2+895,:),'im5_roche.tif')
imwrite(im5(m/3:m/3+512,n/2:n/2+895,:),'im5_roche.png')
