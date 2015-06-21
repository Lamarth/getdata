# run_analysis.R

### Goals:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Actions:
- For each of the training and test data sets:
    - Load activity names from activity_labels.txt and column names from features.txt
    - Load observation values from X_<type>.txt, with the earlier loaded column names
    - Load subject information (person id) from subject_<type>.txt and create a column
    - Load activity information (activity id) from y_<type>.txt and convert using activity names
    - Join all together by position (cbind)
- Stack training and test data together (rbind)
- Keep the subject and activity columns, and then keep only the values with names that contain ".mean." or ".std."
- Store this in the variable *data*
- Group by subject and activity, then summarize all value columns with the mean function
- Store this in the variable *summary*
- (Optional) save summary to *summary.txt*

# summary.txt

Space separated mean values for each of the mean and standard deviation measurements.
These mean values are calculated by test subject and by activity.

The original data, from which these subject/activity means are constructed, is documented in *UCI HAR Dataset/README.txt*
