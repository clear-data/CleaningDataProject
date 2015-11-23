## run_analysis.R
## Script processes two sets of raw data files into a single tidy data set
## Requires dplyr and tidyr packages.

## Set working directory
setwd("~/coursera/Getting and Cleaning Data/W3 Project/UCI HAR Dataset")

## Set desired X_ data column numbers and Names
# Just X_train and X_test numbers
colNum <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)

# All desired column names, including Subject_ID and Activity
ColumnNames <- c("Subject_ID", "Activity", "time_domain_body_accelerometer_X-axis_mean", "time_domain_body_accelerometer_Y-axis_mean", "time_domain_body_accelerometer_Z-axis_mean", "time_domain_body_accelerometer_X-axis_std", "time_domain_body_accelerometer_Y-axis_std", "time_domain_body_accelerometer_Z-axis_std", "time_domain_gravity_accelerometer_X-axis_mean", "time_domain_gravity_accelerometer_Y-axis_mean", "time_domain_gravity_accelerometer_Z-axis_mean", "time_domain_gravity_accelerometer_X-axis_std", "time_domain_gravity_accelerometer_Y-axis_std", "time_domain_gravity_accelerometer_Z-axis_std", "time_domain_body_accelerometer_Jerk_X-axis_mean", "time_domain_body_accelerometer_Jerk_Y-axis_mean", "time_domain_body_accelerometer_Jerk_Z-axis_mean", "time_domain_body_accelerometer_Jerk_X-axis_std", "time_domain_body_accelerometer_Jerk_Y-axis_std", "time_domain_body_accelerometer_Jerk_Z-axis_std", "time_domain_body_gyroscope_X-axis_mean", "time_domain_body_gyroscope_Y-axis_mean", "time_domain_body_gyroscope_Z-axis_mean", "time_domain_body_gyroscope_X-axis_std", "time_domain_body_gyroscope_Y-axis_std", "time_domain_body_gyroscope_Z-axis_std", "time_domain_body_gyroscope_Jerk_X-axis_mean", "time_domain_body_gyroscope_Jerk_Y-axis_mean", "time_domain_body_gyroscope_Jerk_Z-axis_mean", "time_domain_body_gyroscope_Jerk_X-axis_std", "time_domain_body_gyroscope_Jerk_Y-axis_std", "time_domain_body_gyroscope_Jerk_Z-axis_std", "time_domain_body_accelerometer_magnitude_mean", "time_domain_body_accelerometer_magnitude_std", "time_domain_gravity_accelerometer_magnitude_mean", "time_domain_gravity_accelerometer_magnitude_std", "time_domain_gravity_accelerometer_jerk_magnitude_mean", "time_domain_gravity_accelerometer_jerk_magnitude_std", "time_domain_body_gyroscope_magnitude_mean", "time_domain_body_gyroscope_magnitude_std", "time_domain_body_gyroscope_jerk_magnitude_mean", "time_domain_body_gyroscope_jerk_magnitude_std", "fft_domain_body_accelerometer_X-axis_mean", "fft_domain_body_accelerometer_Y-axis_mean", "fft_domain_body_accelerometer_Z-axis_mean", "fft_domain_body_accelerometer_X-axis_std", "fft_domain_body_accelerometer_Y-axis_std", "fft_domain_body_accelerometer_Z-axis_std", "fft_domain_body_accelerometer_jerk_X-axis_mean", "fft_domain_body_accelerometer_jerk_Y-axis_mean", "fft_domain_body_accelerometer_jerk_Z-axis_mean", "fft_domain_body_accelerometer_jerk_X-axis_std", "fft_domain_body_accelerometer_jerk_Y-axis_std", "fft_domain_body_accelerometer_jerk_Z-axis_std", "fft_domain_body_gyroscope_X-axis_mean", "fft_domain_body_gyroscope_Y-axis_mean", "fft_domain_body_gyroscope_Z-axis_mean", "fft_domain_body_gyroscope_X-axis_std", "fft_domain_body_gyroscope_Y-axis_std", "fft_domain_body_gyroscope_Z-axis_std", "fft_domain_body_accelerometer_magnitude_mean", "fft_domain_body_accelerometer_magnitude_std", "fft_domain_body_accelerometer_jerk_magnitude_mean", "fft_domain_body_accelerometer_jerk_magnitude_std", "fft_domain_body_gyroscope_magnitude_mean", "fft_domain_body_gyroscope_magnitude_std", "fft_domain_body_gyroscope_jerk_magnitude_mean", "fft_domain_body_gyroscope_jerk_magnitude_std")
        
## Read test data file
X_test <- tbl_df(read.table("test/X_test.txt", sep=""))
## 2. Extract mean and std sensor measurements only
X_test <- X_test[,colNum]

## Read test activity and subject data
y_test <- tbl_df(read.table("test/y_test.txt", sep=""))
subject_test <- tbl_df(read.table("test/subject_test.txt", sep=""))

## Merge subject, activity, and measurements
testData <- bind_cols(subject_test, y_test, X_test)

## Assemble training data frame

## Read training data file
X_train <- read.table("train/X_train.txt", sep="")
## 2. Extract mean and std sensor measurements only
X_train <- X_train[,colNum]

## Read training activity and subject data
y_train <- read.table("train/y_train.txt", sep="")
subject_train <- read.table("train/subject_train.txt", sep="")

## Merge subject, activity, and measurements
trainData <- cbind(subject_train, y_train, X_train)

## 1. Merge test and training data frames
fullData <- rbind(testData, trainData)
        
## 3. Add descriptive activity names
for (index in 1:10299) {
        
        if(fullData[index,2]==1) {fullData[index,2]="WALKING"}
        if(fullData[index,2]==2) {fullData[index,2]="WALKING_UPSTAIRS"}
        if(fullData[index,2]==3) {fullData[index,2]="WALKING_DOWNSTAIRS"}
        if(fullData[index,2]==4) {fullData[index,2]="SITTING"}
        if(fullData[index,2]==5) {fullData[index,2]="STANDING"}
        if(fullData[index,2]==5) {fullData[index,2]="LAYING"}
        
}

## 4. Label with descriptive variable names
colnames(fullData) <- ColumnNames

temp <- head(fullData)
print(temp)

## 5. Create a second, independent tidy data set with 
## the average of each variable for each activity and each subject.

# by_activity_subject <- group_by(FullData, Activity, Subject_ID)
# summarize(by_activty_subject, mean(size)) 



## Write out result
# write.table(tidySet2, "TidySet2.txt", row.name =FALSE)

