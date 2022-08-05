%%
close all;clc;clear

%% Crop to 512 X 512
% crop label and raw individually
path='D:\Nati\gans\thermal\evol_e500\images\';
path_out='D:\Nati\gans\thermal\evol_e500\images_512\';

disp('start cropping')
tic()
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imds.Files)
    I = imread(imds.Files{i,1});
    In = I(:,1:512,:);
    imwrite(In,sprintf('%s/%d.png',path_out,i));
end

disp('end cropping')
toc()