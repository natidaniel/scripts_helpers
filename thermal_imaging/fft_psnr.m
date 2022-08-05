%% clear
clc;close all;clear

%% load images

I1 = imread('F:\Nati\poster\lung\lung_repetitive\0\MOD_1M04 - Annotation 107_up_white_cells_synthesized_image_36_HD.png');
I2 = imread('F:\Nati\poster\lung\lung_repetitive\0\MOD_1M04 - Annotation 107_up_white_cells_noise_synthesized_image_36_OURS.png');
I3 = imread('F:\Nati\poster\lung\lung_repetitive\0\MOD_1M04 - Annotation 107_up_REAL.png');
I1g = rgb2gray(I1);
I2g = rgb2gray(I2);
I3g = rgb2gray(I3);

%% FFT2

hdFFT = fft2(I1g);
oursFFT = fft2(I2g);
realFFT = fft2(I3g);



figure(1)
imagesc(log(abs(fftshift(hdFFT))))
newmap = contrast(log(abs(fftshift(hdFFT))));
colormap(newmap)

figure(2)
imagesc(log(abs(fftshift(oursFFT))))
newmap = contrast(log(abs(fftshift(oursFFT))));
colormap(newmap)

figure(3)
imagesc(log(abs(fftshift(realFFT))))
newmap = contrast(log(abs(fftshift(realFFT))));
colormap(newmap)

%% PSNR

[PSNR_ours_real, SNR_ours_real] = psnr(log(abs(fftshift(realFFT))),log(abs(fftshift(oursFFT))))
[PSNR_hd_real, SNR_hd_real] = psnr(log(abs(fftshift(realFFT))),log(abs(fftshift(hdFFT))))
