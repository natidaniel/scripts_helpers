% crop from m-down

%%
close all;clc;clear

%% Crop to 512 X 640
% crop label and raw individually
%path='F:\thermal_day_elbit_data\day\labels\train\';
%path_out='F:\thermal_day_elbit_data\day_512\train_label\';
path='F:\Nati\Thermal\TestDrive\';
path_out='F:\Nati\Thermal\TestDriveCropped\';
splt = 5;

disp('start cropping')
tic()
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imds.Files)
    I = imread(imds.Files{i,1});
    [m,n,c] = size(I);
    fs1 = split(imds.Files(i),"\"); fs2 = split(fs1{splt,1},"."); filename = string(fs2{1});
    In = I(m/2-255:m/2+256,((n/2)-319):((n/2)+320),:);
    imwrite(In,sprintf('%s%s.png',path_out,filename));
end

disp('end cropping')
toc()