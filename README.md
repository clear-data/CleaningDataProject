# CleaningDataProject
Repository for Coursera Getting and Cleaning Data Project

The script run_analysis.R reads previously randomly partitioned test and training data sets from the publically available UCI HAR dataset (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), then merges the data sets and extracts the mean and standard deviation of major signal features.  It subsequently calculates the mean value of these features broken down by subject and activity.  As part of the processing by run_analysis.R, terse alphanumeric feature labels and numeric activity codes in the data are replaced by more informative human-readable labels 

There are no user parameters, and the UCI HAR dataset needs to be downloaded before running the program.

Please read the companion Codebook.md for a complete description of the data manipulation and variables in the final tidy data set.
