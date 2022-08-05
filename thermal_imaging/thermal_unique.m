%%
clc;clear;close all;
tic
%path_train='C:\Nati\GAN_Thermal\day_512_1024\train_label\';
path_train='F:\thermal_day_elbit_data\nov21\labels\';
%%
d1=dir(path_train);
U = [];
S = [];
for ii=3:length(d1)
    I = imread([path_train,d1(ii).name]);
    [m,n,c] = size(I);
    U = [U; unique(I)];
    S = [S; m*n*c];
end
toc
LU = unique(U)
SU = unique(S)