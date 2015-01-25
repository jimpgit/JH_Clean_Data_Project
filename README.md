#### JH Cleaning Data class project - 1/23/15

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare a tidy data file that can be used for later analysis

The script, "run_analysis.R", contains all the R code necessary to create the tidy data file

######The following data files were used as input

    Note: The "UCI HAR Dataset" directory contains the data files and MUST be in
    the working directory

* UCI HAR Dataset/features.txt
   
* UCI HAR Dataset/activity_labels.txt
   
* UCI HAR Dataset/test/X_test.txt
   
* UCI HAR Dataset/test/subject_test.txt
   
* UCI HAR Dataset/test/y_test.txt
   
* UCI HAR Dataset/train/X_train.txt
   
* UCI HAR Dataset/train/subject_train.txt
   
* UCI HAR Dataset/train/y_train.txt

######To run the script to create the tidy data file:

1. load the script: "run_analysis.R" into your working directory
2. create the directory "data" in your working directory and load the data files into it
3. execute the script: "run_analysis.R"

######Programming notes:

1. the code was written to emphasize clarity and intermediate data frames were kept
2. individual "gsub" statements were used, regular expressions would reduce the number of them but this was not done
      
#### Activities performed in the script      
      
###### 1. Merge the training and the test sets to create one data set

a. read in the files
   
       Note: subject data, activity data, and measurement data for the features
   
b. create subject column with header "subject"
       
       Note: this results in a data frame 1029 by 1

c. create activity column with header "activity"
       
       Note: this results in a data frame 1029 by 1

d. create measurement column with headers from features.txt
       
       Note: this results in a data frame 1029 by 561

e. merge the columns into the dataframe
       
       Note: this results in a data frame 1029 by 563


###### 2. Extract the measurements on the mean and standard deviation for each measurement

    Note: any measurement with "mean", "Mean", or "std" were selected

###### 3. Add descriptive activity names to the activities in the data set

    Note: the activity names were left as is, they were not modified

###### 4. Label the data set with descriptive variable names

    Note: "(", ")", ",", and "-" were changed to "_"
          names containing "BodyBody" were changed to "Body"
          no other changes were made to the column names

###### 5. Create tidy data set with average of each variable for each activity and each subject

    Note: this results in a data frame 180 by 88

###### 6. Upload the tidy data set as a txt file

    Note: use "write.table" with "row.name=FALSE"

###### 7. Restore the tidy data set from the text file and verify it

    Note: ues "read.table" with "header = TRUE"







