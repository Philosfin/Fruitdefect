function [trainedClassifier, validationAccuracy] = SVMtrainClassifier1hmat(~)
% [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% returns a trained classifier and its accuracy. This code recreates the
% classification model trained in Classification Learner app. Use the
% generated code to automate training the same model with new data, or to
% learn how to programmatically train models.
%
%  Input:
%      trainingData: a table containing the same predictor and response
%       columns as imported into the app.
%
%  Output:
%      trainedClassifier: a struct containing the trained classifier. The
%       struct contains various fields with information about the trained
%       classifier.
%
%      trainedClassifier.predictFcn: a function to make predictions on new
%       data.
%
%      validationAccuracy: a double containing the accuracy in percent. In
%       the app, the History list displays this overall accuracy score for
%       each model.
%
% Use the code to train the model with new data. To retrain your
% classifier, call the function from the command line with your original
% data or new data as the input argument trainingData.
%
% For example, to retrain a classifier trained with the original data set
% T, enter:
%   [trainedClassifier, validationAccuracy] = trainClassifier(T)
%
% To make predictions with the returned 'trainedClassifier' on new data T2,
% use
%   yfit = trainedClassifier.predictFcn(T2)
%
% T2 must be a table containing at least the same predictor columns as used
% during training. For details, enter:
%   trainedClassifier.HowToPredict

% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
% trainingData = importfile1('Latents.xlsx','Sheet1',2,174);
inputTable = importfile1('Latents.xlsx','Sheet1',2,174); %trainingData;
predictorNames = {'VarName3', 'VarName4', 'VarName5', 'VarName6', 'VarName7', 'VarName8', 'VarName9', 'VarName10', 'VarName11', 'VarName12', 'VarName13', 'VarName14', 'VarName15', 'VarName16', 'VarName17', 'VarName18', 'VarName19', 'VarName20', 'VarName21', 'VarName22', 'VarName23', 'VarName24', 'VarName25', 'VarName26', 'VarName27', 'VarName28', 'VarName29', 'VarName30', 'VarName31', 'VarName32', 'VarName33', 'VarName34', 'VarName35', 'VarName36', 'VarName37', 'VarName38', 'VarName39', 'VarName40', 'VarName41', 'VarName42', 'VarName43', 'VarName44', 'VarName45', 'VarName46', 'VarName47', 'VarName48', 'VarName49', 'VarName50', 'VarName51', 'VarName52', 'VarName53', 'VarName54', 'VarName55', 'VarName56', 'VarName57', 'VarName58', 'VarName59', 'VarName60', 'VarName61', 'VarName62', 'VarName63', 'VarName64', 'VarName65', 'VarName66', 'VarName67', 'VarName68', 'VarName69', 'VarName70', 'VarName71', 'VarName72', 'VarName73', 'VarName74', 'VarName75', 'VarName76', 'VarName77', 'VarName78', 'VarName79', 'VarName80', 'VarName81', 'VarName82', 'VarName83', 'VarName84', 'VarName85', 'VarName86', 'VarName87', 'VarName88', 'VarName89', 'VarName90', 'VarName91', 'VarName92', 'VarName93', 'VarName94', 'VarName95', 'VarName96', 'VarName97', 'VarName98', 'VarName99', 'VarName100', 'VarName101', 'VarName102', 'VarName103', 'VarName104', 'VarName105', 'VarName106', 'VarName107', 'VarName108', 'VarName109', 'VarName110', 'VarName111', 'VarName112', 'VarName113', 'VarName114', 'VarName115', 'VarName116', 'VarName117', 'VarName118', 'VarName119', 'VarName120', 'VarName121', 'VarName122', 'VarName123', 'VarName124', 'VarName125', 'VarName126', 'VarName127', 'VarName128', 'VarName129', 'VarName130', 'VarName131', 'VarName132', 'VarName133', 'VarName134', 'VarName135', 'VarName136', 'VarName137', 'VarName138', 'VarName139', 'VarName140', 'VarName141', 'VarName142', 'VarName143', 'VarName144', 'VarName145', 'VarName146', 'VarName147', 'VarName148', 'VarName149', 'VarName150', 'VarName151', 'VarName152', 'VarName153', 'VarName154', 'VarName155', 'VarName156', 'VarName157', 'VarName158', 'VarName159', 'VarName160', 'VarName161', 'VarName162', 'VarName163', 'VarName164', 'VarName165', 'VarName166', 'VarName167', 'VarName168', 'VarName169', 'VarName170', 'VarName171', 'VarName172', 'VarName173', 'VarName174', 'VarName175', 'VarName176', 'VarName177', 'VarName178', 'VarName179', 'VarName180', 'VarName181', 'VarName182', 'VarName183', 'VarName184', 'VarName185', 'VarName186', 'VarName187', 'VarName188', 'VarName189', 'VarName190', 'VarName191', 'VarName192', 'VarName193', 'VarName194', 'VarName195', 'VarName196', 'VarName197', 'VarName198', 'VarName199', 'VarName200', 'VarName201', 'VarName202', 'VarName203', 'VarName204', 'VarName205', 'VarName206', 'VarName207', 'VarName208', 'VarName209', 'VarName210', 'VarName211', 'VarName212', 'VarName213', 'VarName214', 'VarName215', 'VarName216', 'VarName217', 'VarName218', 'VarName219', 'VarName220', 'VarName221', 'VarName222', 'VarName223', 'VarName224', 'VarName225', 'VarName226', 'VarName227', 'VarName228', 'VarName229', 'VarName230', 'VarName231', 'VarName232', 'VarName233', 'VarName234', 'VarName235', 'VarName236', 'VarName237', 'VarName238', 'VarName239', 'VarName240', 'VarName241', 'VarName242', 'VarName243', 'VarName244', 'VarName245', 'VarName246', 'VarName247', 'VarName248', 'VarName249', 'VarName250', 'VarName251', 'VarName252', 'VarName253', 'VarName254', 'VarName255', 'VarName256', 'VarName257'};
predictors = inputTable(:, predictorNames);
response = inputTable.Class;
isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];

