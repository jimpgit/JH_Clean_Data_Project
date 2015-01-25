###Cookbook for the JH Cleaning Data project

This cookbook describes the data dictionary for the tidy data file and information on the experiment and source data files used to create the tidy data file
           
#### Data Dictionary of the tidy data file
      
###### [1] subject
     the subject performing the activity
     range 1 - 30

###### [2] activity
     the activity performed
     range: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

###### [3 - 88] measurements 
     measurements were taken for the following general patterns:  
     
        tBodyAcc-XYZ
        tGravityAcc-XYZ
        tBodyAccJerk-XYZ
        tBodyGyro-XYZ
        tBodyGyroJerk-XYZ
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ
        fBodyAccJerk-XYZ
        fBodyGyro-XYZ
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag

    the set of variables that were estimated for these general measurements: 

        mean():     Mean value
        std():      Standard deviation
        meanFreq(): Weighted average of the frequency components to obtain a mean
                    frequency

    Additional vectors obtained by averaging the measurements in a signal window 
    sample. These are used on the angle() variable:

        gravityMean
        tBodyAccMean
        tBodyAccJerkMean
        tBodyGyroMean
        tBodyGyroJerkMean

     This is the list of the 86 measurement columns in the tidy data file: 

        [ 3] tBodyAcc_mean_X                     
        [ 4] tBodyAcc_mean_Y                     
        [ 5] tBodyAcc_mean_Z                      
        [ 6] tGravityAcc_mean_X                  
        [ 7] tGravityAcc_mean_Y                   
        [ 8] tGravityAcc_mean_Z                  
        [ 9] tBodyAccJerk_mean_X                  
        [10] tBodyAccJerk_mean_Y                 
        [11] tBodyAccJerk_mean_Z                  
        [12] tBodyGyro_mean_X                    
        [13] tBodyGyro_mean_Y                     
        [14] tBodyGyro_mean_Z                    
        [15] tBodyGyroJerk_mean_X                 
        [16] tBodyGyroJerk_mean_Y                
        [17] tBodyGyroJerk_mean_Z                 
        [18] tBodyAccMag_mean                    
        [19] tGravityAccMag_mean                  
        [20] tBodyAccJerkMag_mean                
        [21] tBodyGyroMag_mean                    
        [22] tBodyGyroJerkMag_mean               
        [23] fBodyAcc_mean_X                      
        [24] fBodyAcc_mean_Y                     
        [25] fBodyAcc_mean_Z                      
        [26] fBodyAcc_meanFreq_X                 
        [27] fBodyAcc_meanFreq_Y                  
        [28] fBodyAcc_meanFreq_Z                 
        [29] fBodyAccJerk_mean_X                  
        [30] fBodyAccJerk_mean_Y                 
        [31] fBodyAccJerk_mean_Z                  
        [32] fBodyAccJerk_meanFreq_X             
        [33] fBodyAccJerk_meanFreq_Y              
        [34] fBodyAccJerk_meanFreq_Z             
        [35] fBodyGyro_mean_X                     
        [36] fBodyGyro_mean_Y                    
        [37] fBodyGyro_mean_Z                     
        [38] fBodyGyro_meanFreq_X                
        [39] fBodyGyro_meanFreq_Y                 
        [40] fBodyGyro_meanFreq_Z                
        [41] fBodyAccMag_mean                     
        [42] fBodyAccMag_meanFreq                
        [43] fBodyAccJerkMag_mean                 
        [44] fBodyAccJerkMag_meanFreq            
        [45] fBodyGyroMag_mean                    
        [46] fBodyGyroMag_meanFreq               
        [47] fBodyGyroJerkMag_mean                
        [48] fBodyGyroJerkMag_meanFreq           
        [49] tBodyAcc_std_X                       
        [50] tBodyAcc_std_Y                      
        [51] tBodyAcc_std_Z                       
        [52] tGravityAcc_std_X                   
        [53] tGravityAcc_std_Y                    
        [54] tGravityAcc_std_Z                   
        [55] tBodyAccJerk_std_X                   
        [56] tBodyAccJerk_std_Y                  
        [57] tBodyAccJerk_std_Z                   
        [58] tBodyGyro_std_X                     
        [59] tBodyGyro_std_Y                      
        [60] tBodyGyro_std_Z                     
        [61] tBodyGyroJerk_std_X                  
        [62] tBodyGyroJerk_std_Y                 
        [63] tBodyGyroJerk_std_Z                  
        [64] tBodyAccMag_std                     
        [65] tGravityAccMag_std                   
        [66] tBodyAccJerkMag_std                 
        [67] tBodyGyroMag_std                     
        [68] tBodyGyroJerkMag_std                
        [69] fBodyAcc_std_X                       
        [70] fBodyAcc_std_Y                      
        [71] fBodyAcc_std_Z                       
        [72] fBodyAccJerk_std_X                  
        [73] fBodyAccJerk_std_Y                   
        [74] fBodyAccJerk_std_Z                  
        [75] fBodyGyro_std_X                      
        [76] fBodyGyro_std_Y                     
        [77] fBodyGyro_std_Z                      
        [78] fBodyAccMag_std                     
        [79] fBodyAccJerkMag_std                  
        [80] fBodyGyroMag_std                    
        [81] fBodyGyroJerkMag_std                 
        [82] angle_tBodyAccMean_gravity          
        [83] angle_tBodyAccJerkMean_gravityMean   
        [84] angle_tBodyGyroMean_gravityMean     
        [85] angle_tBodyGyroJerkMean_gravityMean  
        [86] angle_X_gravityMean                 
        [87] angle_Y_gravityMean                  
        [88] angle_Z_gravityMean 
