run_analysis <- function() {

      ## assumes dplyr package is installed
      library(dplyr)
      
      ## Obtain Data from URL and place in temp directory and file
      dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      temdir <- tempdir()
      temfile = tempfile(tmpdir=temdir, fileext=".zip")
      download.file(dataurl, temfile)
      
      
      ## 1. Merge the training and the test sets to create one data set.
      
      ## Collect descriptive names for activities and variables.
      actlab <- read.table(unz(temfile, ("UCI HAR Dataset/activity_labels.txt")))
      feat <- read.table(unz(temfile, ("UCI HAR Dataset/features.txt")))
      features <- as.character(feat$V2)

      ## Collect training data for subject (sub), activity (y), and observations (x) 
      ## into one data.frame (train).
      sub <- read.table(unz(temfile, "UCI HAR Dataset/train/subject_train.txt"), col.names = "subject")
      y <- read.table(unz(temfile, "UCI HAR Dataset/train/y_train.txt"), col.names = "activity")
      x <- read.table(unz(temfile, "UCI HAR Dataset/train/X_train.txt"), col.names = features)
      train <- cbind(sub, y, x)

      ## Collect test data for subject (sub), activity (y), and observations (x)
      ## into one data.frame (test).
      sub2 <- read.table(unz(temfile, "UCI HAR Dataset/test/subject_test.txt"), col.names = "subject")
      y2 <- read.table(unz(temfile, "UCI HAR Dataset/test/y_test.txt"), col.names = "activity")
      x2 <- read.table(unz(temfile, "UCI HAR Dataset/test/X_test.txt"), col.names = features)
      test <- cbind(sub2, y2, x2)

      ## Combine training and test data into one data.frame (comp).
      comp <- rbind(train, test)
      
      ## Remove the temporary file.
      unlink(temfile)
      
      ## Finalize names for complete data.frame.
      compnames <- c("subject", "activity", features)
      names(comp) <- compnames
      
      ## 2. Extract only the measurements of mean and standard deviation.
      
      ## Select variables with "mean()" or "std()" in the variable name and 
      ## combine in a character vector with "subject" and "activity"
      meannames <- grep("mean\\()", names(comp), value = TRUE)      
      stdnames <- grep("std\\()", names(comp), value = TRUE)     
      filnames <- c("subject", "activity", meannames, stdnames)   

      ## Apply desired names to full data set.    
      filcomp <- comp[ , names(comp) %in% filnames]
    
      
      ## 3. Apply descriptive activity names to the activities observations.

      ## transform numbers 1:6 to descriptive names (e.g., walking or sitting).
      filcomp$activity <- as.factor(filcomp$activity)
      levels(filcomp$activity) <- as.character(actlab$V2)
      
      
      ## 4. Apply descriptive variable names to data set variables.
      
      ## create character verctor of names and modify to be descriptive: lowercase, 
      ## descriptive, expand acronyms; remove whitespace, periods, and underscores.
      descnames <- names(filcomp)
      descnames <- sub("^t", "time-", descnames)
      descnames <- sub("^f", "frequency-", descnames)
      descnames <- gsub("\\.", "", descnames)
      descnames <- gsub("\\()", "", descnames)
      descnames <- sub("Freq", "frequency", descnames)
      descnames <- sub("std", "standarddeviation", descnames)
      descnames <- sub("Mag", "magnitude", descnames)
      descnames <- sub("Gyro", "gyroscope", descnames)
      descnames <- sub("Acc", "accelerometer", descnames)
      descnames <- tolower(descnames)
     
      ## Reset names in data.frame (filcomp) to the descriptive  variable names
      names(filcomp) <- descnames
      
      
      ## 5. Create a new data set with average of variables by activity type and subject.
      
      ## group data.frame by subject and activity
      group <- group_by(filcomp, subject, activity)
      
      ## calculate mean of each variable for each unique subject-activity pairing;
      ## should result in 180 observations.
      tidydata <- summarise_each(group, funs(mean))
      
      ## tidydata should be a new data.frame; 180 observations of 68 variables.
      ## Write tidydata to a .txt file in the working directory.
      write.table(tidydata, file = "tidydata.txt", row.names = FALSE)
      print("Analysis Complete; tidydata.txt available in working directory.")
}