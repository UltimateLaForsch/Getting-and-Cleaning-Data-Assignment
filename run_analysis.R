library(dplyr)
library(data.table)

# Load train data
X_train <- read.table('cousera/DS3/UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('cousera/DS3/UCI HAR Dataset/train/y_train.txt', header = FALSE)
subject_train <- read.table('cousera/DS3/UCI HAR Dataset/train/subject_train.txt', header = FALSE)

# Load test data
X_test <- read.table('cousera/DS3/UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('cousera/DS3/UCI HAR Dataset/test/y_test.txt', header = FALSE)
subject_test <- read.table('cousera/DS3/UCI HAR Dataset/test/subject_test.txt', header = FALSE)

# Load features
features <- read.table('cousera/DS3/UCI HAR Dataset/features.txt',
                  col.names=c("featureId", "featureLabel"))
wanted_features <- grep("-mean\\(\\)|-std\\(\\)", features$featureLabel)

# Load activities
activities <- read.table('cousera/DS3/UCI HAR Dataset/features.txt',
                  col.names=c("activityId", "activityLabel"))

# Merge X data, eliminate unwanted features and name columns
X <- rbind(X_train, X_test)
X <- X[, wanted_features]
names(X) <- gsub("\\(|\\)", "", features$featureLabel[wanted_features])
# Merge y data
Y <- rbind(y_train, y_test)
names(Y) <- "activityId"
activity <- left_join(Y, activities, by="activityId")
# Merge subject data
subject <- rbind(subject_train, subject_test)
names(subject) <- "subjectId"

# Final merge and save all sub-result data to one data table
final_dataset <- cbind(subject, X, activity)
write.table(final_dataset, "tidy_dataset.txt")

# Generate and save 2nd independent tidy data set with averages for each activity and each subject
second_set <- final_dataset %>%
      group_by(subjectId, activityLabel) %>%
      summarise_all(funs(mean))
write.table(second_set, "2nd_tidy_dataset.txt", row.names = FALSE)










