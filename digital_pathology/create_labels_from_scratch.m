
% PDL1 batch 3
%%
close all;clc;clear

%%
splitn = 8;

%% Crop to 512 X 640
% crop label and raw individually
path1='C:\Users\SavirLab\Desktop\Nati\debug\batch2_img\';
path1_label_out='C:\Users\SavirLab\Desktop\Nati\debug\batch2_label\';

disp('start padding')
tic()
imds = imageDatastore(path1,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imds.Files)
    L = imread(imds.Files{i,1});
    fs1 = split(imds.Files(i),"\"); fs2 = split(fs1{splitn,1},"."); filename = string(fs2{1});
    Ln = 0 * ones(512,1024);
    Ln = uint8(Ln);
    imwrite(Ln,sprintf('%s%s.png',path1_label_out,filename));
end

disp('end padding')
toc()

