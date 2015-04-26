##Cleaning and getting data -  codebook

This document describes the code (variables, data, commands) inside the R script run_analysis.R.

Data are from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

<b>How it works</b>

1.	Read (read.table()) information about data-label-subject from both “train” and “test” files
2.	Merge (rbind()) the sets.
3.	3 Read the file features.txt: I am interested in “mean and standard deviation”. Crate a subset of joinData with the newly created list lenght. Tidy up the new data.
4.	Read the file activity_labels.txt and clean it up (lower case, remove underscore, capitalized letter,…). Change joinLabel accordingly.
5.	In order to make the file more readable, create new labels: the first and second columns have now subject (30 volunteers) and activity (6) as names. Join cbind() the new joinData, joinLabel e joinSubject. Create the first dataset (write.table()) called merged_data.txt.
6.	Since I need the average of each measurement for each activity (6) and each subject (30), I put my first dataset in a loop that calculates the mean for each choice. The new dataset goes into a new file (write. table()) called tide_data_set.txt

<b>Variables</b> (as they appear in the R script)

trainData/testData/joinData (marked as X in the different sets)

trainLabel/testLabel/joinLabel (marked as y in the different sets)

trainSubject/testSubject/joinSubject (marked as subject in the different sets)

features (from the features.txt = The features selected for the database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. )

activity/activityLabel (from activity_labels.txt - group of names)

cleanData (result of merging the two data sets and labeling the new dataset )

subjLen/actLen/colLen/result (extract subject and activity from the first dataset, operate a mean function and create a new dataset)

<b>Results</b>

merged_data.txt = first dataset created by merging data from train and test sets and labelling them in a proper manner
tidy_data_set.txt = second dataset created with the average of each measurement for each activity and each subject 
