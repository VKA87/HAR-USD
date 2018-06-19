# HAR-USD
Getting and Cleaning Data Week 4 Assignment


This repository contains:
	- R script 'run_Analysis.R'
	- Readme.md file


The script run_Analysis.R does the following:

	- downloads data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it
	
	- from the data, it creates two data frames
      - df.HAR with the following features:
			  - subject ID 
        - activity
        - mean of each measurement
        - standard deviation of each measurement

	    - df.actsub.av: average of each feature of df.HAR for each activity and each subject.
	