% Train a classifier
% This code specifies all the classifier options and trains the classifier.
classificationSVM = fitcsvm(...
    predictors, ...
    response, ...
    'KernelFunction', 'polynomial', ...
    'PolynomialOrder', 3, ...
    'KernelScale', 'auto', ...
    'BoxConstraint', 1, ...
    'Standardize', true, ...
    'ClassNames', categorical({'B'; 'S'}));

% Create the result struct with predict function
predictorExtractionFcn = @(t) t(:, predictorNames);
svmPredictFcn = @(x) predict(classificationSVM, x);
trainedClassifier.predictFcn = @(x) svmPredictFcn(predictorExtractionFcn(x));

% Add additional fields to the result struct
trainedClassifier.RequiredVariables = {'VarName3', 'VarName4', 'VarName5', 'VarName6', 'VarName7', 'VarName8', 'VarName9', 'VarName10', 'VarName11', 'VarName12', 'VarName13', 'VarName14', 'VarName15', 'VarName16', 'VarName17', 'VarName18', 'VarName19', 'VarName20', 'VarName21', 'VarName22', 'VarName23', 'VarName24', 'VarName25', 'VarName26', 'VarName27', 'VarName28', 'VarName29', 'VarName30', 'VarName31', 'VarName32', 'VarName33', 'VarName34', 'VarName35', 'VarName36', 'VarName37', 'VarName38', 'VarName39', 'VarName40', 'VarName41', 'VarName42', 'VarName43', 'VarName44', 'VarName45', 'VarName46', 'VarName47', 'VarName48', 'VarName49', 'VarName50', 'VarName51', 'VarName52', 'VarName53', 'VarName54', 'VarName55', 'VarName56', 'VarName57', 'VarName58', 'VarName59', 'VarName60', 'VarName61', 'VarName62', 'VarName63', 'VarName64', 'VarName65', 'VarName66', 'VarName67', 'VarName68', 'VarName69', 'VarName70', 'VarName71', 'VarName72', 'VarName73', 'VarName74', 'VarName75', 'VarName76', 'VarName77', 'VarName78', 'VarName79', 'VarName80', 'VarName81', 'VarName82', 'VarName83', 'VarName84', 'VarName85', 'VarName86', 'VarName87', 'VarName88', 'VarName89', 'VarName90', 'VarName91', 'VarName92', 'VarName93', 'VarName94', 'VarName95', 'VarName96', 'VarName97', 'VarName98', 'VarName99', 'VarName100', 'VarName101', 'VarName102', 'VarName103', 'VarName104', 'VarName105', 'VarName106', 'VarName107', 'VarName108', 'VarName109', 'VarName110', 'VarName111', 'VarName112', 'VarName113', 'VarName114', 'VarName115', 'VarName116', 'VarName117', 'VarName118', 'VarName119', 'VarName120', 'VarName121', 'VarName122', 'VarName123', 'VarName124', 'VarName125', 'VarName126', 'VarName127', 'VarName128', 'VarName129', 'VarName130', 'VarName131', 'VarName132', 'VarName133', 'VarName134', 'VarName135', 'VarName136', 'VarName137', 'VarName138', 'VarName139', 'VarName140', 'VarName141', 'VarName142', 'VarName143', 'VarName144', 'VarName145', 'VarName146', 'VarName147', 'VarName148', 'VarName149', 'VarName150', 'VarName151', 'VarName152', 'VarName153', 'VarName154', 'VarName155', 'VarName156', 'VarName157', 'VarName158', 'VarName159', 'VarName160', 'VarName161', 'VarName162', 'VarName163', 'VarName164', 'VarName165', 'VarName166', 'VarName167', 'VarName168', 'VarName169', 'VarName170', 'VarName171', 'VarName172', 'VarName173', 'VarName174', 'VarName175', 'VarName176', 'VarName177', 'VarName178', 'VarName179', 'VarName180', 'VarName181', 'VarName182', 'VarName183', 'VarName184', 'VarName185', 'VarName186', 'VarName187', 'VarName188', 'VarName189', 'VarName190', 'VarName191', 'VarName192', 'VarName193', 'VarName194', 'VarName195', 'VarName196', 'VarName197', 'VarName198', 'VarName199', 'VarName200', 'VarName201', 'VarName202', 'VarName203', 'VarName204', 'VarName205', 'VarName206', 'VarName207', 'VarName208', 'VarName209', 'VarName210', 'VarName211', 'VarName212', 'VarName213', 'VarName214', 'VarName215', 'VarName216', 'VarName217', 'VarName218', 'VarName219', 'VarName220', 'VarName221', 'VarName222', 'VarName223', 'VarName224', 'VarName225', 'VarName226', 'VarName227', 'VarName228', 'VarName229', 'VarName230', 'VarName231', 'VarName232', 'VarName233', 'VarName234', 'VarName235', 'VarName236', 'VarName237', 'VarName238', 'VarName239', 'VarName240', 'VarName241', 'VarName242', 'VarName243', 'VarName244', 'VarName245', 'VarName246', 'VarName247', 'VarName248', 'VarName249', 'VarName250', 'VarName251', 'VarName252', 'VarName253', 'VarName254', 'VarName255', 'VarName256', 'VarName257'};
trainedClassifier.ClassificationSVM = classificationSVM;
trainedClassifier.About = 'This struct is a trained model exported from Classification Learner R2018a.';
trainedClassifier.HowToPredict = sprintf('To make predictions on a new table, T, use: \n  yfit = c.predictFcn(T) \nreplacing ''c'' with the name of the variable that is this struct, e.g. ''trainedModel''. \n \nThe table, T, must contain the variables returned by: \n  c.RequiredVariables \nVariable formats (e.g. matrix/vector, datatype) must match the original training data. \nAdditional variables are ignored. \n \nFor more information, see <a href="matlab:helpview(fullfile(docroot, ''stats'', ''stats.map''), ''appclassification_exportmodeltoworkspace'')">How to predict using an exported model</a>.');

