function predicted_labels = classifyAppleSpectra(predData) % label = classifyAppleSpectra(HSIspectralDataS2)%sound_signal, sampling_frequency) %#codegen
%Label new observations using trained SVM model Mdl. The function takes 
%sound signal and sampling frequency as input and produces a classification
%of 'Normal' or 'Abnormal'
%Copyright (c) 2016, MathWorks, Inc. 

% Window length for feature extraction in seconds
%%win_len = 5;

% Overlap between adjacent windows in percentage
%%win_overlap = 0;

% Extract features
%%features = extractFeaturesCodegen(sound_signal, sampling_frequency, win_len, win_overlap);
predData = HSIspectralData;

% Load saved model
Mdl = loadCompactModel('latent_BS_Class');%'HeartSoundClassificationModel');
%loadCompactModel('latent_BS_Class');
% Predict classification for all windows
%predicted_labels = predict(Mdl,HSIspectralDataS2); %features);
predicted_labels = latent_BS_Class.predictFcn(predData)
%predicted_labels

% Predict abnormal if even one window sounds abnormal
%  if find(strcmp(predicted_labels, 'B'))%'Abnormal'))
%      predicted_labels = 'B';%'Abnormal';
%  else
%      predicted_labels = 'S';%'Normal';
%  end

end