# Merge the training and test sets to create one data set
# Load all data

features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")

xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
subjecttest <- read.table("test/subject_test.txt")

# create 'x' data set
xdata <- rbind(xtrain, xtest)

# create 'y' data set
ydata <- rbind(ytrain, ytest)

# create 'subject' data set
subjectdata <- rbind(subjecttrain, subjecttest)


# Extract only the measurements on the mean and standard deviation for each measurement
# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
xdata <- xdata[, mean_and_std_features]

# correct the column names
names(xdata) <- features[mean_and_std_features, 2]

# Use descriptive activity names to name the activities in the data set
# update with correct activity names
ydata[, 1] <- activity[ydata[, 1], 2]

# correct column name
names(ydata) <- "activity"

# Appropriately label the data set with descriptive variable names
# correct column name
names(subjectdata) <- "subject"

# bind all the data in a single data set
allData <- cbind(xdata, ydata, subjectdata)

# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
tidydata <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidydata, "TidyData.txt", row.name=FALSE)