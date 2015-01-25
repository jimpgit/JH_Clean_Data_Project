#####################################################################
#
# JH Cleaning Data class project - 1/23/15
#
# The purpose of this project is to collect, work with, and clean a data 
# set. The goal is to prepare a tidy data file that can be used for later 
# analysis
#
# This script, "run_analysis.R", contains all the R code necessary to create 
# the tidy data file
#
# The following data files were used as input
#
#   Note: The "UCI HAR Dataset" directory contains the data files and MUST 
#         be in the working directory:
#
#   "UCI HAR Dataset/features.txt"        
#   "UCI HAR Dataset/activity_labels.txt"  
#   "UCI HAR Dataset/test/X_test.txt"
#   "UCI HAR Dataset/test/subject_test.txt"    
#   "UCI HAR Dataset/test/y_test.txt"   
#   "UCI HAR Dataset/train/X_train.txt"
#   "UCI HAR Dataset/train/subject_train.txt"   
#   "UCI HAR Dataset/train/y_train.txt"
#
# To create the tidy data file:
#
#   1. load the script: "run_analysis.R" into your working directory
#   2. create the directory "data" in your working directory and load the 
#      data files into it
#   3. execute the script: "run_analysis.R"
#
# Programming notes:
#   1. the code was written to emphasize clarity and intermediate data frames
#      were kept
#   2. individual "gsub" statements were used, regular expressions would 
#      reduce the number of them but this was not done

install.packages("plyr")
library(plyr)

#####################################################################
# 1. Merge the training and the test sets to create one data set
#####################################################################
# a. read in the files
# subject data   
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")  
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
# activity data
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
# measurement data for the features
features <- read.table("UCI HAR Dataset/features.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")   
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")

# b. create subject column with header "subject"
#    Note: this results in a data frame 1029 by 1
subject_c <- subject_train
subject_c <- rbind(subject_c, subject_test)
colnames(subject_c) <- "subject"

# b. create activity column with header "activity"
#    Note: this results in a data frame 1029 by 1
activity_c <- y_train
activity_c <- rbind(activity_c, y_test)
colnames(activity_c) <- "activity"

# d. create measurement column with headers from features.txt
#    Note: this results in a data frame 1029 by 561
measurements_c <- X_train
measurements_c <- rbind(measurements_c, X_test)
feature_h <- features[,2]
colnames(measurements_c) <- feature_h

# e. merge the columns into the dataframe
#    Note: this results in a data frame 1029 by 563
merged_df <- cbind(subject_c, activity_c)
merged_df <- cbind(merged_df, measurements_c)

#####################################################################
# 2. Extract only the measurements on the mean and standard deviation 
#    for each measurement 
#
#    Note: any measurement with "mean", "Mean", or "std" was selected
#####################################################################
mean_c <- grep("mean", features$V2, value=TRUE)
Mean_c <- grep("Mean", features$V2, value=TRUE)
std_c <- grep("std", features$V2, value=TRUE)
good_names <- c("subject", "activity", mean_c, std_c, Mean_c)
mean_std_df <- subset(merged_df, select=good_names)

#####################################################################
# 3. Add descriptive activity names to name the activities in the data set
#
#    Note: the activity names were left as is, they were not modified
#####################################################################
mean_std_df$activity <- gsub("1", "WALKING", mean_std_df$activity)
mean_std_df$activity <- gsub("2", "WALKING_UPSTAIRS", mean_std_df$activity)
mean_std_df$activity <- gsub("3", "WALKING_DOWNSTAIRS", mean_std_df$activity)
mean_std_df$activity <- gsub("4", "SITTING", mean_std_df$activity)
mean_std_df$activity <- gsub("5", "STANDING", mean_std_df$activity)
mean_std_df$activity <- gsub("6", "LAYING", mean_std_df$activity)

#####################################################################
# 4. Label the data set with descriptive variable names
#
#    Note: "(", ")", ",", and "-" were changed to "_"
#          names with "BodyBody" were changed to "Body"
#          no other changes were made to the column names
#####################################################################
clean_names <- good_names
clean_names <- gsub("\\(", "_", clean_names)
clean_names <- gsub("\\)", "_", clean_names)
clean_names <- gsub("-", "_", clean_names)
clean_names <- gsub(",", "_", clean_names)
clean_names <- gsub("___", "_", clean_names)
clean_names <- gsub("__", "_", clean_names)
clean_names <- gsub("_$", "", clean_names)
clean_names <- gsub("BodyBody", "Body", clean_names)

colnames(mean_std_df) <- clean_names

#####################################################################
# 5. From the data set in step 4, create a second, independent tidy data 
#    set with the average of each variable for each activity and each 
#    subject
#
#    Note: this results in a data frame 180 by 88
#####################################################################
tidy_df <- ddply(mean_std_df, .(subject, activity), numcolwise(mean))
dim(tidy_df)

#####################################################################
# 6. Upload the tidy data set as a txt file
#
#    Note: use "write.table" with "row.name=FALSE"
#####################################################################
write.table(tidy_df, "tidy_df_JSP_012315_v1.txt", row.name=FALSE )

#####################################################################
# 7. Restore the tidy data set from the text file and verify it
#
#    Note: ues "read.table" with "header = TRUE"
#####################################################################
data_file_df <- read.table("tidy_df_JSP_012315_v1.txt", 
                           header = TRUE)
View(data_file_df)



