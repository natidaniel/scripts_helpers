%%
close all;clc;clear

%% init
splitn = 7;

%% Crop to 399 X 639

path = 'F:\Nati\poster\thermal\ours_399\images\';
path_img_out='F:\Nati\poster\thermal\ours_399\img\';
path_label_out='F:\Nati\poster\thermal\ours_399\mask\';


%%
disp('start cropping')
tic()
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imds.Files)
    I = imread(imds.Files{i,1});
    fs1 = split(imds.Files(i),"\"); fs2 = split(fs1{splitn,1},"."); 
    cfs2 = fs2{1};
    In = I(1:399,1:639,:); 
    if mod(i,2) == 1
        filename = string(cfs2);
        imwrite(In,sprintf('%s%s_%d.png',path_label_out,filename,i));
    else
        filename = string(cfs2);
        imwrite(In,sprintf('%s%s_%d.png',path_img_out,filename,i));
    end
end

disp('end cropping')
toc()