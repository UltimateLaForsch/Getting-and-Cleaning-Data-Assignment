library(dplyr)
library(data.table)

# Load data
features <- read.table('cousera/DS3/UCI HAR Dataset/features.txt', col.names=c("featureId", "featureLabel"))
X_train <- read.table('cousera/DS3/UCI HAR Dataset/train/X_train.txt', col.names = features$featureLabel)
X_test <- read.table('cousera/DS3/UCI HAR Dataset/test/X_test.txt', col.names = features$featureLabel)
y_train <- read.table('cousera/DS3/UCI HAR Dataset/train/y_train.txt', col.names = "Activity")
y_test <- read.table('cousera/DS3/UCI HAR Dataset/test/y_test.txt', col.names = "Activity")
subject_train <- read.table('cousera/DS3/UCI HAR Dataset/train/subject_train.txt', col.names = "Subject")
subject_test <- read.table('cousera/DS3/UCI HAR Dataset/test/subject_test.txt', col.names = "Subject")
activities <- read.table('cousera/DS3/UCI HAR Dataset/activity_labels.txt', col.names=c("activityId", "activityLabel"))

# Merge data
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
new_df <- cbind(subject, y, X)

 # Eliminate unwanted features & insert descriptive activity names
final_df <- new_df %>%
  select(Subject, Activity, contains("mean"), contains("std"))
final_df$Activity <- activities[final_df$Activity, 2]

# Rename feature columns with more descriptive names
names(final_df)<-gsub("Acc", "Accelerometer", names(final_df))
names(final_df)<-gsub("angle", "Angle", names(final_df))
names(final_df)<-gsub("BodyBody", "Body", names(final_df))
names(final_df)<-gsub("gravity", "Gravity", names(final_df))
names(final_df)<-gsub("Gyro", "Gyroscope", names(final_df))
names(final_df)<-gsub("Mag", "Magnitude", names(final_df))
names(final_df)<-gsub("tBody", "TimeBody", names(final_df))
names(final_df)<-gsub("-freq()", "Frequency", names(final_df), ignore.case = TRUE)
names(final_df)<-gsub("-mean()", "Mean", names(final_df), ignore.case = TRUE)
names(final_df)<-gsub("-std()", "STD", names(final_df), ignore.case = TRUE)
names(final_df)<-gsub("^f", "Frequency", names(final_df))
names(final_df)<-gsub("^t", "Time", names(final_df))
write.table(final_df, "tidy_dataset.txt")

# Generate and save 2nd independent tidy data set with averages for each activity and each subject
second_set <- final_df %>%
      group_by(Subject, Activity) %>%
      summarise_all(funs(mean))
write.table(second_set, "2nd_tidy_dataset.txt", row.names = FALSE)










