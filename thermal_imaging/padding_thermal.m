% Thermal 399 to 512
%%
close all;clc;clear

%%
splitn = 5;

%% Crop to 512 X 640
% crop label and raw individually
path1='F:\thermal_day_elbit_data\night_399\train_label\';
path1_label_out='F:\thermal_day_elbit_data\night_399\train_label_nd_ours\';

disp('start padding')
tic()
imds = imageDatastore(path1,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imds.Files)
    L = imread(imds.Files{i,1});
    fs1 = split(imds.Files(i),"\"); fs2 = split(fs1{splitn,1},"."); filename = string(fs2{1});
    Ln = 19 * ones(512,1024);
    Ln(1:399,1:639)= L;
    Ln = uint8(Ln);
    imwrite(Ln,sprintf('%s%s.png',path1_label_out,filename));
end

disp('end padding')
toc()