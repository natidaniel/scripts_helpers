%% filter by color bad synthetic images
% filter 2

clc;close all;clear
%% analyzing
path_m = 'F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all_split\mask\';
imds_m = imageDatastore(path_m,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

Thr = 0.4;
topN = 50;

list_bad2 = [];

for i =1:size(imds_m.Files)
    I = imread(imds_m.Files{i,1});
    [m,n,c]=size(I); 
    [sortedcounts, sum_topN, dom_color] = color_freq(I, topN);
    if sum_topN >= Thr*m*m
        list_bad2 = [list_bad2, string(imds_m.Files{i,1})];
    end
end

list_bad2 = list_bad2';
disp('done')

%% support funtions
function[sortedcounts, sum_topN, dom_color] = color_freq(img, topN)
    rimg = reshape(img, [], 3);
    [urgb, ~, uidx] = unique(rimg, 'rows');
    labs = reshape(uint32(uidx),size(img,1),size(img,2));
    recolored = uint8(ind2rgb(labs-1, urgb));
    counts = accumarray(uidx,1);
    [sortedcounts, sortidx] = sort(counts,'descend');
    sum_topN = sum(sortedcounts(1:topN));
    mcc1 = urgb(sortidx(1),:);
    dom_color = reshape(mcc1,1,1,3);
end