%% inceptionv3-tSNE
% filter 1
%% cleaning
clc;close all;clear
%% analyzing
%path = 'F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all_split\img\';
%path_m = 'F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all_split\mask\';
%path_list_bad = 'F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all_split\bad_imgs.csv';

path = 'F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all_split\new\img\';
path_m = 'F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all_split\new\mask\';
path_list_bad = 'F:\Nati\Thermal\655\655_run\test\label2thermal_655_night\all_split\new\bad_imgs.csv';

net = inceptionv3();
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
imds_m = imageDatastore(path_m,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

% augment to match network size
au1 = augmentedImageDatastore([299,299],imds);
features1 = activations(net,au1,'avg_pool');
fvec = squeeze(features1)';

au1_m = augmentedImageDatastore([299,299],imds_m);
features1_m = activations(net,au1_m,'avg_pool');
fvec_m = squeeze(features1_m)';

% tsne
Y = tsne(fvec);
Y_m = tsne(fvec_m);
% plot tsne
figure(1)
subplot(121)
gscatter(Y(:,1),Y(:,2))
colormap(jet(3))
subplot(122)
gscatter(Y_m(:,1),Y_m(:,2))
colormap(jet(3))

% tsne
Y_3 = tsne(fvec,'NumDimensions',3);
Y_m_3 = tsne(fvec_m,'NumDimensions',3);
% plot tsne
figure(2)
subplot(121)
plot3(Y_3(:,1),Y_3(:,2),Y_3(:,3),'.')
colormap(jet(3))
subplot(122)
plot3(Y_m_3(:,1),Y_m_3(:,2),Y_3(:,3),'.')
colormap(jet(3))


%% kmeans 2D 10
[idx,C] = kmeans(Y_m,10);

figure(3)
scatter(Y_m(:,1),Y_m(:,2),[],idx)

counter_kmeans = zeros(length(unique(idx)),2);

for i=1:length(unique(idx))
    counter_kmeans(i,1) = i;
    counter_kmeans(i,2) = length(find(idx==i));
end

sorted_kmeans = sortrows(counter_kmeans,-2);
top5_idx = sorted_kmeans(1:5,1);

list_bad = []
for i=1:length(imds.Files)
    if ~ismember(idx(i),top5_idx) 
        list_bad = [list_bad, string(imds.Files{i,1})];
    end
end
list_bad = list_bad';
disp('done')

%% kmeans 6
[idx,C] = kmeans(Y_3,6);

figure(4)
scatter3(Y_3(:,1),Y_3(:,2),Y_3(:,3),[],idx)
%% fine without label
list_bad = []
for i=1:length(imds.Files)
    if Y(i,1) >= 11 & Y(i,1) <= 30 & Y(i,2) <=-31  Y(i,2) >=-44
        list_bad = [list_bad, string(imds.Files{i,1})];
    end
end
list_bad = list_bad';
disp('done')

%% fine with automatic clustering label
Ynew = zeros(length(imds.Files),3);
for i=1:length(imds.Files)
    if Y(i,1) >= 6 & Y(i,1) <= 17 & Y(i,2) <=-58  & Y(i,2) >=-70
        label = 1;
    elseif Y(i,1) >= 17 & Y(i,1) <= 33 & Y(i,2) <=48  & Y(i,2) >=31
        label = 2;
    else
        label = 3;
    end
    Ynew(i,:) = [Y(i,1),Y(i,2),label];
end
gscatter(Ynew(:,1),Ynew(:,2),Ynew(:,3), 'brg','xo^')
title('Fine-based approach using self-supervised for filtering distorted synthetic images')  