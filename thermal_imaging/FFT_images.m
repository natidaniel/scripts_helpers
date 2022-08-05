%% FFT metric

clc;close all;clear

%% loading images results paths (Lung)

% ours noise
%path_lung_s_ours = 'F:\Nati\poster\lung\ours_withNoise\img\';
% ours with air + noise
%path_lung_s_ours = 'F:\Nati\poster\lung\pix2pixhd_withAir_Noise\img\';
% ours air+cells+noise
path_lung_s_ours = 'F:\Nati\poster\lung\ours\test_latest\img\';

% hd
path_lung_s_pix2pixhd = 'F:\Nati\poster\lung\pix2pixhd\label2pdl1_nonoise\test_latest\img\';
% hd air
%path_lung_s_pix2pixhd = 'F:\Nati\poster\lung\pix2pixhd_withAir\img\';
% hd air+cell
%path_lung_s_pix2pixhd = 'F:\Nati\poster\lung\pix2pixhd_withAir_Cells\img\';

% p2p and cg air+cell
path_lung_s_pix2pix_with_prelabeling = 'F:\Nati\poster\lung\pix2pix_withAir_Cells\synth_images_cut\';
path_lung_s_cyclegan_with_prelabeling = 'F:\Nati\poster\lung\cyclegan_withAir_Cells\synth_images_cut\';

% real
path_lung_r = 'F:\Nati\poster\lung\cyclegan\real_images\';

%% create all models datastores

