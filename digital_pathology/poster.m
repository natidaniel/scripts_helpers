%% inceptionv3 & resnet-features

%% cleaning
clc;close all;clear
%% loading results

% Lung data results
path_lung_s_ours = 'F:\Nati\poster\lung\ours\test_latest\img\';
path_lung_s_ours_with_preprocessing = 'F:\Nati\poster\lung\ours_withNoise\img\';
path_lung_s_ours_with_air_preprocessing = 'F:\Nati\poster\lung\pix2pixhd_withAir_Noise\img\';
path_lung_s_pix2pixhd = 'F:\Nati\poster\lung\pix2pixhd\label2pdl1_nonoise\test_latest\img\';
path_lung_s_pix2pixhd_with_prelabeling = 'F:\Nati\poster\lung\pix2pixhd_withAir_Cells\img\';
path_lung_s_pix2pixhd_with_air = 'F:\Nati\poster\lung\pix2pixhd_withAir\img\';
path_lung_s_pix2pix = 'F:\Nati\poster\lung\pix2pix\synth_images\';
path_lung_s_pix2pix_with_prelabeling = 'F:\Nati\poster\lung\pix2pix_withAir_Cells\synth_images_cut\';
path_lung_s_cyclegan = 'F:\Nati\poster\lung\cyclegan\synth_images\';
path_lung_s_cyclegan_with_prelabeling = 'F:\Nati\poster\lung\cyclegan_withAir_Cells\synth_images_cut\';
path_lung_r = 'F:\Nati\poster\lung\cyclegan\real_images\';
path_lung_r2 = 'F:\Nati\poster\lung\r2\';

% Breast data results
path_breast_s_ours = 'F:\Nati\poster\breast\ours\label2breast_512_white_cells_noise\test_latest\img\';
path_breast_s_ours_with_preprocessing = 'F:\Nati\poster\breast\ours_withNoise\test_latest\img\';
path_breast_s_pix2pixhd = 'F:\Nati\poster\breast\pix2pixhd\label2breast_512_nonoise\test_latest\img\';
path_breast_s_pix2pixhd_with_prelabeling = 'F:\Nati\poster\breast\pix2pixhd_withAir_Cells\img\';
path_breast_s_pix2pix = 'F:\Nati\poster\breast\pix2pix\synth_images\';
path_breast_s_pix2pix_with_prelabeling = 'F:\Nati\poster\breast\pix2pix_withAir_Cells\synth_images\';
path_breast_s_cyclegan = 'F:\Nati\poster\breast\cyclegan\synth_images\';
path_breast_s_cyclegan_with_prelabeling = 'F:\Nati\poster\breast\cyclegan_withAir_Cells\synth_images\';
path_breast_r = 'F:\Nati\poster\breast\cyclegan\real_images\';
path_breast_r2 = 'F:\Nati\poster\breast\r2\';


%% Deep networks
net_inception = inceptionv3();
net_resnet = resnet50;

