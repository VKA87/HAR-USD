############################################################
### Human Activity Recognition Using Smartphones Dataset ###
############################################################

## This script creates two data frames:
##
##      (1) df.HAR: merged train and test dataset
##                      - subject ID 
##                      - activity
##                      - mean of each measurement
##                      - standard deviation of each measurement
##
##      (2) df.actsub.av: mean of features in df.HAR for each subject and activity


####################
## LOAD LIBRARIES ##
####################

library(utils)
library(plyr)
library(dplyr)

########################
## DOWNLOAD AND UNZIP ##
########################

# Uncomment to download and unzip file

fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileURL, destfile = 'dataset.zip', method = 'curl')
unzip("dataset.zip")

####################
## IMPORT DATASET ##
####################


# MEASUREMENT
#############

# Import measurements
measurements.train <- read.table('UCI HAR Dataset/train/X_train.txt',header = FALSE)
measurements.test <- read.table('UCI HAR Dataset/test/X_test.txt',header = FALSE)

# Join the train and test dataset
df.HAR <- rbind(measurements.train,measurements.test)

# Add names to each measurement
features <- read.table('UCI HAR Dataset/features.txt',colClasses = c("NULL",NA), header = FALSE)
colnames(df.HAR) <- features[,1]

# Select columns with -mean() and -std()
cols <- grep('-mean()|-std()', features[,1])
df.HAR <- df.HAR[,cols]

# ACTIVITY
##########

# Import y (ACTIVITY)
y.train <- scan('UCI HAR Dataset/train/y_train.txt')
y.test <- scan('UCI HAR Dataset/test/y_test.txt')
y <- c(y.train,y.test)

# Map y to its activity name
labels <- read.table('UCI HAR Dataset/activity_labels.txt', header=FALSE)
y <- mapvalues(y, from = labels[,1], to = as.character(labels[,2]))

# Add to data frame
df.HAR$ACTIVITY <- y

# SUBJECT
##########

# Import subject
subject.train <- scan('UCI HAR Dataset/train/subject_train.txt')
subject.test <- scan('UCI HAR Dataset/test/subject_test.txt')
subject <- c(subject.train,subject.test)

# Add to data frame
df.HAR$SUBJECT <- subject

##################################################
## MEASUREMENT AVERAGE PER ACTIVITY AND SUBJECT ##
##################################################

df.actsub.av <- aggregate(.~ACTIVITY+SUBJECT,df.HAR, mean)

## Export data frame
write.table(df.actsub.av,row.name=FALSE)







