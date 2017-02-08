# Original data set

Human Activity Recognition Using Smartphones Dataset from

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Original Data")

### Experimental information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

#### For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

###Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

# Summarized data set

## Transformation of the original data to summarized data:

Out of the original 561 features, only variables corresponding to mean
and standard deviations are selected. The selection criterion is that the 
variable name contains **mean()** or **std()**. 66 such variables are found.
The variables **subject** and **activity** are also kept.

The data is grouped by **subject** (N=30) and **activity** (N=6) for a total of 30x6=180 subgroups. The mean of observations for each subgroup is then computed for each variable (excluding **subject** and **activity**). This 
results in a 180x68 data set.

## Variables in summarized data:

### Identifiers:

1. subject: a number identifying the user, range 1-30
2. activity: labels for different types of activity:
	1. LAYING
	2. SITTING
	3. STANDING
	4. WALKING
	5. WALKING_DOWNSTAIRS
	6. WALKING_UPSTAIRS

### Averaged gyroscope and accelerometer measurements:

Columns 3-68 contain the by-subject-and-activity means of quantities from the gyroscope and accelerator measurements in original data. Since the original features are normalized and bounded within [-1,1], this applies also to the new variables. The variable names are of the following types:

* tBodyAcc**[Mean/Std][X/Y/Z]**
* tGravityAcc**[Mean/Std][X/Y/Z]**
* tBodyAccJerk**[Mean/Std][X/Y/Z]**
* tBodyGyro**[Mean/Std][X/Y/Z]**
* tBodyGyroJerk**[Mean/Std][X/Y/Z]**
* tBodyAccMag**[Mean/Std]**
* tGravityAccMag**[Mean/Std]**
* tBodyAccJerkMag**[Mean/Std]**
* tBodyGyroMag**[Mean/Std]**
* tBodyGyroJerkMag**[Mean/Std]**
* fBodyAcc**[Mean/Std][X/Y/Z]**
* fBodyAccJerk**[Mean/Std][X/Y/Z]**
* fBodyGyro**[Mean/Std][X/Y/Z]**
* fBodyAccMag**[Mean/Std]**
* fBodyAccJerkMag**[Mean/Std]**
* fBodyGyroMag**[Mean/Std]**
* fBodyGyroJerkMag**[Mean/Std]**

Here **[Mean/Std]** is either **Mean** for mean of raw measurement data, or **Std** for standard deviation of raw measurement data.
**[X/Y/Z]** refers to one of the three spatial components: **X**, **Y**, or **Z**.

For further explanations on variable names, see the above section on features in original data.