%% Create datastores and features
imds_path_lung_s_ours = imageDatastore(path_lung_s_ours,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_s_ours = augmentedImageDatastore([299,299],imds_path_lung_s_ours);
fvec_inception_imds_path_lung_s_ours = squeeze(activations(net_inception,au1_imds_path_lung_s_ours,'avg_pool'))';
fvec_resnet_imds_path_lung_s_ours = squeeze(activations(net_resnet,au1_imds_path_lung_s_ours,'avg_pool'))';

imds_path_lung_s_ours_with_preprocessing = imageDatastore(path_lung_s_ours_with_preprocessing,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_s_ours_with_preprocessing = augmentedImageDatastore([299,299],imds_path_lung_s_ours_with_preprocessing);
fvec_inception_imds_path_lung_s_ours_with_preprocessing = squeeze(activations(net_inception,au1_imds_path_lung_s_ours_with_preprocessing,'avg_pool'))';
fvec_resnet_imds_path_lung_s_ours_with_preprocessing = squeeze(activations(net_resnet,au1_imds_path_lung_s_ours_with_preprocessing,'avg_pool'))';

imds_path_lung_s_ours_with_air_preprocessing = imageDatastore(path_lung_s_ours_with_air_preprocessing,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_s_ours_with_air_preprocessing = augmentedImageDatastore([299,299],imds_path_lung_s_ours_with_air_preprocessing);
fvec_inception_imds_path_lung_s_ours_with_air_preprocessing = squeeze(activations(net_inception,au1_imds_path_lung_s_ours_with_air_preprocessing,'avg_pool'))';
fvec_resnet_imds_path_lung_s_ours_with_air_preprocessing = squeeze(activations(net_resnet,au1_imds_path_lung_s_ours_with_air_preprocessing,'avg_pool'))';

imds_path_lung_s_pix2pixhd = imageDatastore(path_lung_s_pix2pixhd,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_s_pix2pixhd = augmentedImageDatastore([299,299],imds_path_lung_s_pix2pixhd);
fvec_inception_imds_path_lung_s_pix2pixhd = squeeze(activations(net_inception,au1_imds_path_lung_s_pix2pixhd,'avg_pool'))';
fvec_resnet_imds_path_lung_s_pix2pixhd = squeeze(activations(net_resnet,au1_imds_path_lung_s_pix2pixhd,'avg_pool'))';

imds_path_lung_s_pix2pixhd_with_prelabeling = imageDatastore(path_lung_s_pix2pixhd_with_prelabeling,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_s_pix2pixhd_with_prelabeling = augmentedImageDatastore([299,299],imds_path_lung_s_pix2pixhd_with_prelabeling);
fvec_inception_imds_path_lung_s_pix2pixhd_with_prelabeling = squeeze(activations(net_inception,au1_imds_path_lung_s_pix2pixhd_with_prelabeling,'avg_pool'))';
fvec_resnet_imds_path_lung_s_pix2pixhd_with_prelabeling = squeeze(activations(net_resnet,au1_imds_path_lung_s_pix2pixhd_with_prelabeling,'avg_pool'))';

imds_path_lung_s_pix2pixhd_with_air = imageDatastore(path_lung_s_pix2pixhd_with_air,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_s_pix2pixhd_with_air = augmentedImageDatastore([299,299],imds_path_lung_s_pix2pixhd_with_air);
fvec_inception_imds_path_lung_s_pix2pixhd_with_air = squeeze(activations(net_inception,au1_imds_path_lung_s_pix2pixhd_with_air,'avg_pool'))';
fvec_resnet_imds_path_lung_s_pix2pixhd_with_air = squeeze(activations(net_resnet,au1_imds_path_lung_s_pix2pixhd_with_air,'avg_pool'))';

imds_path_lung_s_pix2pix = imageDatastore(path_lung_s_pix2pix,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_s_pix2pix = augmentedImageDatastore([299,299],imds_path_lung_s_pix2pix);
fvec_inception_imds_path_lung_s_pix2pix = squeeze(activations(net_inception,au1_imds_path_lung_s_pix2pix,'avg_pool'))';
fvec_resnet_imds_path_lung_s_pix2pix = squeeze(activations(net_resnet,au1_imds_path_lung_s_pix2pix,'avg_pool'))';

imds_path_lung_s_cyclegan = imageDatastore(path_lung_s_cyclegan,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_s_cyclegan = augmentedImageDatastore([299,299],imds_path_lung_s_cyclegan);
fvec_inception_imds_path_lung_s_cyclegan = squeeze(activations(net_inception,au1_imds_path_lung_s_cyclegan,'avg_pool'))';
fvec_resnet_imds_path_lung_s_cyclegan = squeeze(activations(net_resnet,au1_imds_path_lung_s_cyclegan,'avg_pool'))';

imds_path_lung_s_pix2pix_with_prelabeling = imageDatastore(path_lung_s_pix2pix_with_prelabeling,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_s_pix2pix_with_prelabeling = augmentedImageDatastore([299,299],imds_path_lung_s_pix2pix_with_prelabeling);
fvec_inception_imds_path_lung_s_pix2pix_with_prelabeling = squeeze(activations(net_inception,au1_imds_path_lung_s_pix2pix_with_prelabeling,'avg_pool'))';
fvec_resnet_imds_path_lung_s_pix2pix_with_prelabeling = squeeze(activations(net_resnet,au1_imds_path_lung_s_pix2pix_with_prelabeling,'avg_pool'))';

imds_path_lung_s_cyclegan_with_prelabeling = imageDatastore(path_lung_s_cyclegan_with_prelabeling,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_s_cyclegan_with_prelabeling = augmentedImageDatastore([299,299],imds_path_lung_s_cyclegan_with_prelabeling);
fvec_inception_imds_path_lung_s_cyclegan_with_prelabeling = squeeze(activations(net_inception,au1_imds_path_lung_s_cyclegan_with_prelabeling,'avg_pool'))';
fvec_resnet_imds_path_lung_s_cyclegan_with_prelabeling = squeeze(activations(net_resnet,au1_imds_path_lung_s_cyclegan_with_prelabeling,'avg_pool'))';

imds_path_lung_r = imageDatastore(path_lung_r,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_r = augmentedImageDatastore([299,299],imds_path_lung_r);
fvec_inception_imds_path_lung_r = squeeze(activations(net_inception,au1_imds_path_lung_r,'avg_pool'))';
fvec_resnet_imds_path_lung_r = squeeze(activations(net_resnet,au1_imds_path_lung_r,'avg_pool'))';

imds_path_lung_r2 = imageDatastore(path_lung_r2,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_r2 = augmentedImageDatastore([299,299],imds_path_lung_r2);
fvec_inception_imds_path_lung_r2 = squeeze(activations(net_inception,au1_imds_path_lung_r2,'avg_pool'))';
fvec_resnet_imds_path_lung_r2 = squeeze(activations(net_resnet,au1_imds_path_lung_r2,'avg_pool'))';

imds_path_breast_s_ours = imageDatastore(path_breast_s_ours,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_s_ours = augmentedImageDatastore([299,299],imds_path_breast_s_ours);
fvec_inception_imds_path_breast_s_ours = squeeze(activations(net_inception,au1_imds_path_breast_s_ours,'avg_pool'))';
fvec_resnet_imds_path_breast_s_ours = squeeze(activations(net_resnet,au1_imds_path_breast_s_ours,'avg_pool'))';

imds_path_breast_s_ours_with_preprocessing = imageDatastore(path_breast_s_ours_with_preprocessing,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_s_ours_with_preprocessing = augmentedImageDatastore([299,299],imds_path_breast_s_ours_with_preprocessing);
fvec_inception_imds_path_breast_s_ours_with_preprocessing = squeeze(activations(net_inception,au1_imds_path_breast_s_ours_with_preprocessing,'avg_pool'))';
fvec_resnet_imds_path_breast_s_ours_with_preprocessing = squeeze(activations(net_resnet,au1_imds_path_breast_s_ours_with_preprocessing,'avg_pool'))';

imds_path_breast_s_pix2pixhd = imageDatastore(path_breast_s_pix2pixhd,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_s_pix2pixhd = augmentedImageDatastore([299,299],imds_path_breast_s_pix2pixhd);
fvec_inception_imds_path_breast_s_pix2pixhd = squeeze(activations(net_inception,au1_imds_path_breast_s_pix2pixhd,'avg_pool'))';
fvec_resnet_imds_path_breast_s_pix2pixhd = squeeze(activations(net_resnet,au1_imds_path_breast_s_pix2pixhd,'avg_pool'))';

imds_path_breast_s_pix2pixhd_with_prelabeling = imageDatastore(path_breast_s_pix2pixhd_with_prelabeling,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_s_pix2pixhd_with_prelabeling = augmentedImageDatastore([299,299],imds_path_breast_s_pix2pixhd_with_prelabeling);
fvec_inception_imds_path_breast_s_pix2pixhd_with_prelabeling = squeeze(activations(net_inception,au1_imds_path_breast_s_pix2pixhd_with_prelabeling,'avg_pool'))';
fvec_resnet_imds_path_breast_s_pix2pixhd_with_prelabeling = squeeze(activations(net_resnet,au1_imds_path_breast_s_pix2pixhd_with_prelabeling,'avg_pool'))';

imds_path_breast_s_pix2pix = imageDatastore(path_breast_s_pix2pix,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_s_pix2pix = augmentedImageDatastore([299,299],imds_path_breast_s_pix2pix);
fvec_inception_imds_path_breast_s_pix2pix = squeeze(activations(net_inception,au1_imds_path_breast_s_pix2pix,'avg_pool'))';
fvec_resnet_imds_path_breast_s_pix2pix = squeeze(activations(net_resnet,au1_imds_path_breast_s_pix2pix,'avg_pool'))';

imds_path_breast_s_cyclegan = imageDatastore(path_breast_s_cyclegan,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_s_cyclegan = augmentedImageDatastore([299,299],imds_path_breast_s_cyclegan);
fvec_inception_imds_path_breast_s_cyclegan = squeeze(activations(net_inception,au1_imds_path_breast_s_cyclegan,'avg_pool'))';
fvec_resnet_imds_path_breast_s_cyclegan = squeeze(activations(net_resnet,au1_imds_path_breast_s_cyclegan,'avg_pool'))';

imds_path_breast_s_pix2pix_with_prelabeling = imageDatastore(path_breast_s_pix2pix_with_prelabeling,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_s_pix2pix_with_prelabeling = augmentedImageDatastore([299,299],imds_path_breast_s_pix2pix_with_prelabeling);
fvec_inception_imds_path_breast_s_pix2pix_with_prelabeling = squeeze(activations(net_inception,au1_imds_path_breast_s_pix2pix_with_prelabeling,'avg_pool'))';
fvec_resnet_imds_path_breast_s_pix2pix_with_prelabeling = squeeze(activations(net_resnet,au1_imds_path_breast_s_pix2pix_with_prelabeling,'avg_pool'))';

imds_path_breast_s_cyclegan_with_prelabeling = imageDatastore(path_breast_s_cyclegan_with_prelabeling,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_s_cyclegan_with_prelabeling = augmentedImageDatastore([299,299],imds_path_breast_s_cyclegan_with_prelabeling);
fvec_inception_imds_path_breast_s_cyclegan_with_prelabeling = squeeze(activations(net_inception,au1_imds_path_breast_s_cyclegan_with_prelabeling,'avg_pool'))';
fvec_resnet_imds_path_breast_s_cyclegan_with_prelabeling = squeeze(activations(net_resnet,au1_imds_path_breast_s_cyclegan_with_prelabeling,'avg_pool'))';

imds_path_breast_r = imageDatastore(path_breast_r,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_r = augmentedImageDatastore([299,299],imds_path_breast_r);
fvec_inception_imds_path_breast_r = squeeze(activations(net_inception,au1_imds_path_breast_r,'avg_pool'))';
fvec_resnet_imds_path_breast_r = squeeze(activations(net_resnet,au1_imds_path_breast_r,'avg_pool'))';

imds_path_breast_r2 = imageDatastore(path_breast_r2,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_r2 = augmentedImageDatastore([299,299],imds_path_breast_r2);
fvec_inception_imds_path_breast_r2 = squeeze(activations(net_inception,au1_imds_path_breast_r2,'avg_pool'))';
fvec_resnet_imds_path_breast_r2 = squeeze(activations(net_resnet,au1_imds_path_breast_r2,'avg_pool'))';

%% Save
filename = 'poster.mat';
save(filename)


%% Analyze dist
% Lung

[lung_len,~] = size(fvec_inception_imds_path_lung_r);
lung_dist_inception_r_our = [];
lung_dist_inception_r_hd = [];
lung_dist_resnet_r_our = [];
lung_dist_resnet_r_hd = [];
for i=1:lung_len
    lung_dist_inception_r_our = [lung_dist_inception_r_our, sum(abs(fvec_inception_imds_path_lung_s_ours(i,:)-fvec_inception_imds_path_lung_r(i,:)))];
    lung_dist_inception_r_hd = [lung_dist_inception_r_hd, sum(abs(fvec_inception_imds_path_lung_s_pix2pixhd_with_prelabeling(i,:)-fvec_inception_imds_path_lung_r(i,:)))];
    lung_dist_resnet_r_our = [lung_dist_resnet_r_our, sum(abs(fvec_resnet_imds_path_lung_s_ours(i,:)-fvec_resnet_imds_path_lung_r(i,:)))];
    lung_dist_resnet_r_hd = [lung_dist_resnet_r_hd, sum(abs(fvec_resnet_imds_path_lung_s_pix2pixhd_with_prelabeling(i,:)-fvec_resnet_imds_path_lung_r(i,:)))];
end


% scatter ours vs hd 
scatter(lung_dist_inception_r_our, lung_dist_inception_r_hd)
refline(1,0)
xlabel('ours')
ylabel('hd')
title('inception |ours-real| vs. |hd-real|')


% lung_deltaD_inception = abs(lung_dist_inception_r_our-lung_dist_inception_r_hd);
% lung_deltaD_resnet = abs(lung_dist_resnet_r_our-lung_dist_resnet_r_hd);
lung_ratio_inception = abs(lung_dist_inception_r_our./lung_dist_inception_r_hd);
lung_ratio_resnet = abs(lung_dist_resnet_r_our./lung_dist_resnet_r_hd);


% find images in tail of distribution
inception_outliers = [];
resnet_outliers = [];
hd_wins = [];
ours_wins = [];

for i=1:lung_len
    if lung_ratio_inception(i) >= 1.2
        inception_outliers = [inception_outliers, A(i)];
%         if lung_dist_inception_r_our(i) > lung_dist_inception_r_hd(i)
%             hd_wins = [hd_wins ,A(i)];
%         else
%             ours_wins = [ours_wins ,A(i)];
%         end
        
    end
    if lung_ratio_resnet(i) >= 1.2
        resnet_outliers = [resnet_outliers, A(i)];
%         if lung_dist_resnet_r_our(i) > lung_dist_resnet_r_hd(i)
%             hd_wins = [hd_wins ,A(i)];
%         else
%             ours_wins = [ours_wins ,A(i)];
%         end
    end
    
end


% % plot histograms for 
% histogram(lung_dist_inception_r_our)
% hold on
% histogram(lung_dist_inception_r_hd)
% legend('our','hd')



% plot histograms for 
histogram(lung_ratio_inception)
hold on
histogram(lung_ratio_resnet)
legend('inception','resnet')



% Breast
[breast_len,~] = size(fvec_inception_imds_path_breast_r);
breast_dist_inception_r_our = [];
breast_dist_inception_r_hd = [];
breast_dist_resnet_r_our = [];
breast_dist_resnet_r_hd = [];
for i=1:breast_len
    breast_dist_inception_r_our = [breast_dist_inception_r_our, sum(abs(fvec_inception_imds_path_breast_s_ours(i,:)-fvec_inception_imds_path_breast_r(i,:)))];
    breast_dist_inception_r_hd = [breast_dist_inception_r_hd, sum(abs(fvec_inception_imds_path_breast_s_pix2pixhd_with_prelabeling(i,:)-fvec_inception_imds_path_breast_r(i,:)))];
    breast_dist_resnet_r_our = [breast_dist_resnet_r_our, sum(abs(fvec_resnet_imds_path_breast_s_ours(i,:)-fvec_resnet_imds_path_breast_r(i,:)))];
    breast_dist_resnet_r_hd = [breast_dist_resnet_r_hd, sum(abs(fvec_resnet_imds_path_breast_s_pix2pixhd_with_prelabeling(i,:)-fvec_resnet_imds_path_breast_r(i,:)))];
end

breast_deltaD_inception = abs(breast_dist_inception_r_our-breast_dist_inception_r_hd);
breast_deltaD_resnet = abs(breast_dist_resnet_r_our-breast_dist_resnet_r_hd);



% scatter ours vs hd 
scatter(breast_dist_inception_r_our, breast_dist_inception_r_hd)
refline(1,0)
xlabel('ours')
ylabel('hd')
title('inception |ours-real| vs. |hd-real|')



% find images in tail of distribution
inception_outliers = [];
resnet_outliers = [];
hd_wins = [];
ours_wins = [];

for i=1:breast_len
    if breast_deltaD_inception(i) >= 40
        inception_outliers = [inception_outliers, B(i)];
        if breast_dist_inception_r_our(i) > breast_dist_inception_r_hd(i)
            hd_wins = [hd_wins ,B(i)];
        else
            ours_wins = [ours_wins ,B(i)];
        end
        
    end
    if breast_deltaD_resnet(i) >= 40
        resnet_outliers = [resnet_outliers, B(i)];
        if breast_dist_resnet_r_our(i) > breast_dist_resnet_r_hd(i)
            hd_wins = [hd_wins ,B(i)];
        else
            ours_wins = [ours_wins ,B(i)];
        end
    end
    
end

% plot histograms for 
histogram(breast_deltaD_inception)
hold on
histogram(breast_deltaD_resnet)
legend('inception','resnet')
