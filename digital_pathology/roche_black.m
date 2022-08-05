%%
close all;clc;clear

%% GT up/down
path='D:\Nati\gans\GT_full_res\full_up_down\';
path_out='D:\Nati\gans\GT_full_res\new_full_up_down\';

nsortD = 'TRUE';
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imds.Files = natsortfiles(imds.Files);
end


for i =1:size(imds.Files)
    I = imread(imds.Files{i,1});
    ind = find(I(1,:,1)==0);
    if length(ind) == 0
        In = I;
    else
        In = I(:,1:(ind(1)-1),:);
    end
    imwrite(In,sprintf('%s/%d.png',path_out,i));
end
disp('end gt')

%%

close all;clc;clear
%% test

path='D:\Nati\gans\Test\label2pdl1_white_cells_noise\test_latest\images\';
path_out='D:\Nati\gans\Test\label2pdl1_white_cells_noise\test_latest\new\';

nsortD = 'TRUE';
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imds.Files = natsortfiles(imds.Files);
end


for i =2:2:length(imds.Files)
    I = imread(imds.Files{i,1});
    [r,c,~]= size(I);
    first = c+1;
    for k=1:r
        R = find(I(k,:,1)==0);
        if length(R) == 0
            continue
        else
            m = R(1);
            if m<first
                first = m;
            end
        end
    end
    if first == c+1
        In = I;
    elseif first < c/2
        In = I;
    else
        In = I(:,1:(first-1),:);
    end
    imwrite(In,sprintf('%s/%d.png',path_out,i));
end

disp('end test')

%%
close all;clc;clear
 p = randperm(703);

% organize
path='D:\Nati\gans\Roche\Real_Synth_0_1\S\nc\';
path_out='D:\Nati\gans\Roche\Real_Synth_0_1\all\';


nsortD = 'TRUE';
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imds.Files = natsortfiles(imds.Files);
end

sn = 590;
for i =1:size(imds.Files)
    I = imread(imds.Files{i,1});
    imwrite(I,sprintf('%s/%d.png',path_out,p(sn)));
    sn=sn+1;
end


%% Clean
clear;close all;clc

%% TPS R
% 0 - other, 1 - inf, 2 - negative, 3 - positive, 4 - padding, 5 - white, 6
% - cell, 7 - noise

pathI='C:\Nati\PDL1 Project\Gans\Roche\Real_Synth_0_1\4Roche\R\TPS_90_100\up_down\Image\';
pathL='C:\Nati\PDL1 Project\Gans\Roche\Real_Synth_0_1\4Roche\R\TPS_90_100\up_down\Label\';
pathI_out='C:\Nati\PDL1 Project\Gans\Roche\Real_Synth_0_1\4Roche\R\TPS_90_100\up_down\new\Image\';
pathL_out='C:\Nati\PDL1 Project\Gans\Roche\Real_Synth_0_1\4Roche\R\TPS_90_100\up_down\new\Label\';


