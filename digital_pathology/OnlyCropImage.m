% PDL1 - cropp
%%
close all;clc;clear

%%
splitn = 6;

%% Crop to 512 X 640
% crop label and raw individually
path1='F:\Nati\poster\lung\r2\';
path1_label_out='F:\Nati\poster\lung\r2_cropped\';


disp('start cropping')
tic()
imds = imageDatastore(path1,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');


for i =1:size(imds.Files)
    I = imread(imds.Files{i,1});
    fs1 = split(imds.Files(i),"\"); fs2 = split(fs1{splitn,1},"."); filename = string(fs2{1});
    In = I(:,1:640,:);
    imwrite(In,sprintf('%s%s_%d.png',path1_label_out,filename,i));
end

disp('end cropping')
toc()