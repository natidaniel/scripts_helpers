%%
close all;clc;clear

%% Crop to 512 X 640
% crop label and raw individually
path='C:\Nati\GAN_Thermal\day_512_1024\train_img\';
path_out='C:\Nati\GAN_Thermal\day_512_1024\train_img\';

disp('start cropping')
tic()
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imds.Files)
    I = imread(imds.Files{i,1});
    fs1 = split(imds.Files(i),"\"); fs2 = split(fs1{6,1},"."); filename = string(fs2{1});
    In = I(1:512,1:640,:);
    imwrite(In,sprintf('%s%s.png',path_out,filename));
end

disp('end cropping')
toc()