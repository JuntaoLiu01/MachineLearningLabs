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
X_norm = featureNormalize(X);
C = 100;
sigma = 0.1;
model= svmTrain(X_norm, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 

p = svmPredict(model, X);

fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('Program paused. Press enter to continue.\n');
pause;

%test
load('plateTest.mat');
Xtest_norm = featureNormalize(Xtest);
p = svmPredict(model, Xtest);

fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
fprintf('Program paused. Press enter to continue.\n');
pause;
