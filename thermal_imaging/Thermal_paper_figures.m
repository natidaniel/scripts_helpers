%% Thermal paper

%% cleaning
clc;close all;clear


%% Init 
% general
warning('off','all')
fig_n = 1; 
% Deep networks
net_inception = inceptionv3();
net_resnet = resnet50;


%% load data
path_thermal_r = 'F:\Nati\poster\thermal\org_img\';
path_thermal_s_p2p = 'F:\Nati\poster\thermal\pix2pix\fake_images\';
path_thermal_s_hd = 'F:\Nati\poster\thermal\pix2pixhd\label2thermal_512_night_paper\399\test_latest\img\';
path_thermal_s_cg = 'F:\Nati\poster\thermal\cyclegan\fake_images\';
path_thermal_s_ours_3 = 'F:\Nati\poster\thermal\ours\ours_3\img\';
path_thermal_s_ours_9 = 'F:\Nati\poster\thermal\ours\ours_9\img\';
path_thermal_s_ours_15 = 'F:\Nati\poster\thermal\ours\ours_15\img\';
path_thermal_s_ours_30 = 'F:\Nati\poster\thermal\ours\ours_30\img\';
path_thermal_s_ours_60 = 'F:\Nati\poster\thermal\ours\ours_60\img\';
path_thermal_s_ours_90 = 'F:\Nati\poster\thermal\ours\ours_90\img\';
path_thermal_s_ours_120 = 'F:\Nati\poster\thermal\ours\ours_120\img\';
path_thermal_s_ours_150 = 'F:\Nati\poster\thermal\ours\ours_150\img\';
path_thermal_s_ours_200 = 'F:\Nati\poster\thermal\ours\ours_200\img\';
path_thermal_s_ours_250 = 'F:\Nati\poster\thermal\ours\ours_250\img\';
path_thermal_s_ours_300 = 'F:\Nati\poster\thermal\ours\ours_300\img\';
path_thermal_s_ours_350 = 'F:\Nati\poster\thermal\ours\ours_350\img\';
path_thermal_s_ours_399 = 'F:\Nati\poster\thermal\ours\ours_399\img\';

%% Create datastores
imds_path_thermal_r = imageDatastore(path_thermal_r,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_p2p = imageDatastore(path_thermal_s_p2p,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_hd = imageDatastore(path_thermal_s_hd,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_cg = imageDatastore(path_thermal_s_cg,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

% ours
imds_path_thermal_s_ours_3 = imageDatastore(path_thermal_s_ours_3,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_9 = imageDatastore(path_thermal_s_ours_9,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_15 = imageDatastore(path_thermal_s_ours_15,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_30 = imageDatastore(path_thermal_s_ours_30,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_60 = imageDatastore(path_thermal_s_ours_60,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_90 = imageDatastore(path_thermal_s_ours_90,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_120 = imageDatastore(path_thermal_s_ours_120,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_150 = imageDatastore(path_thermal_s_ours_150,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_200 = imageDatastore(path_thermal_s_ours_200,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_250 = imageDatastore(path_thermal_s_ours_250,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_300 = imageDatastore(path_thermal_s_ours_300,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_350 = imageDatastore(path_thermal_s_ours_350,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

imds_path_thermal_s_ours_399 = imageDatastore(path_thermal_s_ours_399,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

%% Extract features
au1_imds_path_thermal_r = augmentedImageDatastore([299,299],imds_path_thermal_r);
fvec_inception_imds_path_thermal_r = squeeze(activations(net_inception,au1_imds_path_thermal_r,'avg_pool'))';
fvec_resnet_imds_path_thermal_r = squeeze(activations(net_resnet,au1_imds_path_thermal_r,'avg_pool'))';

au1_imds_path_thermal_s_p2p = augmentedImageDatastore([299,299],imds_path_thermal_s_p2p);
fvec_inception_imds_path_thermal_s_p2p = squeeze(activations(net_inception,au1_imds_path_thermal_s_p2p,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_p2p = squeeze(activations(net_resnet,au1_imds_path_thermal_s_p2p,'avg_pool'))';

au1_imds_path_thermal_s_hd = augmentedImageDatastore([299,299],imds_path_thermal_s_hd);
fvec_inception_imds_path_thermal_s_hd = squeeze(activations(net_inception,au1_imds_path_thermal_s_hd,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_hd = squeeze(activations(net_resnet,au1_imds_path_thermal_s_hd,'avg_pool'))';

au1_imds_path_thermal_s_cg = augmentedImageDatastore([299,299],imds_path_thermal_s_cg);
fvec_inception_imds_path_thermal_s_cg = squeeze(activations(net_inception,au1_imds_path_thermal_s_cg,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_cg = squeeze(activations(net_resnet,au1_imds_path_thermal_s_cg,'avg_pool'))';

au1_imds_path_thermal_s_ours_3 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_3);
fvec_inception_imds_path_thermal_s_ours_3 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_3,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_3 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_3,'avg_pool'))';

au1_imds_path_thermal_s_ours_9 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_9);
fvec_inception_imds_path_thermal_s_ours_9 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_9,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_9 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_9,'avg_pool'))';

au1_imds_path_thermal_s_ours_15 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_15);
fvec_inception_imds_path_thermal_s_ours_15 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_15,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_15 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_15,'avg_pool'))';

au1_imds_path_thermal_s_ours_30 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_30);
fvec_inception_imds_path_thermal_s_ours_30 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_30,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_30 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_30,'avg_pool'))';

au1_imds_path_thermal_s_ours_60 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_60);
fvec_inception_imds_path_thermal_s_ours_60 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_60,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_60 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_60,'avg_pool'))';

au1_imds_path_thermal_s_ours_90 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_90);
fvec_inception_imds_path_thermal_s_ours_90 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_90,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_90 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_90,'avg_pool'))';

au1_imds_path_thermal_s_ours_120 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_120);
fvec_inception_imds_path_thermal_s_ours_120 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_120,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_120 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_120,'avg_pool'))';

au1_imds_path_thermal_s_ours_150 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_150);
fvec_inception_imds_path_thermal_s_ours_150 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_150,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_150 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_150,'avg_pool'))';

