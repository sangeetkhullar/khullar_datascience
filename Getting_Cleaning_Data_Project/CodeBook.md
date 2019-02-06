CodeBook.md


Data:
====

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The below listed features are AVERAGED for a given subject and a given activity


Variables:
=========

activity_name
subject_id
tBodyAcc_mean_X_Avg
tBodyAcc_mean_Y_Avg
tBodyAcc_mean_Z_Avg
tBodyAcc_std_X_Avg
tBodyAcc_std_Y_Avg
tBodyAcc_std_Z_Avg
tGravityAcc_mean_X_Avg
tGravityAcc_mean_Y_Avg
tGravityAcc_mean_Z_Avg
tGravityAcc_std_X_Avg
tGravityAcc_std_Y_Avg
tGravityAcc_std_Z_Avg
tBodyAccJerk_mean_X_Avg
tBodyAccJerk_mean_Y_Avg
tBodyAccJerk_mean_Z_Avg
tBodyAccJerk_std_X_Avg
tBodyAccJerk_std_Y_Avg
tBodyAccJerk_std_Z_Avg
tBodyGyro_mean_X_Avg
tBodyGyro_mean_Y_Avg
tBodyGyro_mean_Z_Avg
tBodyGyro_std_X_Avg
tBodyGyro_std_Y_Avg
tBodyGyro_std_Z_Avg
tBodyGyroJerk_mean_X_Avg
tBodyGyroJerk_mean_Y_Avg
tBodyGyroJerk_mean_Z_Avg
tBodyGyroJerk_std_X_Avg
tBodyGyroJerk_std_Y_Avg
tBodyGyroJerk_std_Z_Avg
tBodyAccMag_mean_Avg
tBodyAccMag_std_Avg
tGravityAccMag_mean_Avg
tGravityAccMag_std_Avg
tBodyAccJerkMag_mean_Avg
tBodyAccJerkMag_std_Avg
tBodyGyroMag_mean_Avg
tBodyGyroMag_std_Avg
tBodyGyroJerkMag_mean_Avg
tBodyGyroJerkMag_std_Avg
fBodyAcc_mean_X_Avg
fBodyAcc_mean_Y_Avg
fBodyAcc_mean_Z_Avg
fBodyAcc_std_X_Avg
fBodyAcc_std_Y_Avg
fBodyAcc_std_Z_Avg
fBodyAcc_meanFreq_X_Avg
fBodyAcc_meanFreq_Y_Avg
fBodyAcc_meanFreq_Z_Avg
fBodyAccJerk_mean_X_Avg
fBodyAccJerk_mean_Y_Avg
fBodyAccJerk_mean_Z_Avg
fBodyAccJerk_std_X_Avg
fBodyAccJerk_std_Y_Avg
fBodyAccJerk_std_Z_Avg
fBodyAccJerk_meanFreq_X_Avg
fBodyAccJerk_meanFreq_Y_Avg
fBodyAccJerk_meanFreq_Z_Avg
fBodyGyro_mean_X_Avg
fBodyGyro_mean_Y_Avg
fBodyGyro_mean_Z_Avg
fBodyGyro_std_X_Avg
fBodyGyro_std_Y_Avg
fBodyGyro_std_Z_Avg
fBodyGyro_meanFreq_X_Avg
fBodyGyro_meanFreq_Y_Avg
fBodyGyro_meanFreq_Z_Avg
fBodyAccMag_mean_Avg
fBodyAccMag_std_Avg
fBodyAccMag_meanFreq_Avg
fBodyBodyAccJerkMag_mean_Avg
fBodyBodyAccJerkMag_std_Avg
fBodyBodyAccJerkMag_meanFreq_Avg
fBodyBodyGyroMag_mean_Avg
fBodyBodyGyroMag_std_Avg
fBodyBodyGyroMag_meanFreq_Avg
fBodyBodyGyroJerkMag_mean_Avg
fBodyBodyGyroJerkMag_std_Avg
fBodyBodyGyroJerkMag_meanFreq_Avg



Transformations: 
===============

	
	1) Data is combined with the Subject ID for the training data set 
	2) Data is combined with the Subject ID for the test data set 
	3) The data is then merged together from Training and Test data sets above
	4) Only MEAD and STD variables are selecetd from the above data set for all ROWS
	5) The dataset is then joined to activity_label data set - to get descriptive activity label names
	6) Data is grouped by subject_id and activity_id and a MEAN is calculated for all variables by the subject and activity group
	7) The variables are given descriptive labels from the features file
	8) Data is written into a CSV file tidy.csv




4) You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.