function ypred1 = mypredict1(tbl)
%#function fitctree
load('mymodel1.mat');
load('mytestdata1.mat')
ypred1 = trainedClassifier.predictFcn(Test)
end