au1_imds_path_thermal_s_ours_200 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_200);
fvec_inception_imds_path_thermal_s_ours_200 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_200,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_200 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_200,'avg_pool'))';

au1_imds_path_thermal_s_ours_250 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_250);
fvec_inception_imds_path_thermal_s_ours_250 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_250,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_250 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_250,'avg_pool'))';

au1_imds_path_thermal_s_ours_300 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_300);
fvec_inception_imds_path_thermal_s_ours_300 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_300,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_300 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_300,'avg_pool'))';

au1_imds_path_thermal_s_ours_350 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_350);
fvec_inception_imds_path_thermal_s_ours_350 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_350,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_350 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_350,'avg_pool'))';

au1_imds_path_thermal_s_ours_399 = augmentedImageDatastore([299,299],imds_path_thermal_s_ours_399);
fvec_inception_imds_path_thermal_s_ours_399 = squeeze(activations(net_inception,au1_imds_path_thermal_s_ours_399,'avg_pool'))';
fvec_resnet_imds_path_thermal_s_ours_399 = squeeze(activations(net_resnet,au1_imds_path_thermal_s_ours_399,'avg_pool'))';

%% Save data
filename = 'thermal_paper_data.mat';
save(filename)

%% FID : 2 views
fid_r_ours = [];

data_real_fvec_inception = fvec_inception_imds_path_thermal_r;
data_fvec_inception{1} = fvec_inception_imds_path_thermal_s_ours_3;
data_fvec_inception{2} = fvec_inception_imds_path_thermal_s_ours_9;
data_fvec_inception{3} = fvec_inception_imds_path_thermal_s_ours_15;
data_fvec_inception{4} = fvec_inception_imds_path_thermal_s_ours_30;
data_fvec_inception{5} = fvec_inception_imds_path_thermal_s_ours_60;
data_fvec_inception{6} = fvec_inception_imds_path_thermal_s_ours_90;
data_fvec_inception{7} = fvec_inception_imds_path_thermal_s_ours_120;
data_fvec_inception{8} = fvec_inception_imds_path_thermal_s_ours_150;
data_fvec_inception{9} = fvec_inception_imds_path_thermal_s_ours_200;
data_fvec_inception{10} = fvec_inception_imds_path_thermal_s_ours_250;
data_fvec_inception{11} = fvec_inception_imds_path_thermal_s_ours_300;
data_fvec_inception{12} = fvec_inception_imds_path_thermal_s_ours_350;
data_fvec_inception{13} = fvec_inception_imds_path_thermal_s_ours_399;

