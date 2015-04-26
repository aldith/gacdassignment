                                      Cleaning and getting data -  course project

The purpose of this project is to to collect, work with, and clean a data set, in order to prepare tidy data that can be used for later analysis.

                                                    About data

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Sample: a group of 30 volunteers within an age bracket of 19-48 years

Activities: Walking, Walking upstairs, Walking downstairs, Sitting, Standing, Laying

Smartphone: Samsung Galaxy S II

Data collection: Using the embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz have been captured. The experiments have been video-recorded to label the data manually. 

Dataset: Randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

                                                         Steps

1.	Download and unzip the data. Make sure your working directory contains the dataset.
2.	Merges the training and the test sets to create one data set (merged_data.txt).  
3.	Extracts only the measurements on the mean and standard deviation for each measurement.  
4.	Uses descriptive activity names to name the activities in the data set  
5.	Appropriately labels the data set with descriptive variable names.  
6.	From the data set in step 4, creates a second, independent tidy data set with the average of each  variable for each activity and each subject (tidy_data_set.txt). 
The R script run_analysis.R illustrates all these steps

                                                  Documents in this repo

READ.ME = Describes the data, the goal of the project and the steps taken to achieve the goal
CodeBook.md = describes the variables, the data, and any transformations or work performed to clean up the data.
run_analysis.R = include the procedure followed to clean data

                                                          Source

Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Data obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