####The experiment and the source data files

######The data came from an experiment with the following details:

- subjects:
   a group of 30 volunteers within an age bracket of 19-48 years performed activities
- activities:
   six activities were performed: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING wearing a smartphone (Samsung Galaxy S II) on the waist and measurements were taken
- features (measurements):
   561 different measurements were taken using an embedded accelerometer and gyroscope, data capture consited of 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

######The source data came from the following data files:
- subject_train.txt / subject_test.txt:
   each row identifies the subject who performed the given activity. Its range is from 1 to 30
- activity_labels.txt:
   list of the 6 activities performed: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- y_train.txt / y_test.txt:
   each row identifies the given activity performed by the subject.  Its range is from 1 to 6
- X_train.txt / X_test:
   each row contains the the 561 measurements for the given subject and activity
- features.txt:
   list of the 561 features that were measured


######For more information on the study and the data files:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

####Creation of the tidy data file
      
###### 1. the  training and the test sets were merged to create one data set
   
a. created the subject column with header "subject" from the subject_train.txt / subject_test.txt
       
       Note: this resulted in a data frame 1029 by 1

c. created the activity column with header "activity" from the y_train.txt / y_test.txt files
       
       Note: this resulted in a data frame 1029 by 1

d. created the measurement columns from the X_train.txt / X_test files using the headers from the features.txt file
       
       Note: this resulted in a data frame 1029 by 561

e. merged the above columns into one dataframe
       
       Note: this resulted in a data frame 1029 by 563


###### 2. Extracted the measurements on the mean and standard deviation for each measurement

    Note: only measurements that contained the words: "mean", "Mean", or "std" were selected

###### 3. Added descriptive activity names to the activities in the data set replacing the numeric value that was in the column

    Note: the activity names were left as is, they were not modified

###### 4. Labeled the data set measurement columns with descriptive variable names, correcting bad names as needed

    Note: "(", ")", ",", and "-" were changed to "_"
          names with "BodyBody" were changed to "Body"
          no other changes were made to the column names

###### 5. Created the tidy data set with average of each variable for each activity and each subject

    Note: this results in a data frame 180 by 88:
          - 6 rows for each of the 30 subjects
          - 2 columns, one each for subject and activity 
          - 86 columns for the measurements that contained mean and std
           