% % Extract predictors and response
% % This code processes the data into the right shape for training the
% % model.
% trainingData = importfile1('Latents.xlsx','Sheet1',2,174);
% inputTable = trainingData;
% predictorNames = {'VarName3', 'VarName4', 'VarName5', 'VarName6', 'VarName7', 'VarName8', 'VarName9', 'VarName10', 'VarName11', 'VarName12', 'VarName13', 'VarName14', 'VarName15', 'VarName16', 'VarName17', 'VarName18', 'VarName19', 'VarName20', 'VarName21', 'VarName22', 'VarName23', 'VarName24', 'VarName25', 'VarName26', 'VarName27', 'VarName28', 'VarName29', 'VarName30', 'VarName31', 'VarName32', 'VarName33', 'VarName34', 'VarName35', 'VarName36', 'VarName37', 'VarName38', 'VarName39', 'VarName40', 'VarName41', 'VarName42', 'VarName43', 'VarName44', 'VarName45', 'VarName46', 'VarName47', 'VarName48', 'VarName49', 'VarName50', 'VarName51', 'VarName52', 'VarName53', 'VarName54', 'VarName55', 'VarName56', 'VarName57', 'VarName58', 'VarName59', 'VarName60', 'VarName61', 'VarName62', 'VarName63', 'VarName64', 'VarName65', 'VarName66', 'VarName67', 'VarName68', 'VarName69', 'VarName70', 'VarName71', 'VarName72', 'VarName73', 'VarName74', 'VarName75', 'VarName76', 'VarName77', 'VarName78', 'VarName79', 'VarName80', 'VarName81', 'VarName82', 'VarName83', 'VarName84', 'VarName85', 'VarName86', 'VarName87', 'VarName88', 'VarName89', 'VarName90', 'VarName91', 'VarName92', 'VarName93', 'VarName94', 'VarName95', 'VarName96', 'VarName97', 'VarName98', 'VarName99', 'VarName100', 'VarName101', 'VarName102', 'VarName103', 'VarName104', 'VarName105', 'VarName106', 'VarName107', 'VarName108', 'VarName109', 'VarName110', 'VarName111', 'VarName112', 'VarName113', 'VarName114', 'VarName115', 'VarName116', 'VarName117', 'VarName118', 'VarName119', 'VarName120', 'VarName121', 'VarName122', 'VarName123', 'VarName124', 'VarName125', 'VarName126', 'VarName127', 'VarName128', 'VarName129', 'VarName130', 'VarName131', 'VarName132', 'VarName133', 'VarName134', 'VarName135', 'VarName136', 'VarName137', 'VarName138', 'VarName139', 'VarName140', 'VarName141', 'VarName142', 'VarName143', 'VarName144', 'VarName145', 'VarName146', 'VarName147', 'VarName148', 'VarName149', 'VarName150', 'VarName151', 'VarName152', 'VarName153', 'VarName154', 'VarName155', 'VarName156', 'VarName157', 'VarName158', 'VarName159', 'VarName160', 'VarName161', 'VarName162', 'VarName163', 'VarName164', 'VarName165', 'VarName166', 'VarName167', 'VarName168', 'VarName169', 'VarName170', 'VarName171', 'VarName172', 'VarName173', 'VarName174', 'VarName175', 'VarName176', 'VarName177', 'VarName178', 'VarName179', 'VarName180', 'VarName181', 'VarName182', 'VarName183', 'VarName184', 'VarName185', 'VarName186', 'VarName187', 'VarName188', 'VarName189', 'VarName190', 'VarName191', 'VarName192', 'VarName193', 'VarName194', 'VarName195', 'VarName196', 'VarName197', 'VarName198', 'VarName199', 'VarName200', 'VarName201', 'VarName202', 'VarName203', 'VarName204', 'VarName205', 'VarName206', 'VarName207', 'VarName208', 'VarName209', 'VarName210', 'VarName211', 'VarName212', 'VarName213', 'VarName214', 'VarName215', 'VarName216', 'VarName217', 'VarName218', 'VarName219', 'VarName220', 'VarName221', 'VarName222', 'VarName223', 'VarName224', 'VarName225', 'VarName226', 'VarName227', 'VarName228', 'VarName229', 'VarName230', 'VarName231', 'VarName232', 'VarName233', 'VarName234', 'VarName235', 'VarName236', 'VarName237', 'VarName238', 'VarName239', 'VarName240', 'VarName241', 'VarName242', 'VarName243', 'VarName244', 'VarName245', 'VarName246', 'VarName247', 'VarName248', 'VarName249', 'VarName250', 'VarName251', 'VarName252', 'VarName253', 'VarName254', 'VarName255', 'VarName256', 'VarName257'};
% predictors = inputTable(:, predictorNames);
% response = inputTable.Class;
% isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];

% Perform cross-validation
partitionedModel = crossval(trainedClassifier.ClassificationSVM, 'KFold', 5);

% Compute validation predictions
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);

% Compute validation accuracy
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
Test = importfile1('HSIdata1hbinclass.xlsx','Sheet1',2,108);

trainedClassifier
validationAccuracy
trainedClassifier.predictFcn(Test)
save mymodel1 trainedClassifier;
save mytestdata1 Test;