% calculate noise == 0
% define variables
a = data_real_fvec_inception;
b = fvec_inception_imds_path_thermal_s_hd;
% calculate fid between feature vectors
m1 = mean(a,1);
m2 = mean(b,1);
ssdiff = sum((m1-m2).^2);
s1 = cov(a');
s2 = cov(b');
smean = real(sqrtm(s1*s2));
fid_v = ssdiff+trace(s1+s2-2*smean);
fid_r_ours = [fid_r_ours; fid_v];

for i=1:length(data_fvec_inception)
    % define variables
    a = data_real_fvec_inception;
    b = data_fvec_inception{i};
    % calculate fid between feature vectors
    m1 = mean(a,1);
    m2 = mean(b,1);
    ssdiff = sum((m1-m2).^2);
    s1 = cov(a');
    s2 = cov(b');
    smean = real(sqrtm(s1*s2));
    fid_v = ssdiff+trace(s1+s2-2*smean);
    fid_r_ours = [fid_r_ours; fid_v];
end

% plot fid 1
figure(fig_n);
name_2_noise_models = {'noise==0','noise==3','noise==9','noise==15', ...
    'noise==30','noise==60','noise==90','noise==120', ...
    'noise==150','noise==200','noise==250','noise==300', ...
    'noise==350','noise==399'};
xt = [1:14];
plot(fid_r_ours,'--r*')
Set_fig_YS(gca,8,10,8)
set(gca,'xtick',xt,'xticklabel',name_2_noise_models)
set(gca,'XTickLabelRotation',-30)
ylabel('FID values')
xlabel('DIfferent noise configutation models')
fig_n = fig_n + 1;



fid_real_vs_others = [];

% disp('Real VS. ours')
a = fvec_inception_imds_path_thermal_r;
b = fvec_inception_imds_path_thermal_s_ours_9;
m1 = mean(a,1);
m2 = mean(b,1);
ssdiff = sum((m1-m2).^2);
s1 = cov(a');
s2 = cov(b');
smean = real(sqrtm(s1*s2));
FID_real_OURS = ssdiff+trace(s1+s2-2*smean);
fid_real_vs_others = [fid_real_vs_others;FID_real_OURS];

% disp('Real VS. HD')
a = fvec_inception_imds_path_thermal_r;
b = fvec_inception_imds_path_thermal_s_hd;
m1 = mean(a,1);
m2 = mean(b,1);
ssdiff = sum((m1-m2).^2);
s1 = cov(a');
s2 = cov(b');
smean = real(sqrtm(s1*s2));
FID_real_HD = ssdiff+trace(s1+s2-2*smean);
fid_real_vs_others = [fid_real_vs_others;FID_real_HD];

%disp('P2P VS. REAL')
a = fvec_inception_imds_path_thermal_r;
b = fvec_inception_imds_path_thermal_s_p2p;
m1 = mean(a,1);
m2 = mean(b,1);
ssdiff = sum((m1-m2).^2);
s1 = cov(a');
s2 = cov(b');
smean = real(sqrtm(s1*s2));
FID_real_P2P = ssdiff+trace(s1+s2-2*smean);
fid_real_vs_others = [fid_real_vs_others;FID_real_P2P];

%disp('CG VS. REAL')
a = fvec_inception_imds_path_thermal_r;
b = fvec_inception_imds_path_thermal_s_cg;
m1 = mean(a,1);
m2 = mean(b,1);
ssdiff = sum((m1-m2).^2);
s1 = cov(a');
s2 = cov(b');
smean = real(sqrtm(s1*s2));
FID_real_CG = ssdiff+trace(s1+s2-2*smean);
fid_real_vs_others = [fid_real_vs_others;FID_real_CG];

% plot fid 2
figure(fig_n);
name_2_models = {'real__ours','real__hd','real__p2p','real__cg'};
xt = [1:5];
plot(fid_real_vs_others,'--b+')
Set_fig_YS(gca,8,10,8)
set(gca,'xtick',xt,'xticklabel',name_2_models)
set(gca,'XTickLabelRotation',-30)
ylabel('FID values')
xlabel('DIfferent models')
fig_n = fig_n + 1;

%% PSNR, ECDF, SIGNALS, SSIM
psnr_r_ours = [];
psnr_r_hd = [];
psnr_r_p2p = [];
psnr_r_cg = [];

dist_r_ours_list = [];
dist_r_hd_list = [];
dist_r_p2p_list = [];
dist_r_cg_list = [];

ssim_r_ours = [];
ssim_r_hd = [];
ssim_r_p2p = [];
ssim_r_cg = [];

for i=1:length(imds_path_thermal_r.Files)
    hd = imread(imds_path_thermal_s_hd.Files{i});
    ours = imread(imds_path_thermal_s_ours_9.Files{i});
    real = imread(imds_path_thermal_r.Files{i});
    p2p = imread(imds_path_thermal_s_p2p.Files{i});
    cg = imread(imds_path_thermal_s_cg.Files{i});
    
    hd_gray = rgb2gray(hd);
    ours_gray = rgb2gray(ours);
    real_gray = rgb2gray(real);
    p2p_gray = rgb2gray(p2p);
    cg_gray = rgb2gray(cg);


    hdFFT = fft2(hd_gray);
    oursFFT = fft2(ours_gray);
    realFFT = fft2(real_gray);
    p2pFFT = fft2(p2p_gray);
    cgFFT = fft2(cg_gray);
    
    % psnr
    [PSNR_ours_real, ~] = psnr(log(abs(fftshift(realFFT))),log(abs(fftshift(oursFFT))));
    [PSNR_hd_real, ~] = psnr(log(abs(fftshift(realFFT))),log(abs(fftshift(hdFFT))));
    [PSNR_p2p_real, ~] = psnr(log(abs(fftshift(realFFT))),log(abs(fftshift(p2pFFT))));
    [PSNR_cg_real, ~] = psnr(log(abs(fftshift(realFFT))),log(abs(fftshift(cgFFT))));

    psnr_r_ours = [psnr_r_ours; PSNR_ours_real];
    psnr_r_hd = [psnr_r_hd; PSNR_hd_real];
    psnr_r_p2p = [psnr_r_p2p; PSNR_p2p_real];
    psnr_r_cg = [psnr_r_cg; PSNR_cg_real];
    
    % ssim
    [SSIM_ours_real, ~] = ssim(log(abs(fftshift(realFFT))),log(abs(fftshift(oursFFT))));
    [SSIM_hd_real, ~] = ssim(log(abs(fftshift(realFFT))),log(abs(fftshift(hdFFT))));
    [SSIM_p2p_real, ~] = ssim(log(abs(fftshift(realFFT))),log(abs(fftshift(p2pFFT))));
    [SSIM_cg_real, ~] = ssim(log(abs(fftshift(realFFT))),log(abs(fftshift(cgFFT))));

    ssim_r_ours = [ssim_r_ours; SSIM_ours_real];
    ssim_r_hd = [ssim_r_hd; SSIM_hd_real];
    ssim_r_p2p = [ssim_r_p2p; SSIM_p2p_real];
    ssim_r_cg = [ssim_r_cg; SSIM_cg_real];
    
    % dist
    dist_r_ours = mean(mean((abs(fftshift(oursFFT)))./(abs(fftshift(realFFT)))));
    dist_r_hd = mean(mean((abs(fftshift(hdFFT)))./(abs(fftshift(realFFT)))));
    dist_r_p2p = mean(mean((abs(fftshift(p2pFFT)))./(abs(fftshift(realFFT)))));
    dist_r_cg = mean(mean((abs(fftshift(cgFFT)))./(abs(fftshift(realFFT)))));

    dist_r_ours_list = [dist_r_ours_list; dist_r_ours];
    dist_r_hd_list = [dist_r_hd_list; dist_r_hd];
    dist_r_p2p_list = [dist_r_p2p_list; dist_r_p2p];
    dist_r_cg_list = [dist_r_cg_list; dist_r_cg];
    
end

m_psnr_ = [];
m_psnr_ = [m_psnr_;abs(mode(psnr_r_ours))];
m_psnr_ = [m_psnr_;abs(mode(psnr_r_hd))];
m_psnr_ = [m_psnr_;abs(mode(psnr_r_p2p))];
m_psnr_ = [m_psnr_;abs(mode(psnr_r_cg))];

m_ssim_ = [];
m_ssim_ = [m_ssim_;(mean(ssim_r_ours))];
m_ssim_ = [m_ssim_;(mean(ssim_r_hd))];
m_ssim_ = [m_ssim_;(mean(ssim_r_p2p))];
m_ssim_ = [m_ssim_;(mean(ssim_r_cg))];

% plot ssim
figure(fig_n);
name_2_models = {'real__ours','real__hd','real__p2p','real__cg'};
xt = [1:5];
plot(m_ssim_,'--g+')
Set_fig_YS(gca,8,10,8)
set(gca,'xtick',xt,'xticklabel',name_2_models)
set(gca,'XTickLabelRotation',-30)
ylabel('mean2D-SSIM values')
xlabel('DIfferent models')
fig_n = fig_n + 1;

% plot psnr
figure(fig_n);
name_2_models = {'real__ours','real__hd','real__p2p','real__cg'};
xt = [1:5];
plot(m_psnr_,'--g+')
Set_fig_YS(gca,8,10,8)
set(gca,'xtick',xt,'xticklabel',name_2_models)
set(gca,'XTickLabelRotation',-30)
ylabel('mode2D-PSNR values')
xlabel('DIfferent models')
fig_n = fig_n + 1;

% plot psnr
figure(fig_n);
plot(psnr_r_ours)
hold on;
plot(psnr_r_hd)
hold on;
plot(psnr_r_p2p)
hold on;
plot(psnr_r_cg)
legend({'real__ours','real__hd','real__p2p','real__cg'},'location','best')
title('psnr values vs. all images');
xlabel('number of images');
ylabel('psnr values');
fig_n = fig_n +1;

% plot ecdf
figure(fig_n);
hold on
[y,x]=ecdf(dist_r_ours_list);
plot(x,y,'b');
[y,x]=ecdf(dist_r_hd_list);
plot(x,y,'r');
[y,x]=ecdf(dist_r_p2p_list);
plot(x,y,'m');
[y,x]=ecdf(dist_r_cg_list);
plot(x,y,'g');
ylabel('Empirical CDF');
xlabel('x')
legend({'dist__ours','dist__hd','dist__p2p','dist__cg'},'location','best')
fig_n = fig_n +1;

% plot signals on latest
signal_ours = abs(sum((abs(fftshift(oursFFT)))));
signal_HD = abs(sum((abs(fftshift(hdFFT)))));
signal_P2P = abs(sum((abs(fftshift(p2pFFT)))));
signal_CG = abs(sum((abs(fftshift(cgFFT)))));
signal_real = abs(sum((abs(fftshift(realFFT)))));


figure(fig_n);hold on
plot(log10(signal_ours))
plot(log10(signal_HD))
plot(log10(signal_P2P))
plot(log10(signal_CG))
plot(log10(signal_real))
legend('Ours','HD','P2P','CG','Real')
title('FFT Signals')
fig_n = fig_n +1;

%% TSNE
% inception v3
data_real = fvec_inception_imds_path_thermal_r;
data_ours  = fvec_inception_imds_path_thermal_s_ours_9;
data_hd = fvec_inception_imds_path_thermal_s_hd;
data_p2p = fvec_inception_imds_path_thermal_s_p2p;
data_cg = fvec_inception_imds_path_thermal_s_cg;

text_str = {'Real','Ours','p2phd','p2p','cg'};

data_total{1} = data_real;
data_total{2} = data_ours;
data_total{3} = data_hd;
data_total{4} = data_p2p;
data_total{5} = data_cg;

num_2_plot = 5;

data =[];
ind_group = [];
for i = 1:num_2_plot
    [n,m] = size(data_total{i}');
    data = [data;data_total{i}];
    ind_group = [ind_group;i*ones(m,1)];   
end
[Y] = tsne(((data)));


figure(fig_n); 
hold on
for i=1:num_2_plot
    scatter(Y(((i-1)*360+1):(i*360),1),Y(((i-1)*360+1):(i*360),2),20,'o','filled','MarkerFaceAlpha',.5);
end
title('tSNE vizualiztion: inception features of different models')
h1=colorbar;
colormap(jet(5))
for cnt_set = 1:num_2_plot 
    text(double(mean(Y(ind_group==cnt_set,1))),double(mean(Y(ind_group==cnt_set,2))),text_str{cnt_set})   
end
legend('Real','Ours','p2phd','p2p','cg');
fig_n = fig_n + 1;


% resnet 50
data_real = fvec_resnet_imds_path_thermal_r;
data_ours  = fvec_resnet_imds_path_thermal_s_ours_9;
data_hd = fvec_resnet_imds_path_thermal_s_hd;
data_p2p = fvec_resnet_imds_path_thermal_s_p2p;
data_cg = fvec_resnet_imds_path_thermal_s_cg;

text_str = {'Real','Ours','p2phd','p2p','cg'};

data_total{1} = data_real;
data_total{2} = data_ours;
data_total{3} = data_hd;
data_total{4} = data_p2p;
data_total{5} = data_cg;

num_2_plot = 5;

data =[];
ind_group = [];
for i = 1:num_2_plot
    [n,m] = size(data_total{i}');
    data = [data;data_total{i}];
    ind_group = [ind_group;i*ones(m,1)];   
end
[Y] = tsne(((data)));


figure(fig_n); 
hold on
for i=1:num_2_plot
    scatter(Y(((i-1)*360+1):(i*360),1),Y(((i-1)*360+1):(i*360),2),20,'o','filled','MarkerFaceAlpha',.5);
end
title('tSNE vizualiztion: resnet features of different models')
h1=colorbar;
colormap(jet(5))
for cnt_set = 1:num_2_plot 
    text(double(mean(Y(ind_group==cnt_set,1))),double(mean(Y(ind_group==cnt_set,2))),text_str{cnt_set})   
end
legend('Real','Ours','p2phd','p2p','cg');
fig_n = fig_n + 1;
