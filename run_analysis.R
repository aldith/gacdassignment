# Merges the training and the test sets to create one data set
# Don't forget to set the appropriate working directory
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
dim(trainData) 
head(trainData)
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
table(trainLabel)
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
dim(testData) 
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt") 
table(testLabel) 
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
joinData <- rbind(trainData, testData)
dim(joinData) 
joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel) 
joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject) 


# Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("./UCI HAR Dataset/features.txt")
dim(features)  
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanStdIndices) 
joinData <- joinData[, meanStdIndices]
dim(joinData) 
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove "()"
names(joinData) <- gsub("mean", "Mean", names(joinData)) # capitalize M
names(joinData) <- gsub("std", "Std", names(joinData)) # capitalize S
names(joinData) <- gsub("-", "", names(joinData)) # remove "-" in column names 


# Uses descriptive activity names to name the activities in the dataset
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel


# Appropriately labels the data set with descriptive activity names 
names(joinLabel) <- "activity"
names(joinSubject) <- "subject"
cleanData <- cbind(joinSubject, joinLabel, joinData)
dim(cleanData) 
write.table(cleanData, "merged_data.txt") # first dataset


# Creates an independent tidy data set with the average of each variable for each activity and each subject
subjLen <- length(table(joinSubject)) # 30
actLen <- dim(activity)[1] # 6
colLen <- dim(cleanData)[2]
result <- matrix(NA, nrow=subjLen*actLen, ncol=colLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanData)
row <- 1
for(i in 1:subjLen) {
  for(j in 1:actLen) {
    result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    cds <- i == cleanData$subject
    cda <- activity[j, 2] == cleanData$activity
    result[row, 3:colLen] <- colMeans(cleanData[cds&cda, 3:colLen])
    row <- row + 1
  }
}
head(result)
write.table(result, "tidy_data_set.txt") # second dataset
