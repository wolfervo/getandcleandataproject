getandcleandataproject
======================

Repository for Getting and Cleaning Data course project

The run_analysis() function provided in the run_analysis.R script obtains raw data and modifies the data to generate a clean and summarized dataset as "tidydata.txt". This script was prepared for the Coursera course Getting and Cleaning Data course project.

The run_analysis.R script can be run after it is loaded by calling the function "run_analysis()" with no arguments.

run_analysis.R Script Approach
-----------------------

###General Script Set-up:

The run_analysis() function assumes the dplyr package is installed.
      
Create a temporary directory and temporary file to house the raw data for the duration of the function operations.  
Obtain raw data from the following URL:
      "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

###Implement Step 1: Merges the training and the test sets to create one data set

Unzip general files from the "UCI HAR Dataset/" folder and assign the vectors or dataframes to named objects:
      
      1. unzip "activity_labels.txt" and assign as "act_lab"
      2. unzip "features" and assign as "features"     
Unzip training files from the "UCI HAR Dataset/train/" folder and assign the dataframes to named objects:
     
      1. unzip "sbuject_train" and set column name as "subject"; assign as "sub"
      2. unzip "y_train" and set column name as "activity"; assign as "y"
      3. unzip "x_train" and set column names as the features character vector; assign as "x"
Create a dataframe: cbind() sub, y and x together; assign as "train"

Unzip test files from the "UCI HAR Dataset/test/" folder and assign the dataframes to named objects:
      
      1. unzip "sbuject_test" and set column name as "subject"; assign as "sub2"
      2. unzip "y_test" and set column name as "activity"; assign as "y2"
      3. unzip "x_test" and set column names as the features character vector; assign as "x2"
Create a dataframe: cbind() sub, y and x together; assign as "test"

Create a dataframe: rbind() train and test together; assign as "comp".

comp should be a dataframe of 10,299 observations on 563 variables.

Remove the temporary file.

Create a character vector: c() "subject", "activity", and features to create character vector of all variable names; assign as "compnames".


###Implement Step 2: Extracts only the measurements on the mean and standard deviation for each measurement

Select variables with "mean()" in their name: grep() compnames for the phrase "mean\\()" and return the values; assign as "meannames".
Note: variable names with "Mean" are excluded because they belong to the angle group of variables which are calculations instead of the requested measurement variables.
Select variables with "std()" in their name: grep() compnames for the phrase "std\\()" and return the values; assign as "stdnames".

Create a character vector: c() "subject", "activity", meannames, and stdnames; assign as "filnames".

Subset comp: comp[] to include only variables that are present in filnames; assign as "filcomp".

filcomp should be a dataframe of 10,299 observations on 68 variables.
  

###Implement Step 3: Uses descriptive activity names to name the activities in the data set

Set the activity variable as a factor and apply levels from the act_lab dataframe (variable V2).


###Implement Step 4: Appropriately labels the data set with descriptive variable names   
      
Create a temporary character vector for manipulation: names() of filcomp; assign as "descnames"

Substitute patterns in descnames: sub() or gsub() substitutions in the following order:
      
      1. "^t" to "time-": expand abbreviation; note - existing dashes have been retained and new dashes introduced in the first two substitutions to improve variable name human readability. 
      2. "^f" to "frequency-": expand abbreviation
      3. "\\." to "": remove periods
      4. "\\()" to "": remove parentheses
      5. "Freq" to "frequency": expand abbreviation
      6. "std" to "standarddeviation": expand abbreviation
      7. "Mag" to "magnitude": expand abbreviation
      8. "Gyro" to "gyroscope": expand abbreviation
      9. "Acc" to "accelerometer": expand abbreviation
Convert all letters to lowercase: tolower() on descnames

Assign descnames to update filcomp variable names: names() 
      
      
###Implement Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
 
Group data: group_by() filcomp by subject and activity; assign to "group".

Summarize group by mean function: summarise_each() group by the mean() function; assign as "tidydata".

The tidydata dataframe should be 180 observations on 68 variables.
  
Write new text file: write.table() tidydata to "tidydata.txt".

Print "Analysis Complete; tidydata.txt available in working directory."

      
Retrieving Data
-------------------
      
To read tidydata.txt back into R please use the following script:

read.table("tidydata.txt", check.names = FALSE, header = TRUE)