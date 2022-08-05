%%
clc;clear;close all;
tic
path_train='F:\thermal_day_elbit_data\nov21\images\';
path_out='F:\thermal_day_elbit_data\nov21\images\';
%%
d1=dir(path_train);
count = 0;
for ii=3:length(d1)
    I=imread([path_train,d1(ii).name]);
    if ndims(I) == 2 % if it's a 2D image,  Convert to 3-D.
        display('2d image');
        count = count + 1;
        I1 = cat(3, I, I, I);
        imwrite(I1,[path_out,d1(ii).name]);
    end
    clear I1
end
toc