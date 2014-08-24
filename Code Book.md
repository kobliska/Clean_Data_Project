---
title: "Code Book"
author: "R Kobliska"
date: "Saturday, August 23, 2014"
output: html_document
---

A description of the experiment on the use of Samsung smartphones to monitor physical activities is located at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   
The data is from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
From the readme file we have a brief synopsis of experiment:  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

The datasets are:

*  'features_info.txt': Shows information about the variables used on the feature vector.
*  'features.txt': List of all features.
*  'activity_labels.txt': Links the class labels with their activity name.
*  'train/X_train.txt': Training set.
*  'train/y_train.txt': Training labels.
*  'test/X_test.txt': Test set.
*  'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Analysis:

  1.   The data was read in from my working directory using read.table. 
  
  2.	The  dim and str  of the various tables were  analyzed to determine how they fit together.
  
  3.	The training and test data sets for the x data, y data, and subject data were combined using rbind.
  
  4.	These were then combined into a master_table.
  
  5.	The column names were extracted from the features file and affixed to master_table using colnames.
  
  6.	The mean() and std() column names were found using grepl on the features file.  The fixed=TRUE option was used so that only columns with exactly mean() or std() were selected.
  
  7.	The descriptive activity names were then added to master_table by using grep commands.
  
  8.	The average of the means and stds for each subject for each activity was done using aggregate commands.
  
  Resultant dataframe is 6x30=180 rows.  The column variables are listed below.



Definitions of variables for the submitted tidy table along with more descriptive labels.

* "tBodyAcc-mean()-X"
* "tBodyAcc-mean()-Y"
* "tBodyAcc-mean()-Z"
* "tGravityAcc-mean()-X" 
* "tGravityAcc-mean()-Y"
* "tGravityAcc-mean()-Z"
* "tBodyAccJerk-mean()- X"
*  "tBodyAccJerk-mean()- Y"
*  "tBodyAccJerk-mean()- Z"      
*  "tBodyGyro-mean()-X"
* "tBodyGyro-mean()-Y"
* "tBodyGyro-mean()-Z"         
*  "tBodyGyroJerk-mean()-X"
* "tBodyGyroJerk-mean()-Y"
* "tBodyGyroJerk-mean()-Z"
*  "tBodyAccMag-mean()"
* "tGravityAccMag-mean()"
* "tBodyAccJerkMag-mean()"     
*  "tBodyGyroMag-mean()"
* "tBodyGyroJerkMag-mean()"
* "fBodyAcc-mean()-X"          
*  "fBodyAcc-mean()-Y"
* "fBodyAcc-mean()-Z"
* "fBodyAccJerk-mean()-X"      
*  "fBodyAccJerk-mean()-Y"
* "fBodyAccJerk-mean()-Z"
* "fBodyGyro-mean()-X"         
*  "fBodyGyro-mean()-Y" 
* "fBodyGyro-mean()-Z" 
* "fBodyAccMag-mean()" 
*  "fBodyBodyAccJerkMag-mean()"
* "fBodyBodyGyroMag-mean()"
* "fBodyBodyGyroJerkMag-mean()"
*  "tBodyAcc-std()-X"
* "tBodyAcc-std()-Y"
* "tBodyAcc-std()-Z"           
*  "tGravityAcc-std()-X"
* "tGravityAcc-std()-Y"
* "tGravityAcc-std()-Z"        
*  "tBodyAccJerk-std()-X"
* "tBodyAccJerk-std()-Y"
* "tBodyAccJerk-std()-Z"       
*  "tBodyGyro-std()-X"
* "tBodyGyro-std()-Y"
* "tBodyGyro-std()-Z"          
*  "tBodyGyroJerk-std()-X"
* "tBodyGyroJerk-std()-Y" 
* "tBodyGyroJerk-std()-Z"      
*  "tBodyAccMag-std()"
* "tGravityAccMag-std()"
* "tBodyAccJerkMag-std()"      
*  "tBodyGyroMag-std()"
* "tBodyGyroJerkMag-std()"
* "fBodyAcc-std()-X"           
*  "fBodyAcc-std()-Y"
* "fBodyAcc-std()-Z"
* "fBodyAccJerk-std()-X"       
*  "fBodyAccJerk-std()-Y"
* "fBodyAccJerk-std()-Z"
* "fBodyGyro-std()-X"          
*  "fBodyGyro-std()-Y"
* "fBodyGyro-std()-Z"
* "fBodyAccMag-std()"          
*  "fBodyBodyAccJerkMag-std()"
* "fBodyBodyGyroMag-std()"
* "fBodyBodyGyroJerkMag-std()" 

The units of the ACC variables is standard g's.  The units of Gyro variables is radians per second.
Features are normalized and bounded within [-1,1].
