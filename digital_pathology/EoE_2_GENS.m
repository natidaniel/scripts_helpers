load('C:\Nati\EoE\SVM_GENS.mat');


% 78.2 cross validation - tree
% 75.86 test

P = []
GT_Test = test(:,9)';
for i = 1:length(test)
    p = trainedModel.predictFcn(test(i,1:end-1));
    P = [P, p];
end
diff = abs(P - GT_Test);
ACC = 100* (length(test) - sum(diff)) / length(test);

GP = [GT_Test', P'];



P = []
GT_Test = Test(:,1)';
for i = 1:length(Test)
    p = SVM_trainedModel.predictFcn(Test(i,2:end));
    P = [P, p];
end

diff = abs(P - GT_Test);
ACC = 100* (136 - sum(diff)) / 136;

GP = [GT_Test', P'];

