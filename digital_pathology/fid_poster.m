%% FID

% cleaning
clc;close all;clc

% input
imds1='F:\Nati\poster\lung\pix2pixhd_withAir_Cells\img';
imds2='F:\Nati\poster\lung\ours\test_latest\img';
imds3='F:\Nati\poster\lung\cyclegan\real_images';
imds4='F:\Nati\poster\lung\pix2pix_withAir_Cells\synth_images_cut';

% disp('Real VS. ours')
[FID_real_ours] = fid_run(imds3,imds2)
% disp('Real VS. HD')
[FID_real_HD] = fid_run(imds3,imds1)
% disp('HD VS. ours')
[FID_HD_ours] = fid_run(imds1,imds2)

%disp('P2P VS. REAL')
[FID_real_P2P] = fid_run(imds3,imds4)
% [FID] = fid_run(imds5,imds6)
% disp('Good vs Good image')
% [FID] = fid_run(imds1,imds3)
% disp('Bad vs Bad image')
% [FID] = fid_run(imds2,imds4)

%% 
function[FID]=fid_run(name1,name2)
    
    % Inputs: names of datastores
    % output: the Frechet Inception Distance

    %% load network
    net = inceptionv3();
    %net = resnet50;
    %% set up datastores
    imds1=imageDatastore(name1);
    imds2=imageDatastore(name2);
    %% extract features
    fvec1=get_net_features(imds1,net);
    fvec2=get_net_features(imds2,net);
    %% calculate FID
    FID = calc_fid(fvec1,fvec2);
end

function[fid]=calc_fid(a,b)
    m1=mean(a,1);
    m2=mean(b,1);
    ssdiff=sum((m1-m2).^2);
    s1=cov(a');
    s2=cov(b');
    smean=real(sqrtm(s1*s2));
    fid=ssdiff+trace(s1+s2-2*smean);
end

function[fvec]=get_net_features(imds1,net)
    % augment to match network size
    au1=augmentedImageDatastore([299,299],imds1);
    features1 = activations(net,au1,'avg_pool');
    fvec=squeeze(features1)';
end