imds_path_lung_s_ours = imageDatastore(path_lung_s_ours,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
imds_path_lung_s_pix2pixhd = imageDatastore(path_lung_s_pix2pixhd,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
imds_path_lung_s_path_lung_s_pix2pix_with_prelabeling = imageDatastore(path_lung_s_pix2pix_with_prelabeling,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
imds_path_lung_s_path_lung_s_cyclegan_with_prelabeling = imageDatastore(path_lung_s_cyclegan_with_prelabeling,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
imds_path_lung_r = imageDatastore(path_lung_r,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

%% FFT

dist_r_ours_list = [];
dist_r_hd_list = [];
dist_r_p2p_list = [];
dist_r_cg_list = [];

psnr_r_ours = [];
psnr_r_hd = [];
psnr_r_p2p = [];
psnr_r_cg = [];

for i=1:length(imds_path_lung_r.Files)
    hd = imread(imds_path_lung_s_pix2pixhd.Files{i});
    ours = imread(imds_path_lung_s_ours.Files{i});
    real = imread(imds_path_lung_r.Files{i});
    p2p = imread(imds_path_lung_s_path_lung_s_pix2pix_with_prelabeling.Files{i});
    cg = imread(imds_path_lung_s_path_lung_s_cyclegan_with_prelabeling.Files{i});
    
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

    
%     dist_r_ours = sum(sum(abs(log(abs(fftshift(realFFT)))-log(abs(fftshift(oursFFT))))));
%     dist_r_hd = sum(sum(abs(log(abs(fftshift(realFFT)))-log(abs(fftshift(hdFFT))))));
%     dist_r_p2p = sum(sum(abs(log(abs(fftshift(realFFT)))-log(abs(fftshift(p2pFFT))))));
%     dist_r_cg = sum(sum(abs(log(abs(fftshift(realFFT)))-log(abs(fftshift(cgFFT))))));

    dist_r_ours = sum(sum(abs((abs(fftshift(oursFFT)))./(abs(fftshift(realFFT))))));
    dist_r_hd = sum(sum(abs((abs(fftshift(hdFFT)))./(abs(fftshift(realFFT))))));
    dist_r_p2p = sum(sum(abs((abs(fftshift(p2pFFT)))./(abs(fftshift(realFFT))))));
    dist_r_cg = sum(sum(abs((abs(fftshift(cgFFT)))./(abs(fftshift(realFFT))))));


    dist_r_ours_list = [dist_r_ours_list; dist_r_ours];
    dist_r_hd_list = [dist_r_hd_list; dist_r_hd];
    dist_r_p2p_list = [dist_r_p2p_list; dist_r_p2p];
    dist_r_cg_list = [dist_r_cg_list; dist_r_cg];
    
    % psnr
    [PSNR_ours_real, ~] = psnr(log(abs(fftshift(realFFT))),log(abs(fftshift(oursFFT))));
    [PSNR_hd_real, ~] = psnr(log(abs(fftshift(realFFT))),log(abs(fftshift(hdFFT))));
    [PSNR_p2p_real, ~] = psnr(log(abs(fftshift(realFFT))),log(abs(fftshift(p2pFFT))));
    [PSNR_cg_real, ~] = psnr(log(abs(fftshift(realFFT))),log(abs(fftshift(cgFFT))));

    psnr_r_ours = [psnr_r_ours; PSNR_ours_real];
    psnr_r_hd = [psnr_r_hd; PSNR_hd_real];
    psnr_r_p2p = [psnr_r_p2p; PSNR_p2p_real];
    psnr_r_cg = [psnr_r_cg; PSNR_cg_real];
    
end


%% plot
plot(dist_r_ours_list)
hold on;
plot(dist_r_hd_list)
hold on;
plot(dist_r_p2p_list)
hold on;
plot(dist_r_cg_list)
legend({'real__ours','real__hd','real__p2p','real__cg'})

%% plot psnr
plot(psnr_r_ours)
hold on;
plot(psnr_r_hd)
hold on;
plot(psnr_r_p2p)
hold on;
plot(psnr_r_cg)
legend({'real__ours','real__hd','real__p2p','real__cg'})

%%
close all
figure(1);
hold on

[y,x]=ecdf(dist_r_ours_list);
plot(x,y,'b');
[y,x]=ecdf(dist_r_hd_list);
plot(x,y,'r');
[y,x]=ecdf(dist_r_cg_list);
plot(x,y,'g');
[y,x]=ecdf(dist_r_p2p_list);
plot(x,y,'m');

%%

ctrs = linspace(10^5,5*10^5,100);
close all
figure(2);
hold on

[y,x]=hist(dist_r_ours_list,ctrs);
bar(x,y/sum(y),'k');
[y,x]=hist(dist_r_hd_list,ctrs);
bar(x,y/sum(y),'r');

%%
close all
clc

signal_ours = abs(sum((abs(fftshift(oursFFT)))))
signal_HD = abs(sum((abs(fftshift(hdFFT)))))
signal_real = abs(sum((abs(fftshift(realFFT)))))

figure(1);hold on

plot(log10(signal_ours))
plot(log10(signal_HD))
plot(log10(signal_real))
legend('Ours','HD','Real')

%%
close all
clc

fs = 20;

[y1,d1] = lowpass(log10(signal_ours)',20,fs,'ImpulseResponse','iir','Steepness',0.5);
[y2,d2] = lowpass(log10(signal_HD)',20,fs,'ImpulseResponse','iir','Steepness',0.8);
[y3,d3] = lowpass(log10(signal_real)',20,fs,'ImpulseResponse','iir','Steepness',0.95);

pspectrum([y1 y2 y3],fs)
legend('LP Ours','LP HD','LP Real')

%%
I = 10*rand(512,640);
I(100:200,100:200)=I(100:200,100:200)+100;
J = I;
K = I;


T = 10;

rx = 50*randn(T+1);


for i = 1:100/T;
    
    for j = 1:100/T;
        
        J(100+T*(i-1):100+T*i,100+T*(j-1):100+T*j)=  I(100+T*(i-1):100+T*i,100+T*(j-1):100+T*j)+rx;
    end
end

figure(1)
subplot(2,1,1);
imshow(I,[])
subplot(2,1,2);
imshow(J,[])


%%
F_I = fft2(I);
sig_I = abs(log(abs(fftshift(F_I))));

F_J = fft2(J);
sig_J = abs(log(abs(fftshift(F_J))));
figure(2);hold on
plot(sum(sig_I))
plot(sum(sig_J))

imshowpair(sig_I,imbilatfilt(sig_J,1000))
