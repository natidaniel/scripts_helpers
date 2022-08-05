% PDL1 - cropp
%%
close all;clc;clear

%%
splitn = 9;

%% Crop to 512 X 640
% crop label and raw individually
path1='C:\Users\SavirLab\Desktop\Nati\debug\batch3\pix2pix_label\';
path1_label_out='C:\Users\SavirLab\Desktop\Nati\debug\batch3\pix2pix_label_c\';
path2='C:\Users\SavirLab\Desktop\Nati\debug\batch3\pix2pix_img\';
path2_img_out='C:\Users\SavirLab\Desktop\Nati\debug\batch3\pix2pix_img_c\';
path3='C:\Users\SavirLab\Desktop\Nati\debug\batch3\pix2pix_color\';
path3_color_out='C:\Users\SavirLab\Desktop\Nati\debug\batch3\pix2pix_color_c\';

disp('start cropping')
tic()
imds = imageDatastore(path1,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds2 = imageDatastore(path2,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds3 = imageDatastore(path3,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imds.Files)
    L = imread(imds.Files{i,1});
    I = imread(imds2.Files{i,1});
    M = imread(imds3.Files{i,1});
    fs1 = split(imds.Files(i),"\"); fs2 = split(fs1{splitn,1},"."); filename = string(fs2{1});
    fs12 = split(imds2.Files(i),"\"); fs22 = split(fs12{splitn,1},"."); filename2 = string(fs22{1});
    fs122 = split(imds3.Files(i),"\"); fs222 = split(fs122{splitn,1},"."); filename22 = string(fs222{1});

    Ln1 = L(1:512,:,:);
    Ln2 = L(513:end,:,:);
    In1 = I(1:512,:,:);
    In2 = I(513:end,:,:);
    M1 = M(1:512,:,:);
    M2 = M(513:end,:,:);
    imwrite(Ln1,sprintf('%s%s%d.png',path1_label_out,filename,1));
    imwrite(Ln2,sprintf('%s%s%d.png',path1_label_out,filename,2));
    imwrite(In1,sprintf('%s%s%d.png',path2_img_out,filename,1));
    imwrite(In2,sprintf('%s%s%d.png',path2_img_out,filename,2));
    imwrite(M1,sprintf('%s%s%d.png',path3_color_out,filename,1));
    imwrite(M2,sprintf('%s%s%d.png',path3_color_out,filename,2));
end

disp('end cropping')
toc()