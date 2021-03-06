#Summary and Transformations

This project took the user through the following 5 steps using the data listed in the `README.txt` file:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In the `run_analysis.R` script, we first merge the similar data with the `rbind()` function. We then take all the columns with the mean and standard deviation from the 
dataset and give them the correct names taken from the `features` text. We take the activity names and IDs from the `activity_labels` text and enter them into the dataset.
Some column names are corrected and a new dataset is generated with all of the mean measurements for each subject and activity type, and this file is called `TidyData.txt`, 
which is uploaded onto this site.


# Used variables

* `xtrain`, `ytrain`, `xtest`, `ytest`, `subjecttrain` and `subjecttest` contain the data from the downloaded files.
* `xdata`, `ydata` and `subjectdata` merge datasets.
* `alldata` merges `xdata`, `ydata` and `subjectdata`.
* `TidyData` contains the relevant averages which will be later stored in a `.txt` file. 
* `features` contains names for the `xdata` dataset, which are applied to the column names stored in `mean_and_std_features`. The `activities` variable is similar.
* `ddply()` is used as an easier method to apply `colMeans()`.

# Data

The data used for this project can be found at [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
