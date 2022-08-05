%% cleaning
close all;clc;clear
warning('off')

%% data config
abs_path = cd;
path_out='F:\Nati\Rambam\';

num_files = 48;


% mkdir output dir
if ~exist(path_out, 'dir')
    mkdir(path_out)
end

%% create sub-folders
for i=1:num_files
    cd(path_out)
    mkdir(char("P"+int2str(i)))
end
cd(abs_path)