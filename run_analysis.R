#setting the working directory to main directory
setwd("~/Desktop/Datascience/UCI HAR Dataset 2")

#reading the activity names for which observations were recorded
activitynamesds <- read.table("activity_labels.txt")

#reading the names of the features or observation names for which test and 
#train data are collected
#NOTE: number of columns match the number of columns in either the training
#or the test data set, this is just for fyi
#there are two columns here 1st column is the index, 
#2nd column has the column names that we need to link with the test data
colnamesds <- read.table("features.txt")

#we need to create a lookup for matching the activity names so we can merge
#and use it later for creating dataset for PART5 
lookup <- c("1" = "WALKING", "2" = "WALKING_UPSTAIRS", "3" = "WALKING_DOWNSTAIRS", "4" = "SITTING", "5" = "STANDING", "6" = "LAYING")

#Operations performed for test data
# STEPS followed are below
# STEP1: Set working directory to "test"
setwd("~/Desktop/Datascience/UCI HAR Dataset 2/test")

#STEP 2
#read the subjects data for which observations were recorded
#this information is stored in the y_test.txt file
tempytestds <- read.table("y_test.txt")

#STEP 3
#read the main test data into a temp dataset
#colnames are being added by linking to the 2nd column of "colnamesds" dataset
#which we just read above
temptestds <- read.table("X_test.txt", col.names = colnamesds$V2)

#STEP 4
#let us assign the activity names to each of the activity observations 
#recorded from y_test.txt file (stored in tempytestds)
testlookupds <- lookup[tempytestds$V1]
tempytestds[2] <- testlookupds

#STEP 5
#we need to merge the the datasets for test data, y test data so we
#can link the subjects and their observed data
#we are doing cbind because we need to merge the columns not rows
mergetemptestds <- cbind(tempytestds, temptestds)

##############
#Repeat the same above steps for training data

#Operations performed for test data
# STEPS followed are below
# STEP1: Set working directory to "test"
setwd("~/Desktop/Datascience/UCI HAR Dataset 2/train")

#STEP 2
#read the subjects data for which observations were recorded
#this information is stored in the y_test.txt file
tempytrainds <- read.table("y_train.txt")

#STEP 3
#read the main test data into a temp dataset
#colnames are being added by linking to the 2nd column of "colnamesds" dataset
#which we just read above
temptrainds <- read.table("X_train.txt", col.names = colnamesds$V2)

#STEP 4
#let us assign the activity names to each of the activity observations 
#recorded from y_test.txt file (stored in tempytestds)
trainlookupds <- lookup[tempytrainds$V1]
tempytrainds[2] <- trainlookupds

#STEP 5
#we need to merge the the datasets for test data, y test data so we
#can link the subjects and their observed data
#we are doing cbind because we need to merge the columns not rows
mergetemptrainds <- cbind(tempytrainds, temptrainds)

#PART 1 - Merges the training and the test sets to create one data set.

part1mergetesttrainds <- rbind(mergetemptestds,mergetemptrainds)

rm(mergetemptrainds)
#PART 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
rm(part2meantemptds) <- part1mergetesttrainds[grep("mean", colnames(part1mergetesttrainds))]
rm(tempytrainds) <- part1mergetesttrainds[grep("std", colnames(part1mergetesttrainds))

#PART 3 - Uses descriptive activity names to name the activities in the data set                                          
#we already named the activities in STEP4
#tempytrainds[2] will give us descriptive activity names

#PART 4
#used the existing features names where t represents time
#f represents frequency

#PART 5
#using the apply function to apply the average for all columns and returning a list
thirffinaltemptesttrainds <- apply(thirdtemptesttrainds, avg, simplify=F)
