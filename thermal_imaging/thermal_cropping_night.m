%%
close all;clc;clear

%%
isDay = 'TRUE';
if strcmp(isDay,'FALSE')
    splitn = 6;
else
    splitn = 7;
end

%% Crop to 512 X 640
% crop label and raw individually
path='F:\Nati\Thermal\day_test_w_padding\test_train_latest\images\';
path_img_out='F:\Nati\Thermal\4Tomer\day\cropped\img\';
path_label_out='F:\Nati\Thermal\4Tomer\day\cropped\label\';

disp('start cropping')
tic()
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imds.Files)
    I = imread(imds.Files{i,1});
    fs1 = split(imds.Files(i),"\"); fs2 = split(fs1{splitn,1},"."); filename = string(fs2{1});
    In = I(1:512,1:640,:);
    if mod(i,2) == 1
        imwrite(In,sprintf('%s%s.png',path_label_out,filename));
    else
        imwrite(In,sprintf('%s%s.png',path_img_out,filename));
    end
end

disp('end cropping')
toc()