nsortD = 'TRUE';
imdsI = imageDatastore(pathI,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imdsI.Files = natsortfiles(imdsI.Files);
end

imdsL = imageDatastore(pathL,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imdsL.Files = natsortfiles(imdsL.Files);
end


for i =1:size(imdsI.Files)
    I = imread(imdsI.Files{i,1}); %Image
    L = imread(imdsL.Files{i,1}); %Label
    % remove padding
    ind = find(I(1,:,1)==0);
    if length(ind) == 0
        In = I;
        Ln = L;
    else
        In = I(:,1:(ind(1)-1),:);
        Ln = L(:,1:(ind(1)-1));
    end
    % new TPS
    tmpP = In;
    tmpN = In;
    tmpP(repmat(Ln,[1,1,3])~=3)=0;%imshow(tmpP);% PDL1 positive
    tmpN(repmat(Ln,[1,1,3])~=2)=0;%imshow(tmpN);% PDL1 negative
    tps = 100*length(find(tmpP>0))/(length(find(tmpN>0))+length(find(tmpP>0)));
    if isnan(tps)
        tps = 0;
    end
    % save new I and L
    imwrite(In,sprintf('%s/%d_%s_TPS.png',pathI_out,i,string(tps)));
    imwrite(Ln,sprintf('%s/%d_%s_TPS.png',pathL_out,i,string(tps)));
end
disp('end gt')

%% TPS S
clear;close all;clc
% 0 - other, 1 - inf, 2 - negative, 3 - positive, 4 - padding, 5 - white, 6
% - cell, 7 - noise

path='D:\Nati\gans\Test\label2pdl1_white_noise\test_latest\images\';
path_out='D:\Nati\gans\Test\label2pdl1_white_noise\test_latest\newwl\';

nsortD = 'TRUE';
imds = imageDatastore(path,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imds.Files = natsortfiles(imds.Files);
end


for i =1:(length(imds.Files)/3)
    I = imread(imds.Files{i*3,1}); %Image
    L = imread(imds.Files{(i-1)*3+1,1}); %Label
    % remove padding
    [r,c,~]= size(I);
    first = c+1;
    for k=1:r
        R = find(I(k,:,1)==0);
        if length(R) == 0
            continue
        else
            m = R(1);
            if m<first
                first = m;
            end
        end
    end
    if first == c+1
        In = I;
        Ln = L;
    elseif first < c/2
        In = I;
        Ln = L;
    else
        In = I(:,1:(first-1),:);
        Ln = L(:,1:(first-1));
    end
    % new TPS
    tmpP = In;
    tmpN = In;
    tmpP(repmat(Ln,[1,1,3])~=3)=0;%imshow(tmpP);% PDL1 positive
    tmpN(repmat(Ln,[1,1,3])~=2)=0;%imshow(tmpN);% PDL1 negative
    tps = 100*length(find(tmpP>0))/(length(find(tmpN>0))+length(find(tmpP>0)));
    if isnan(tps)
        tps = 0;
    end
    % save new I and L
    imwrite(In,sprintf('%s/%s/%d_%s_TPS.png',path_out,'Image',i,string(tps)));
    imwrite(Ln,sprintf('%s/%s/%d_%s_TPS.png',path_out,'Label',i,string(tps)));
end
disp('end sent')


%% Classification GT
% GT up/down
% 0 - other, 1 - inf, 2 - negative, 3 - positive, 4 - padding, 5 - white, 6
% - cell, 7 - noise

pathI='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\Image\';
pathL='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\Label\';
pathI_out='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\New\Image\';
pathL_out='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\New\Label\';


nsortD = 'TRUE';
imdsI = imageDatastore(pathI,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imdsI.Files = natsortfiles(imdsI.Files);
end

imdsL = imageDatastore(pathL,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imdsL.Files = natsortfiles(imdsL.Files);
end


for i =1:size(imdsI.Files)
    I = imread(imdsI.Files{i,1}); %Image
    L = imread(imdsL.Files{i,1}); %Label
    % remove padding
    ind = find(I(1,:,1)==0);
    if length(ind) == 0
        In = I;
        Ln = L;
    else
        In = I(:,1:(ind(1)-1),:);
        Ln = L(:,1:(ind(1)-1));
    end
    % new TPS
    tmpP = In;
    tmpN = In;
    tmpP(repmat(Ln,[1,1,3])~=3)=0;%imshow(tmpP);% PDL1 positive
    tmpN(repmat(Ln,[1,1,3])~=2)=0;%imshow(tmpN);% PDL1 negative
    tps = 100*length(find(tmpP>0))/(length(find(tmpN>0))+length(find(tmpP>0)));
    if isnan(tps)
        tps = 0;
    end
    if (tps <= 1)
        % save new I and L
        imwrite(In,sprintf('%s/%s/%d_%s_TPS.png',pathI_out,'0',i,string(tps)));
        imwrite(Ln,sprintf('%s/%s/%d_%s_TPS.png',pathL_out,'0',i,string(tps)));
    elseif (tps >1 && tps <=50)
        % save new I and L
        imwrite(In,sprintf('%s/%s/%d_%s_TPS.png',pathI_out,'1',i,string(tps)));
        imwrite(Ln,sprintf('%s/%s/%d_%s_TPS.png',pathL_out,'1',i,string(tps)));
    elseif (tps >=50)
        % save new I and L
        imwrite(In,sprintf('%s/%s/%d_%s_TPS.png',pathI_out,'2',i,string(tps)));
        imwrite(Ln,sprintf('%s/%s/%d_%s_TPS.png',pathL_out,'2',i,string(tps)));
    else
    end
end
disp('end gt')


%% Classification GT
% GT up/down
% 0 - other, 1 - inf, 2 - negative, 3 - positive, 4 - padding, 5 - white, 6
% - cell, 7 - noise
clc;close all;clear

pathI='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\Image\';
pathL='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\Label\';
pathI_out='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\New2\Image\';
pathL_out='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\New2\Label\';


nsortD = 'TRUE';
imdsI = imageDatastore(pathI,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imdsI.Files = natsortfiles(imdsI.Files);
end

imdsL = imageDatastore(pathL,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imdsL.Files = natsortfiles(imdsL.Files);
end


for i =1:size(imdsI.Files)
    I = imread(imdsI.Files{i,1}); %Image
    L = imread(imdsL.Files{i,1}); %Label
    % remove padding
    ind = find(I(1,:,1)==0);
    if length(ind) == 0
        In = I;
        Ln = L;
    else
        In = I(:,1:(ind(1)-1),:);
        Ln = L(:,1:(ind(1)-1));
    end
    % new TPS
    tmpP = In;
    tmpN = In;
    tmpP(repmat(Ln,[1,1,3])~=3)=0;%imshow(tmpP);% PDL1 positive
    tmpN(repmat(Ln,[1,1,3])~=2)=0;%imshow(tmpN);% PDL1 negative
    tps = 100*length(find(tmpP>0))/(length(find(tmpN>0))+length(find(tmpP>0)));
    if isnan(tps)
        tps = 0;
    end
    if (tps == 0)
        % save new I and L
        imwrite(In,sprintf('%s/%s/%d_%s_TPS.png',pathI_out,'0',i,string(tps)));
        imwrite(Ln,sprintf('%s/%s/%d_%s_TPS.png',pathL_out,'0',i,string(tps)));
    elseif (tps >0 && tps <=1)
        % save new I and L
        imwrite(In,sprintf('%s/%s/%d_%s_TPS.png',pathI_out,'1',i,string(tps)));
        imwrite(Ln,sprintf('%s/%s/%d_%s_TPS.png',pathL_out,'1',i,string(tps)));
    elseif (tps >1 && tps <=5)
        % save new I and L
        imwrite(In,sprintf('%s/%s/%d_%s_TPS.png',pathI_out,'2',i,string(tps)));
        imwrite(Ln,sprintf('%s/%s/%d_%s_TPS.png',pathL_out,'2',i,string(tps)));
    elseif (tps >5 && tps <=10)
        % save new I and L
        imwrite(In,sprintf('%s/%s/%d_%s_TPS.png',pathI_out,'3',i,string(tps)));
        imwrite(Ln,sprintf('%s/%s/%d_%s_TPS.png',pathL_out,'3',i,string(tps)));
    elseif (tps >10 && tps <=50)
        % save new I and L
        imwrite(In,sprintf('%s/%s/%d_%s_TPS.png',pathI_out,'4',i,string(tps)));
        imwrite(Ln,sprintf('%s/%s/%d_%s_TPS.png',pathL_out,'4',i,string(tps)));
    elseif (tps >50)
        % save new I and L
        imwrite(In,sprintf('%s/%s/%d_%s_TPS.png',pathI_out,'5',i,string(tps)));
        imwrite(Ln,sprintf('%s/%s/%d_%s_TPS.png',pathL_out,'5',i,string(tps)));
    else
    end
end
disp('end gt')


%% Regression GT
% GT up/down
% 0 - other, 1 - inf, 2 - negative, 3 - positive, 4 - padding, 5 - white, 6
% - cell, 7 - noise
clc;close all;clear

pathI='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\Image\';
pathL='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\Label\';
file_csv = 'D:\Nati\gans\GT_full_res\GT_up_down_with_masks\New3\filetps.csv';
pathI_out='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\New3\Image\';
pathL_out='D:\Nati\gans\GT_full_res\GT_up_down_with_masks\New3\Label\';


nsortD = 'TRUE';
imdsI = imageDatastore(pathI,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imdsI.Files = natsortfiles(imdsI.Files);
end

imdsL = imageDatastore(pathL,... 
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');
if strcmp(nsortD,'TRUE')
    imdsL.Files = natsortfiles(imdsL.Files);
end

fileIList = [];
tpsList = [];

for i =1:size(imdsI.Files)
    fileI = split(imdsI.Files{i,1}, "\");fileI = string(fileI{7,1});
    fileL = split(imdsL.Files{i,1}, "\");fileL = string(fileL{7,1});
    fileIList = [fileIList;fileI];
    I = imread(imdsI.Files{i,1}); %Image
    L = imread(imdsL.Files{i,1}); %Label
    % remove padding
    ind = find(I(1,:,1)==0);
    if length(ind) == 0
        In = I;
        Ln = L;
    else
        In = I(:,1:(ind(1)-1),:);
        Ln = L(:,1:(ind(1)-1));
    end
    % new TPS
    tmpP = In;
    tmpN = In;
    tmpP(repmat(Ln,[1,1,3])~=3)=0;%imshow(tmpP);% PDL1 positive
    tmpN(repmat(Ln,[1,1,3])~=2)=0;%imshow(tmpN);% PDL1 negative
    tps = 100*length(find(tmpP>0))/(length(find(tmpN>0))+length(find(tmpP>0)));
    if isnan(tps)
        tps = 0;
    end
    
    tpsList = [tpsList;round(tps)];
    
    dirI = sprintf('%s/%s/',pathI_out,string(round(tps)));
    dirL = sprintf('%s/%s/',pathL_out,string(round(tps)));
    if ~exist(dirI, 'dir')
       mkdir(dirI)
    end
    if ~exist(dirL, 'dir')
       mkdir(dirL)
    end
    
    % save new I and L
    imwrite(In,sprintf('%s/%s.png',dirI,fileI));
    imwrite(Ln,sprintf('%s/%s.png',dirL,fileL));
 
end

% Save csv
fid = fopen( file_csv, 'w' );
for jj = 1 : length( fileIList )
    fprintf( fid, '%s,%d\n', fileIList{jj}, tpsList(jj) );
end
fclose( fid );

disp('end gt-reg')