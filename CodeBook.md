# Human Activity Recognition Using Smartphones Dataset

## Data Set
The data is taken from 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
It contains the results of an experiments carried out with a group of 30 subjects each performing six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
The features correspond to the (pre-processed) output of various accelerometers and gyroscope.

## Processing - getting the mean (df.HAR)
From this data we create a new data frame df.HAR. This data frame contains both the train and test set.
The columns of this data frames are:
  - subject ID, 
  - activity, 
  - mean each measurement,
  - standard deviation of each measurement.
  
 To do so, we proceed as follows:
 
  1) Download and unzip the data set using the link above
  2) Extract the train (X_train.txt) and test (X_test.txt) sets and merge them into a data frame df.HAR
  3) Add the names of the features to the data frame using features.txt
  4) Extract the features whose name contain "-mean()" or "-std()" using the grep() function
  5) Add the activity of each example using y_train.txt and y_test.txt to df.HAR
  6) Change the activity number to its name using activity_labels.txt
  6) Add the subject ID of each example using subject_train.txt and subject_test.txt to df.HAR

## Processing - averaging over participants and activities (df.actsub.av)
We use df.HAR to group the data by subject and activity and take the average of the features. The result is stored in a data frame df.actsub.av and exported in a text file actsub.txt.
