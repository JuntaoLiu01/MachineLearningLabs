clear ; close all; clc;
baseDir = '/Users/juntaoliu/Desktop/EasyPR/tmp/SVM/';
level = 0.7;
%features = plateFeatures(filePath,level)

%build train data set
% trainHasDir = fullfile(baseDir,'has/train');
% trainNoDir  = fullfile(baseDir,'no/train');
% [X,y] = buildData(trainHasDir,trainNoDir,level);
% save('plateTrain.mat','X','y');

%build test data set
% testHasDir = fullfile(baseDir,'has/test');
% testNoDir  = fullfile(baseDir,'no/test');
% [Xtest,ytest] = buildData(testHasDir,testNoDir,level);
% save('plateTest.mat','Xtest','ytest');

%train model
load('plateTrain.mat');
C = 100;
sigma = 0.1;
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 

p = svmPredict(model, X);

fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);
pause;

%test
load('plateTest.mat');
p = svmPredict(model, Xtest);

fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
pause;
