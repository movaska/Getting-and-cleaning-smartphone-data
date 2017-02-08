# Getting, cleaning and summarizing smartphone data

## run_analysis.R 

### Required packages:

dplyr

### Getting data

The script downloads the Human Activity Recognition Using Smartphones Dataset from the file

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Original Data")

### Combining data

Test and training data are read from files 

1. test/X_test.txt
2. test/y_test.txt
3. test/subject_test.txt
4. train/X_train.txt
5. train/y_train.txt
6. train/subject_train.txt

Variables in **X**, **y**, and **subject** files are combined column-wise, and observations in test and training data are combined row-wise, into a single data set.

Variable names are extracted from files

1. activity_labels.txt
2. features.txt

and assigned to the data set.

### Selecting data and cleaning variable names

Out of the original 561 variables, only variables corresponding to mean
and standard deviations are selected. The selection criterion is that the 
variable name contains **mean()** or **std()**. 66 such variables are found.
The variables **subject** and **activity** are also kept.

The variable names are cleaned by removing hyphens `-` and parentheses `()`. 

For more details on variables, see **CodeBook.md** in this repo.

### Summarizing data

The data is grouped by **subject** (N=30) and **activity** (N=6) for a total of 30x6=180 subgroups. The mean of observations for each subgroup is then computed for each variable (excluding **subject** and **activity**). The 
resulting 180x68 data frame is written to the file **summarized\_smartphone\_data.txt**.   