%% inceptionv3 & resnet-features

%% cleaning
clc;close all;clear
%% loading results

% Lung data results
path_lung_s_ours = 'F:\Nati\poster\lung\ours\test_latest\img\';
path_lung_s_pix2pixhd = 'F:\Nati\poster\lung\pix2pixhd\label2pdl1_nonoise\test_latest\img\';
path_lung_s_pix2pix = 'F:\Nati\poster\lung\pix2pix\synth_images\';
path_lung_s_cyclegan = 'F:\Nati\poster\lung\cyclegan\synth_images\';
path_lung_r = 'F:\Nati\poster\lung\cyclegan\real_images\';

% Breast data results
path_breast_s_ours = 'F:\Nati\poster\breast\ours\label2breast_512_white_cells_noise\test_latest\img\';
path_breast_s_pix2pixhd = 'F:\Nati\poster\breast\pix2pixhd\label2breast_512_nonoise\test_latest\img\';
path_breast_s_pix2pix = 'F:\Nati\poster\breast\pix2pix\synth_images\';
path_breast_s_cyclegan = 'F:\Nati\poster\breast\cyclegan\synth_images\';
path_breast_r = 'F:\Nati\poster\breast\cyclegan\real_images\';


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

imds_path_lung_s_pix2pixhd = imageDatastore(path_lung_s_pix2pixhd,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_s_pix2pixhd = augmentedImageDatastore([299,299],imds_path_lung_s_pix2pixhd);
fvec_inception_imds_path_lung_s_pix2pixhd = squeeze(activations(net_inception,au1_imds_path_lung_s_pix2pixhd,'avg_pool'))';
fvec_resnet_imds_path_lung_s_pix2pixhd = squeeze(activations(net_resnet,au1_imds_path_lung_s_pix2pixhd,'avg_pool'))';

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

imds_path_lung_r = imageDatastore(path_lung_r,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_lung_r = augmentedImageDatastore([299,299],imds_path_lung_r);
fvec_inception_imds_path_lung_r = squeeze(activations(net_inception,au1_imds_path_lung_r,'avg_pool'))';
fvec_resnet_imds_path_lung_r = squeeze(activations(net_resnet,au1_imds_path_lung_r,'avg_pool'))';

imds_path_breast_s_ours = imageDatastore(path_breast_s_ours,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_s_ours = augmentedImageDatastore([299,299],imds_path_breast_s_ours);
fvec_inception_imds_path_breast_s_ours = squeeze(activations(net_inception,au1_imds_path_breast_s_ours,'avg_pool'))';
fvec_resnet_imds_path_breast_s_ours = squeeze(activations(net_resnet,au1_imds_path_breast_s_ours,'avg_pool'))';

imds_path_breast_s_pix2pixhd = imageDatastore(path_breast_s_pix2pixhd,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_s_pix2pixhd = augmentedImageDatastore([299,299],imds_path_breast_s_pix2pixhd);
fvec_inception_imds_path_breast_s_pix2pixhd = squeeze(activations(net_inception,au1_imds_path_breast_s_pix2pixhd,'avg_pool'))';
fvec_resnet_imds_path_breast_s_pix2pixhd = squeeze(activations(net_resnet,au1_imds_path_breast_s_pix2pixhd,'avg_pool'))';

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

imds_path_breast_r = imageDatastore(path_breast_r,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
au1_imds_path_breast_r = augmentedImageDatastore([299,299],imds_path_breast_r);
fvec_inception_imds_path_breast_r = squeeze(activations(net_inception,au1_imds_path_breast_r,'avg_pool'))';
fvec_resnet_imds_path_breast_r = squeeze(activations(net_resnet,au1_imds_path_breast_r,'avg_pool'))';


%% Save
filename = 'poster.mat';
save(filename)