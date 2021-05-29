# Codebook: Getting-and-Cleaning-Data-Assignment

## Data
The underlying dataset is called 'Human Activity Recognition Using Smartphones Data Set' and can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Further description of the data collecting:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Variables
Relevant variables of the data are the following:
  - 30 subjects
  - 6 activities (labels)
  - 561 Features
  - 10299 datatest (divided in a train and test dataset), each belonging to a subject, an activity as well as a feature
  
  
## Process
1. Dowload the data to a local location 
2. Read all relevant data into memory
3. Merge the train and test data of the features, filtering out the not needed features
4. Replace the column names with descriptive names of the features
5. Merge the train and test data of the activties and name the activity columns
6. Merge the train and test data of the subjects and name the subject column
7. Merge the data from step 4-6, to a tidy data set
8. Based on the tidy data set, create a 2nd data set which shows the average of each feature for each activity and each subject, respectively
