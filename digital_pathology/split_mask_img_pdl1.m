%%
close all;clc;clear

%% init
splitn = 7;

%% Crop to 512 X 640
% crop label and raw individually
%path='F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all\';
%path_img_out='F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all_split\img\';
%path_label_out='F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all_split\mask\';

%path = 'F:\Nati\Thermal\655\655_run\test2\label2thermal_655_night\3\images\';
%path_img_out='F:\Nati\Thermal\655\655_run\test2\label2thermal_655_night\3\img\';
%path_label_out='F:\Nati\Thermal\655\655_run\test2\label2thermal_655_night\3\mask\';

%path = 'F:\thermal_day_elbit_data\nov21\4video\forsynt\res\images\';
%path_img_out='F:\thermal_day_elbit_data\nov21\4video\forsynt\res\img\';
%path_label_out='F:\thermal_day_elbit_data\nov21\4video\forsynt\res\mask\';


path = 'F:\Nati\poster\lung\pix2pixhd_withAir\images\';
path_img_out='F:\Nati\poster\lung\pix2pixhd_withAir\img\';
path_label_out='F:\Nati\poster\lung\pix2pixhd_withAir\mask\';


%path = 'F:\Nati\Rambam\test_gan_pdl1_batch2\oldmodel_padd\';
%path_img_out='F:\Nati\Rambam\test_gan_pdl1_batch2\img_p\';
%path_label_out='F:\Nati\Rambam\test_gan_pdl1_batch2\mask_p\';

%path = 'F:\Nati\Roche\Bad\';
%path_img_out='F:\Nati\4Ariel\Synthetic_Bad\Breast\img\';
%path_label_out='F:\Nati\4Ariel\Synthetic_Bad\Breast\mask\';



disp('start cropping')
tic()
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

for i =1:size(imds.Files)
    I = imread(imds.Files{i,1});
    fs1 = split(imds.Files(i),"\"); fs2 = split(fs1{splitn,1},"."); 
    cfs2 = fs2{1};
    In = I(:,1:640,:); %only for PDL1
    %In = I; % breast
    if mod(i,2) == 1
        %cfs2 = cfs2(1:(end-12)); 
        filename = string(cfs2);
        imwrite(In,sprintf('%s%s_%d.png',path_label_out,filename,i));
    else
        %cfs2 = cfs2(1:(end-18)); 
        filename = string(cfs2);
        imwrite(In,sprintf('%s%s_%d.png',path_img_out,filename,i));
    end
end

disp('end cropping')
toc()