Codebook
=========

The tidydata.txt file that results from the run_analysis.R script is a clean and summarized dataset distilled from the "Human Activity Recognition Using Smartphones Dataset" for a course project in the Coursera class Geting and Cleaning Data.  

This codebook will provide an overview of the raw data, identify the raw data used, describe the transformations applied, and identify the variables in the tidydata.txt dataset.


Overview of Raw Data:
----------

A summary of the Human Activity Recognition Using Smartphones Dataset taken from the dataset README.md and Features-text.txt files is provided below, a full description is available in the raw data.

<em>"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean 'norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)." </em>


Raw Data:
------------

###Human Activity Recognition Using Smartphones Dataset

Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

The full set of source data was obtained at this url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data was downloaded, unzipped, and the following files were read into R:

      1. activity_labels.txt (from UCI HAR Dataset folder)
      2. features.txt (from UCI HAR Dataset folder)
      3. subject_train.txt (from UCI HAR Dataset/train folder)
      4. y_train.txt (from UCI HAR Dataset/train folder)
      5. X_train.txt (from UCI HAR Dataset/train folder)
      6. subject_test.txt (from UCI HAR Dataset/test folder)
      7. y_test.txt (from UCI HAR Dataset/test folder)
      8. X_test.txt (from UCI HAR Dataset/test folder)


Transformations:
------------------

The raw data was transformed as follows to arrive at the tidydata.txt:

      1. Variables of mean and standard deviation measurements were extracted and preserved; resulting dataset includes two grouping variables (i.e., subject and activity) and 66 measurement variables. All other variables were excluded from tidydata.txt. Note: all angle () variables in the source data were excluded, even if they are include mean or standard deviation titles, because they are calculations using multiple measurements.
      2. Activity and variable names were modified to make them descriptive (i.e., human readable - expand acronyms, all lowercase letters, and no periods or whitespace)
      3. The mean of each measurement variable was calculated for each uniqe subject-activity pair (180 observations in total) 
      4. The tidydata.txt was created using the 180 observations of calculated means for each of the 66 preserved measurement variables.


tidydata.txt Variables: 
------------------

The tidydata.txt dataset contains a total of 68 variables; two grouping variables and 66 measurement variables.

The tidydata.txt dataset contains the following two grouping variables:

      1. "subject"" (30 subjects)
      2. "activity"" (factor containing 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING)
The tidydata.txt dataset contains the following 66 measurement variables. The observation for each variable in tidydata.txt is the mean of all variable measurements in the source data by each unique subject-activity pairing (i.e., 180 observations of each measurement variable):

      1. "time-bodyaccelerometer-mean-x"                           
      2. "time-bodyaccelerometer-mean-y"                           
      3. "time-bodyaccelerometer-mean-z"                           
      4. "time-bodyaccelerometer-standarddeviation-x"              
      5. "time-bodyaccelerometer-standarddeviation-y"              
      6. "time-bodyaccelerometer-standarddeviation-z"              
      7. "time-gravityaccelerometer-mean-x"                        
      8. "time-gravityaccelerometer-mean-y"                              
      9. "time-gravityaccelerometer-mean-z"                        
      10. "time-gravityaccelerometer-standarddeviation-x"           
      11. "time-gravityaccelerometer-standarddeviation-y"           
      12. "time-gravityaccelerometer-standarddeviation-z"           
      13. "time-bodyaccelerometerjerk-mean-x"                       
      14. "time-bodyaccelerometerjerk-mean-y"                       
      15. "time-bodyaccelerometerjerk-mean-z"                       
      16. "time-bodyaccelerometerjerk-standarddeviation-x"          
      17. "time-bodyaccelerometerjerk-standarddeviation-y"          
      18. "time-bodyaccelerometerjerk-standarddeviation-z"          
      19. "time-bodygyroscope-mean-x"                               
      20. "time-bodygyroscope-mean-y"                               
      21. "time-bodygyroscope-mean-z"                               
      22. "time-bodygyroscope-standarddeviation-x"                  
      23. "time-bodygyroscope-standarddeviation-y"                  
      24. "time-bodygyroscope-standarddeviation-z"                  
      25. "time-bodygyroscopejerk-mean-x"                           
      26. "time-bodygyroscopejerk-mean-y"                           
      27. "time-bodygyroscopejerk-mean-z"                           
      28. "time-bodygyroscopejerk-standarddeviation-x"              
      29. "time-bodygyroscopejerk-standarddeviation-y"              
      30. "time-bodygyroscopejerk-standarddeviation-z"              
      31. "time-bodyaccelerometermagnitude-mean"                    
      32. "time-bodyaccelerometermagnitude-standarddeviation"       
      33. "time-gravityaccelerometermagnitude-mean"                 
      34. "time-gravityaccelerometermagnitude-standarddeviation"    
      35. "time-bodyaccelerometerjerkmagnitude-mean"                
      36. "time-bodyaccelerometerjerkmagnitude-standarddeviation"   
      37. "time-bodygyroscopemagnitude-mean"                        
      38. "time-bodygyroscopemagnitude-standarddeviation"           
      39. "time-bodygyroscopejerkmagnitude-mean"                    
      40. "time-bodygyroscopejerkmagnitude-standarddeviation"       
      41. "frequency-bodyaccelerometer-mean-x"                            
      42. "frequency-bodyaccelerometer-mean-y"                            
      43. "frequency-bodyaccelerometer-mean-z"                            
      44. "frequency-bodyaccelerometer-standarddeviation-x"               
      45. "frequency-bodyaccelerometer-standarddeviation-y"               
      46. "frequency-bodyaccelerometer-standarddeviation-z"               
      47. "frequency-bodyaccelerometerjerk-mean-x"                        
      48. "frequency-bodyaccelerometerjerk-mean-y"                        
      49. "frequency-bodyaccelerometerjerk-mean-z"                        
      50. "frequency-bodyaccelerometerjerk-standarddeviation-x"           
      51. "frequency-bodyaccelerometerjerk-standarddeviation-y"           
      52. "frequency-bodyaccelerometerjerk-standarddeviation-z"           
      53. "frequency-bodygyroscope-mean-x"                                
      54. "frequency-bodygyroscope-mean-y"                                
      55. "frequency-bodygyroscope-mean-z"                                
      56. "frequency-bodygyroscope-standarddeviation-x"                   
      57. "frequency-bodygyroscope-standarddeviation-y"                   
      58. "frequency-bodygyroscope-standarddeviation-z"                   
      59. "frequency-bodyaccelerometermagnitude-mean"                     
      60. "frequency-bodyaccelerometermagnitude-standarddeviation"        
      61. "frequency-bodybodyaccelerometerjerkmagnitude-mean"             
      62. "frequency-bodybodyaccelerometerjerkmagnitude-standarddeviation"
      63. "frequency-bodybodygyroscopemagnitude-mean"                     
      64. "frequency-bodybodygyroscopemagnitude-standarddeviation"        
      65. "frequency-bodybodygyroscopejerkmagnitude-mean"                 
      66. "frequency-bodybodygyroscopejerkmagnitude-standarddeviation"