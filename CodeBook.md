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

## Processing - averaging over participants and activities (df.actsub.av)
We use df.HAR to group the data by subject and activity and take the average of the features. The result is stored in a data frame df.actsub.av and exported in a text file actsub.txt
