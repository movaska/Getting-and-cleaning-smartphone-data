library(dplyr)

## Download data into working directory, name the file "data.zip"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# Note: On mac (and linux?) call download.file with method="curl"
zip_name <- "data.zip"
download.file(fileUrl, destfile = zip_name)

## Save the date of download
DateDownloaded = date()

## Read all necessary data from zipped archive, add column names to y and subject
activity_labels <- read.table(unz(zip_name, "UCI HAR Dataset/activity_labels.txt"), stringsAsFactors = FALSE)
features <- read.table(unz(zip_name, "UCI HAR Dataset/features.txt"), stringsAsFactors = FALSE)
x_test <- read.table(unz(zip_name, "UCI HAR Dataset/test/X_test.txt"))
x_train <- read.table(unz(zip_name, "UCI HAR Dataset/train/X_train.txt"))
subject_test <- read.table(unz(zip_name, "UCI HAR Dataset/test/subject_test.txt"))
y_test <- read.table(unz(zip_name, "UCI HAR Dataset/test/y_test.txt"))
subject_train <- read.table(unz(zip_name, "UCI HAR Dataset/train/subject_train.txt"))
y_train <- read.table(unz(zip_name, "UCI HAR Dataset/train/y_train.txt"))

## Combine training and test data 
x <- bind_rows(x_train, x_test)
y <- bind_rows(y_train, y_test)
subject <- bind_rows(subject_train, subject_test)

## Name feature columns (1:561) of data
# Get feature names (originally from file features.txt)
feature_names <- features[,2]
colnames(x) <- feature_names

## Get all columns in xwhich contain either mean() or std() in column name
columns <- grepl("(std|mean)\\(\\)", colnames(x))
x <- x[, columns]

## Rename columns of x: remove "-" and "()", capitalize mean, std
colnames(x) <- gsub("-", "", colnames(x), fixed=TRUE)
colnames(x) <- gsub("()", "", colnames(x), fixed=TRUE)
colnames(x) <- gsub("mean", "Mean", colnames(x), fixed=TRUE)
colnames(x) <- gsub("std", "Std", colnames(x), fixed=TRUE)

## Name variables
colnames(subject) <- "subject"
colnames(y) <- "activity_id"
colnames(activity_labels) <- c("activity_id", "activity")

## Replact y with y.labeled, where activities have proper names
y_labeled <- y %>%
    left_join(activity_labels, by="activity_id") %>%
    select(activity)

## Combine all data into one data frame
data <- bind_cols(x, y_labeled, subject)

## Check if any NA's in data (returns FALSE, so no NA's present)
anyNA(data)

## Group by subject and activity, then get mean of every column
data_summarized <- data %>%
    group_by(subject, activity) %>%
    summarise_each(funs(mean))

## Write results into file summarized_data_smartphone.txt
write.table(data_summarized, "summarized_smartphone_data.txt", row.names = FALSE)

## Reading in and viewing the data:
test_data <- read.table("summarized_smartphone_data.txt", header = TRUE)
View(test_data)
