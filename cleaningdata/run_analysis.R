# Peer Graded Assignment: Getting and Cleaning Data Course Project
# Author : Neeraj Sharma
# 1 Jul 2016

# 1. Merges the training and the test sets to create one data set
# Load the training and test data sets and merge them into a new variable called merged
# The features.txt file lists total of 561 features. Its good idea to see the
# dimention (dim) of the loaded dataframe. 
# merge data set

base_dir <- "Samsung/"

train <- read.table(paste0(base_dir, "train/X_train.txt"), header = FALSE)
test <- read.table(paste0(base_dir, "test/X_test.txt"), header = FALSE)
merged_data_set <- rbind.data.frame(train, test)

train <- read.table(paste0(base_dir, "train/Y_train.txt"), header = FALSE)
test <- read.table(paste0(base_dir, "test/Y_test.txt" ), header = FALSE)
merged_activity_set <- rbind.data.frame(train, test)

# Delete unused references to reduce the memory footprints
rm(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table(paste0(base_dir, "features.txt"))
features <- features[grep("mean\\(\\)|std", features$V2, value = FALSE), ]

merged_data_set <- merged_data_set[, as.numeric(features$V1)]


# 3. Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table(paste0(base_dir, "/activity_labels.txt" ), 
                              header = FALSE, col.names = c("Class", "Label"))
merged_activity_set <- merge.data.frame(x = merged_activity_set, y = activity_labels, 
                                        by.x = "V1", by.y = "Class")

# 4. Appropriately labels the data set with descriptive variable names.
names(merged_data_set)  <- features$V2

# 5. From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.

# Load the reshape2 library for melting and casting operations
library(reshape2)

train_subjects <- read.table(paste0(base_dir, "train/subject_train.txt"), 
                             header = FALSE, col.names = c("Subject"))
test_subjects <- read.table(paste0(base_dir, "test/subject_test.txt", setp=""), 
                            header = FALSE, col.names = c("Subject"))

merged_subjects <- rbind.data.frame(train_subjects, test_subjects)

merged_data_set$activity <- merged_activity_set$Label
merged_data_set$subject <- merged_subjects$Subject

molten_data_set <- melt(merged_data_set, id=c("activity", "subject"))
casted <- dcast(molten_data_set, subject + activity ~ variable, mean)

# Write the tidy data output in a csv file
write.table(casted, file = "tidydataset.csv", row.names = FALSE)

# Remove all used variables from workbook
rm(activity_labels, features, merged_activity_set, merged_data_set, casted, merged_subjects,
<<<<<<< HEAD
   molten_data_set, test_subjects, train_subjects)
=======
   molten_data_set, test_subjects, train_subjects)
>>>>>>> c391eee2a3e9462eb8d7e921af8e9fac59d21ce1
