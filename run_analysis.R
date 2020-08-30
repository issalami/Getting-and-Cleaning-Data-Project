# set working directory
setwd("~/GitHub/Getting and Cleaning Data Project/UCI HAR Dataset")

# load data
library(data.table)

y_test <- read.table("test/y_test.txt")
X_test <- read.table("test/X_test.txt")
subject_test <- read.table("test/subject_test.txt")

y_train <- read.table("train/y_train.txt")
X_train <- read.table("train/X_train.txt")
subject_train <- read.table("train/subject_train.txt")

feature_names <- read.table("features.txt")
activitylabels <- read.table("activity_labels.txt")

# merge data
subject <- rbind(subject_train, subject_test); names(subject) <- c("subject")
activity <- rbind(y_train, y_test); names(activity) <- c("activity")
features <- rbind(X_train, X_test); names(features) <- feature_names$V2

alldata <- cbind(subject, activity, features)

# extract required features- measurements on the mean and standard deviation
required_features <- grep("-(mean|std)\\(\\)", names(alldata))
required_data <- alldata[,c(1,2,required_features)]

# name the activities in the data set
required_data$activity <- factor(required_data$activity, labels= tolower(activitylabels$V2))

# labels the data set with descriptive variable names.
library(stringr)
names(required_data) <- gsub("^t", "time_", names(required_data))
names(required_data) <- gsub("^f", "frequency_", names(required_data))
names(required_data) <- str_replace_all(names(required_data), "BodyBody", "Body")
names(required_data) <- gsub("Gravity", "Gravity_", names(required_data))
names(required_data) <- gsub("Body", "Body_", names(required_data))
names(required_data) <- gsub("()", "", names(required_data))
names(required_data) <- str_replace_all(names(required_data), "\\(.*\\)", "")
names(required_data) <- gsub("Acc", "Accelerometer", names(required_data))
names(required_data) <- gsub("Gyro", "Gyroscope", names(required_data))
names(required_data) <- gsub("Mag", "Magnitutde", names(required_data))
names(required_data)

# tidy data set with the average of each variable for each activity and each subject.
required_data<-data.table(required_data)
tidy_data <- required_data[,lapply(.SD,mean),by="activity,subject"]
write.table(tidy_data, file="tidy_data.txt", row.name=FALSE, col.names=TRUE)
