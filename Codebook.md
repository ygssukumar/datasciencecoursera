datasciencecoursera
===================
CODE book describing variables with steps to generate

-----------------------------------------------------------------------
#reading the activity names for which observations were recorded
Dataset Name: activitynamesds
-----------------------------------------------------------------------

#reading the names of the features or observation names for which test and 
#train data are collected
#NOTE: number of columns match the number of columns in either the training
#or the test data set, this is just for fyi
#there are two columns here 1st column is the index, 
#2nd column has the column names that we need to link with the test data
Dataset Name: colnamesds
-----------------------------------------------------------------------
#we need to create a lookup for matching the activity names so we can merge
#and use it later for creating dataset for PART5 
Dataset Name: lookup
-----------------------------------------------------------------------
#Operations performed for test data
# STEPS followed are below
# STEP1: Set working directory to "test"
-----------------------------------------------------------------------
#STEP 2
#read the subjects data for which observations were recorded
#this information is stored in the y_test.txt file
--------------------------
Dataset Name: tempytestds
-----------------------------------------------------------------------
#STEP 3
#read the main test data into a temp dataset
#colnames are being added by linking to the 2nd column of "colnamesds" dataset
#which we just read above
------------------------
Dataset Name: temptestds
-----------------------------------------------------------------------
#STEP 4
#let us assign the activity names to each of the activity observations 
#recorded from y_test.txt file (stored in tempytestds)
--------------------------
Dataset Name: tempytestds
-----------------------------------------------------------------------
#STEP 5
#we need to merge the the datasets for test data, y test data so we
#can link the subjects and their observed data
#we are doing cbind because we need to merge the columns not rows
Dataset Name: mergetemptestds
-----------------------------------------------------------------------
#Repeat the same above steps for training data
-----------------------------------------------------------------------
#Operations performed for test data
# STEPS followed are below
# STEP1: Set working directory to "test"
-----------------------------------------------------------------------

#STEP 2
#read the subjects data for which observations were recorded
#this information is stored in the y_test.txt file
Dataset Name: tempytrainds
-----------------------------------------------------------------------
#STEP 3
#read the main test data into a temp dataset
#colnames are being added by linking to the 2nd column of "colnamesds" dataset
#which we just read above
Dataset Name: temptrainds
-----------------------------------------------------------------------

#STEP 4
#let us assign the activity names to each of the activity observations 
#recorded from y_train.txt file (stored in tempytrainds)
-----------------------------------------------------------------------

#STEP 5
#we need to merge the the datasets for test data, y test data so we
#can link the subjects and their observed data
#we are doing cbind because we need to merge the columns not rows
--------------------
Dataset Name: mergetemptrainds
-----------------------------------------------------------------------
#PART 1 - Merges the training and the test sets to create one data set.
----------------------
Dataset Name: part1mergetesttrainds
-----------------------------------------------------------------------
#PART 2 - Extracts only the measurements on the mean and standard deviation for each measurement. 
-----------------------------------------------------------------------

#PART 3 - Uses descriptive activity names to name the activities in the data set                                          
#we already named the activities in STEP4
#tempytrainds[2] will give us descriptive activity names
-----------------------------------------------------------------------
#PART 4
#used the existing features names where t represents time
#f represents frequency
-----------------------------------------------------------------------
#PART 5
#using the apply function to apply the average for all columns and returning a list
-----------------------------------------------------------------------
thirffinaltemptesttrainds
