%% train
clear;clc;close all

%%
isManualSplit = "TRUE";

if strcmp(isManualSplit,'FALSE')
    % automate split
    path_train='C:\Nati\PDL1 Project\GAN\pix2pix\GT_New2\';
    imds = imageDatastore(path_train,... 
       'IncludeSubfolders',true, ...
       'LabelSource','foldernames');
    [imdsTrain,imdsValidation,imdsTest] = splitEachLabel(imds,0.6,0.1,'randomized');
else
    % manual split
    %path_train='C:\Nati\PDL1 Project\GAN\pix2pix\GT_New\Train\'; %GT
    %path_train='C:\Nati\PDL1 Project\GAN\pix2pix\GT_plus_RM\';  % GT+RM
    %path_train='C:\Nati\PDL1 Project\GAN\pix2pix\GT_plus_S\';  % GT+SM
    path_train='C:\Nati\PDL1 Project\GAN\pix2pix\synthetics\synth_label2pdl1_white_noise\';
    imds = imageDatastore(path_train,... 
        'IncludeSubfolders',true, ...
        'LabelSource','foldernames');
    [imdsTrain,imdsValidation] = splitEachLabel(imds,0.9,'randomized');

    path_test='C:\Nati\PDL1 Project\GAN\pix2pix\GT_New\Test\';
    imds_test = imageDatastore(path_test,... 
        'IncludeSubfolders',true, ...
        'LabelSource','foldernames');
    [imdsTest,imdsValidationTest] = splitEachLabel(imds_test,0.99,'randomized');

end
%%
net = resnet50;

lgraph = layerGraph(net);
net.Layers(1);

inputSize = net.Layers(1).InputSize;

numClasses = numel(categories(imdsTrain.Labels)); 
lgraph = removeLayers(lgraph, {'fc1000','fc1000_softmax','ClassificationLayer_fc1000'}); 
newLayers = [ 
    fullyConnectedLayer(numClasses,'Name','fc','WeightLearnRateFactor',10,'BiasLearnRateFactor',10) 
    softmaxLayer('Name','softmax') 
    classificationLayer('Name','classoutput')]; 
lgraph = addLayers(lgraph,newLayers); 
lgraph = connectLayers(lgraph,'avg_pool','fc');
 
%% 
useAug = 'FALSE';  %for train and validation only
if strcmp(useAug,'TRUE')
    pixelRange = [-30 30];
    imageAugmenter = imageDataAugmenter( ...
        'RandXReflection',true, ...
        'RandXTranslation',pixelRange, ...
        'RandYTranslation',pixelRange);
else
    imageAugmenter = imageDataAugmenter();
end

%'DataAugmentation', imageAugmenter
augimdsTrain = augmentedImageDatastore(inputSize(1:2),imdsTrain);
augimdsValidation = augmentedImageDatastore(inputSize(1:2),imdsValidation);


imageAugmenter = imageDataAugmenter();
augimdsTest = augmentedImageDatastore(inputSize(1:2),imdsTest);

options = trainingOptions('adam',...
    'InitialLearnRate',1e-4,...
    'SquaredGradientDecayFactor',0.99,...
    'MaxEpochs',7,...
    'MiniBatchSize',8,...
    'ValidationData',augimdsValidation, ...
    'ValidationFrequency',50, ...
    'ValidationPatience',Inf, ...
    'Verbose',false, ...
    'CheckpointPath','C:\Nati\Thermal\checkpoint',...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropFactor',0.5,...
    'LearnRateDropPeriod',5,...
    'Plots','training-progress');
%% Train
[trainedNetPix2Pix_new_manual_split_UD] = trainNetwork(augimdsTrain,lgraph,options);
save ('trainedNetPix2Pix_new_manual_split_UD');
trainedNet = trainedNetPix2Pix_new_manual_split_UD;

%% Validation
[YPred,probs] = classify(trainedNet,augimdsValidation);
accuracy = mean(YPred == imdsValidation.Labels)
plotconfusion(imdsValidation.Labels,YPred)

%% Test 
[YPredt,probst] = classify(trainedNet,augimdsTest);
accuracy_test = mean(YPredt == imdsTest.Labels)
plotconfusion(imdsTest.Labels,YPredt)

%%
idx = randperm(numel(imdsValidation.Files),8);
figure 
for i = 1:8
    subplot(2,4,i)
    I = (readimage(imdsValidation,idx(i)));
    %m_i=mean(mean(I(:)));
    %imshow(I, [0.3*m_i 2*m_i])
    imshow(I,[]);
    label = YPred((idx(i)));
    title(string(label) + ", " + num2str(100*max(probs(idx(i),:)),3) + "%");
end