library(dplyr)

# Load the data
loadData <- function(type) {
    data_path <- "UCI HAR Dataset"
    activity_labels <- read.table(file.path(data_path, "activity_labels.txt"), row.names = 1, col.names = c("num", "name"))
    columns <- read.table(file.path(data_path, "features.txt"), row.names = 1, col.names = c("num", "name"))
    
    # Includes Task #4 - apply descriptive variable names
    values <- read.table(file.path(data_path, type, paste0("X_", type, ".txt")), col.names = columns$name)
    subjects <- read.table(file.path(data_path, type, paste0("subject_", type, ".txt")), col.names = "subject")
    
    activities <- read.table(file.path(data_path, type, paste0("y_", type, ".txt")), col.names = "activity")
    activities$activity <- as.factor(activities$activity)
    # Includes Task #3 - apply descriptive activity names
    levels(activities$activity) <- activity_labels$name
    cbind(subjects, activities, values)
}

# Task #1 - Combines the train and test data sets
data <- rbind(loadData("train"), loadData("test"))
# Task #2 - Keep only mean and standard deviation (along with observation information)
data <- select(data, c(1, 2, grep("\\.mean\\.|\\.std\\.", names(data))))
    
# Task #5 - Average by activity and subject
summary <- data %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# Optionally write out the data for upload
# write.table(summary, file="summary.txt", row.names = FALSE)