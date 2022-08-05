
%%
close all;clc;clear

%%
splitn = 6;  % img

%% Crop to 512 X 1024
% crop label and raw individually
path_img='F:\Nati\Roche\4Roche\images\';
path_img_masks='F:\Nati\Roche\4Roche\masks\';
path_img_s='F:\Nati\Roche\4Roche\selected\images\';
path_img_masks_s='F:\Nati\Roche\4Roche\selected\masks\';


disp('start selecting')
tic()
imdsI = imageDatastore(path_img,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
imdsM = imageDatastore(path_img_masks,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imdsI.Files)
    I = imread(imdsI.Files{i,1});
    M = imread(imdsM.Files{i,1});
    fs1 = split(imdsI.Files(i),"\"); fs2 = split(fs1{splitn,1},"."); cfs2 = fs2{1}; filename = string(cfs2);
    fig = figure;
    imshow(I)
    disp("save manually by the below command")
    %imwrite(I,sprintf('%s%s.png',path_img_s,filename));imwrite(M,sprintf('%s%s.png',path_img_masks_s,filename));
end

disp('end selecting')
toc()

