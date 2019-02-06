
setwd("C:\\datascience_course\\data_cleaning\\project\\UCI HAR Dataset\\")

library(plyr)


# source("run_analysis.R")


# 1.Merges the training and the test sets to create one data set.

  train  <- read.csv("train\\X_train.txt",sep="",header = FALSE, skip=0, colClasses=c( rep('numeric', 561) ))
  
  train_activity_id  <- read.csv("train\\y_train.txt",sep="",header = FALSE)
  colnames(train_activity_id) <- c("activity_id")
  
  
  train_subject_id  <- read.csv("train\\subject_train.txt",sep="",header = FALSE)
  colnames(train_subject_id) <- c("subject_id")
  
  train_ds <- cbind(train,train_activity_id,train_subject_id)
  
  
  
  test <- read.csv("test\\X_test.txt",sep="",header = FALSE , colClasses=c( rep('numeric', 561) ))

  test_activity_id  <- read.csv("test\\y_test.txt",sep="",header = FALSE)
  colnames(test_activity_id) <- c("activity_id")
  
  test_subject_id  <- read.csv("test\\subject_test.txt",sep="",header = FALSE)
  colnames(test_subject_id) <- c("subject_id")
  
  test_ds <- cbind(test,test_activity_id,test_subject_id)
  
  
 
    
  
  merge_ds  <- merge(train_ds,test_ds,all=TRUE)
  print(dim(train_ds))
  print(dim(test_ds))
  print(dim(merge_ds))
  
 
 


  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  
 features <- read.csv("features.txt",sep="",header = FALSE)

 colnames(features) <- c("feature_id","feature_name")

 select_features  <- grep("mean|std",features$feature_name)

 col_indexes_for_select_features <- paste("V",select_features,sep="")
 
 col_indexes_for_select_features[length(col_indexes_for_select_features) + 1 ] <- "activity_id"
 
 col_indexes_for_select_features[length(col_indexes_for_select_features) + 1 ] <- "subject_id"

 selected_measurements_merged_data <- merge_ds[,col_indexes_for_select_features]

 

 # 3. Uses descriptive activity names to name the activities in the data set
 
  activity_label <-  read.csv("activity_labels.txt",sep="",header = FALSE)
  
  colnames(activity_label) <- c("activity_id","activity_name")
  
  selected_measurements_merged_data_with_activity_name <- join(selected_measurements_merged_data,activity_label,by="activity_id",type="inner")
  
  df_for_tidy <- join(selected_measurements_merged_data,activity_label,by="activity_id",type="inner")
  
 
 # 4. Appropriately labels the data set with descriptive variable name
 
  selected_feature_names <- features[select_features,"feature_name"]

  selected_feature_names <- factor(append(as.character(selected_feature_names),"activity_id"))
  
  selected_feature_names <- factor(append(as.character(selected_feature_names),"subject_id"))
  
  selected_feature_names <- factor(append(as.character(selected_feature_names),"activity_name"))
  
  colnames(selected_measurements_merged_data_with_activity_name) <- selected_feature_names
  
  
  # 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  library(dplyr)
  

  tidy_ds_grp <- group_by(df_for_tidy,activity_name,subject_id)
    
    
  tidy_ds <- summarise(tidy_ds_grp,
                       avg_V1 = mean(V1,na.rm = TRUE),
                       avg_V2 = mean(V2,na.rm = TRUE),
                       avg_V3 = mean(V3,na.rm = TRUE),
                       avg_V4 = mean(V4,na.rm = TRUE),
                       avg_V5 = mean(V5,na.rm = TRUE),
                       avg_V6 = mean(V6,na.rm = TRUE),
                       avg_V41 = mean(V41,na.rm = TRUE),
                       avg_V42 = mean(V42,na.rm = TRUE),
                       avg_V43 = mean(V43,na.rm = TRUE),
                       avg_V44 = mean(V44,na.rm = TRUE),
                       avg_V45 = mean(V45,na.rm = TRUE),
                       avg_V46 = mean(V46,na.rm = TRUE),
                       avg_V81 = mean(V81,na.rm = TRUE),
                       avg_V82 = mean(V82,na.rm = TRUE),
                       avg_V83 = mean(V83,na.rm = TRUE),
                       avg_V84 = mean(V84,na.rm = TRUE),
                       avg_V85 = mean(V85,na.rm = TRUE),
                       avg_V86 = mean(V86,na.rm = TRUE),
                       avg_V121 = mean(V121,na.rm = TRUE),
                       avg_V122 = mean(V122,na.rm = TRUE),
                       avg_V123 = mean(V123,na.rm = TRUE),
                       avg_V124 = mean(V124,na.rm = TRUE),
                       avg_V125 = mean(V125,na.rm = TRUE),
                       avg_V126 = mean(V126,na.rm = TRUE),
                       avg_V161 = mean(V161,na.rm = TRUE),
                       avg_V162 = mean(V162,na.rm = TRUE),
                       avg_V163 = mean(V163,na.rm = TRUE),
                       avg_V164 = mean(V164,na.rm = TRUE),
                       avg_V165 = mean(V165,na.rm = TRUE),
                       avg_V166 = mean(V166,na.rm = TRUE),
                       avg_V201 = mean(V201,na.rm = TRUE),
                       avg_V202 = mean(V202,na.rm = TRUE),
                       avg_V214 = mean(V214,na.rm = TRUE),
                       avg_V215 = mean(V215,na.rm = TRUE),
                       avg_V227 = mean(V227,na.rm = TRUE),
                       avg_V228 = mean(V228,na.rm = TRUE),
                       avg_V240 = mean(V240,na.rm = TRUE),
                       avg_V241 = mean(V241,na.rm = TRUE),
                       avg_V253 = mean(V253,na.rm = TRUE),
                       avg_V254 = mean(V254,na.rm = TRUE),
                       avg_V266 = mean(V266,na.rm = TRUE),
                       avg_V267 = mean(V267,na.rm = TRUE),
                       avg_V268 = mean(V268,na.rm = TRUE),
                       avg_V269 = mean(V269,na.rm = TRUE),
                       avg_V270 = mean(V270,na.rm = TRUE),
                       avg_V271 = mean(V271,na.rm = TRUE),
                       avg_V294 = mean(V294,na.rm = TRUE),
                       avg_V295 = mean(V295,na.rm = TRUE),
                       avg_V296 = mean(V296,na.rm = TRUE),
                       avg_V345 = mean(V345,na.rm = TRUE),
                       avg_V346 = mean(V346,na.rm = TRUE),
                       avg_V347 = mean(V347,na.rm = TRUE),
                       avg_V348 = mean(V348,na.rm = TRUE),
                       avg_V349 = mean(V349,na.rm = TRUE),
                       avg_V350 = mean(V350,na.rm = TRUE),
                       avg_V373 = mean(V373,na.rm = TRUE),
                       avg_V374 = mean(V374,na.rm = TRUE),
                       avg_V375 = mean(V375,na.rm = TRUE),
                       avg_V424 = mean(V424,na.rm = TRUE),
                       avg_V425 = mean(V425,na.rm = TRUE),
                       avg_V426 = mean(V426,na.rm = TRUE),
                       avg_V427 = mean(V427,na.rm = TRUE),
                       avg_V428 = mean(V428,na.rm = TRUE),
                       avg_V429 = mean(V429,na.rm = TRUE),
                       avg_V452 = mean(V452,na.rm = TRUE),
                       avg_V453 = mean(V453,na.rm = TRUE),
                       avg_V454 = mean(V454,na.rm = TRUE),
                       avg_V503 = mean(V503,na.rm = TRUE),
                       avg_V504 = mean(V504,na.rm = TRUE),
                       avg_V513 = mean(V513,na.rm = TRUE),
                       avg_V516 = mean(V516,na.rm = TRUE),
                       avg_V517 = mean(V517,na.rm = TRUE),
                       avg_V526 = mean(V526,na.rm = TRUE),
                       avg_V529 = mean(V529,na.rm = TRUE),
                       avg_V530 = mean(V530,na.rm = TRUE),
                       avg_V539 = mean(V539,na.rm = TRUE),
                       avg_V542 = mean(V542,na.rm = TRUE),
                       avg_V543 = mean(V543,na.rm = TRUE),
                       avg_V552 = mean(V552,na.rm = TRUE))
  
  selected_feature_names <- features[select_features,"feature_name"]
  
  selected_feature_names <- gsub("(" , "", selected_feature_names,fixed = TRUE)
  
  selected_feature_names <- gsub(")" , "", selected_feature_names,fixed = TRUE)
  
  selected_feature_names <- gsub("-" , "_", selected_feature_names,fixed = TRUE)
  
  selected_feature_names <- gsub("$" , "_Avg", selected_feature_names)
  
  colnames(tidy_ds)[3:81] <- selected_feature_names
  
  write.csv(tidy_ds, file = "tidy_ds.csv")
  
  # End
  
  
  
  
  
    