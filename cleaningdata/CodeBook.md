Code Book for Getting and Cleaning Data Course Project

1. Merge the training and test data to create one data set
We load the train and test data from X_train.txt and X_test.txt into a variable called train and test.
Once loaded we use rbind opreation to append the data from both variable to a new variable called
merged_data_set.

We repeast the aforesaid operation for test and train data sets of activities and create a new variable
called merged_activity_set

Once done we remove the test and train variables to reduce the memory footprints in workspace.


2. Extracts only the measurements on the mean and standard deviation for each measurement

There are lot of features for which data is available, out of that we are interested only in mean and 
standard deviation datasets. For that we load the feautres.txt and apply a regular expression to get the 
features having meain and std in the names. We store this filtered data into variable called features.

We further filter out the merged_data_set, created in step1, based on the filtered names. This reduces the number of features from 561 to 66.

3. Use descriptive activity names to name the activities in the data set
We have the merged activity set created in setp 1. However that has the activity code which is not very
intutive. We want to replace the code with actual activity name descrived in activity_labels.txt. To get
this we read the file and merge with existing set.

4. Appropriately lables the data set with descriptive variable names.
Now that we have filtered data with 66 features, it makes sense to add descriptive names of the features. For that we assign the column names of merged_data_set with the second column of features.

5. From the data set in step4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

This required some aggregation for each of the dimentions mentioned the problem statement. For that we 
will use the melt and cast fucntion defined in reshape2 package. We have installed this package and 
loaded in the memory for further usages.

We have all data except the subject. So we load the subjects on train and test and make a combined data
set. We add these data as new columns in the merged_data_set. This creates a complete data frame with 
subject and labels 
We melt the data with id as activity and subject. This would create variables for each activity and each subject. Now we can apply the aggregation fuction, ( mean in this case ) while dcasting the dataframe. That
would result in a mean of each varialbe for each activity for each subject. 

Write the tidy data in a file called tidydataset.csv

Clean the memory.

