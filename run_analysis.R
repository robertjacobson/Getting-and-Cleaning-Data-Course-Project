library(dplyr)

# Read data
xTrain <- read.table("./UCI-HAR-Dataset/train/X_train.txt")
yTrain <- read.table("./UCI-HAR-Dataset/train/Y_train.txt")
subTrain <- read.table("./UCI-HAR-Dataset/train/subject_train.txt")
xTest <- read.table("./UCI-HAR-Dataset/test/X_test.txt")
yTest <- read.table("./UCI-HAR-Dataset/test/Y_test.txt")
subTest <- read.table("./UCI-HAR-Dataset/test/subject_test.txt")
varNames <- read.table("./UCI-HAR-Dataset/features.txt")
actLabels <- read.table("./UCI-HAR-Dataset/activity_labels.txt")


# 1. Merges the training and the test sets to create one data set.
xTotal <- rbind(xTrain, xTest)
yTotal <- rbind(yTrain, yTest)
subTotal <- rbind(subTrain, subTest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
selectedVar <- varNames[grep("mean\\(\\)|std\\(\\)",varNames[,2]),]
xTotal <- xTotal[,selectedVar[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
colnames(yTotal) <- "activity"
yTotal$activityLabel <- factor(yTotal$activity, labels = as.character(actLabels[,2]))
activityLabel <- yTotal[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(xTotal) <- varNames[selectedVar[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(subTotal) <- "subject"
total <- cbind(xTotal, activityLabel, subTotal)
totalMean <- total %>% group_by(activityLabel, subject) %>% summarize_all(funs(mean))
write.table(totalMean, file = "./UCI-HAR-Dataset.min.csv", sep=",", row.names = FALSE, col.names = TRUE)