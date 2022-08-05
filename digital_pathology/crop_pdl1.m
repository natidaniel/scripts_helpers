
%%
close all;clc;clear

%%
%splitn = 5;  % label
splitn = 6;  % img

%% Crop to 512 X 1024
% crop label and raw individually
%path='F:\Nati\Rambam\pix2pix_new_label\';
%path_label_out='F:\Nati\Rambam\pix2pix_new_cropped_label\';
path='F:\Nati\Rambam\test_gan_pdl1_batch2\img_p\';
path_label_out='F:\Nati\Rambam\pix2pix_new_img_and_label\test_img_p\';


disp('start cropping')
tic()
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imds.Files)
    I = imread(imds.Files{i,1});
    fs1 = split(imds.Files(i),"\"); fs2 = split(fs1{splitn,1},"."); cfs2 = fs2{1}; cfs2 = cfs2(1:(end-10)); filename = string(cfs2);
    In1 = I(:,1:900,:);
    imwrite(In1,sprintf('%s%s%s.png',path_label_out,filename,'_white_cells_noise'));
end

disp('end cropping')
toc()