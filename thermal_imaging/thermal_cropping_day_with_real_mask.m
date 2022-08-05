%%
close all;clc;clear

%% init
%splitn = 10;
splitn = 9;

%% Crop to 512 X 640
% crop label and raw individually
%path='F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all\';
%path_img_out='F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all_split\img\';
%path_label_out='F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all_split\mask\';
%path = 'F:\Nati\Thermal\655\655_run\test2\label2thermal_655_night\3\images\';
%path_img_out='F:\Nati\Thermal\655\655_run\test2\label2thermal_655_night\3\img\';
%path_label_out='F:\Nati\Thermal\655\655_run\test2\label2thermal_655_night\3\mask\';

path = 'F:\Nati\Thermal\denovo\nd\output\test_latest2\images\';
path_img_out='F:\Nati\Thermal\denovo\nd\output\test_latest2\test_img\';
path_label_out='F:\Nati\Thermal\denovo\nd\output\test_latest2\test_mask\';



disp('start cropping')
tic()
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imds.Files)
    I = imread(imds.Files{i,1});
    fs1 = split(imds.Files(i),"\"); fs2 = split(fs1{splitn,1},"."); 
    cfs2 = fs2{1};
    In = I(1:512,1:640,:);
    if mod(i,2) == 1
        cfs2 = cfs2(1:(end-28)); filename = string(cfs2);
        imwrite(In,sprintf('%s%s.png',path_label_out,filename));
    else
        cfs2 = cfs2(1:(end-34)); filename = string(cfs2);
        imwrite(In,sprintf('%s%s.png',path_img_out,filename));
    end
end

disp('end cropping')
toc()