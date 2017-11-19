# Getting and Cleaning Data: Week 4 Assignment

This repo was created to satisfy the week 4 assignment of Getting and Cleaning Data.

# Requirements:
* Load `training` and `test` datasets into local R environment. 
* Load activity labels. _Provided by `activity_labels.txt`_. 
* Load subject readings. 
* Combine training and test mean datasets.
* Filter additional columns.

### Process: 
1. Merges the `training` and the `test` sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Convert activity labels to characters and add a new column as factor
4. Give the selected descriptive names to variable columns
5. Generate tidy data set `UCI-HAR-Dataset.min.csv` with the average of each variable for each activity and each subject.

# Recreating a tidy data set
1. Clone/Download/Fork the repo
2. Ensure the `dplyr` lib is installed
    > `install.packages("dplyr")` 
2. Run `run_analysis.R` and `UCI-HAR-Dataset.min.csv` will be regenerated.