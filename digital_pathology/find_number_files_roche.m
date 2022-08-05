

%% cleaning
close all;clc;clear
warning('off')

%% data config
abs_path = cd;
path='F:\Nati\Roche\Cropped_slides\';

% reader
imds = dir(path);
img_dirs = {imds.name};
filename_split = split({img_dirs{1,3:end}},".");
filenames = filename_split(1,1:end,1);
num_files = length(filenames);
disp(sprintf('num files are: %d',num_files));


H = [];
for i = 1:num_files
    yourfolder = sprintf('%s%s/',path,string(i));
    a = dir(fullfile(yourfolder, '*.png'));
    H = [H, size(a,1)];
end


figure(1); histogram(H);
figure(2); plot(1:209,H);xlim([1 209]);






