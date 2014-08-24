
setwd("C:/R")
library(plyr)
##Read the various tables from the downloaded txt files.
x_test=read.table("UCI HAR Dataset/test/x_test.txt")
y_test=read.table("UCI HAR Dataset/test/y_test.txt")
x_train=read.table("UCI HAR Dataset/train/x_train.txt")
y_train=read.table("UCI HAR Dataset/train/y_train.txt")
features=read.table("UCI HAR Dataset/features.txt")
activity_labels=read.table("UCI HAR Dataset/activity_labels.txt")
subject_test=read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train=read.table("UCI HAR Dataset/train/subject_train.txt")
##rbind the different train and test data sets together.
x_data=rbind(x_train,x_test)
y_data=rbind(y_train,y_test)
subject_data=rbind(subject_train,subject_test)
##cbind the data, subject, and activity type together in one table.
master_data=cbind(x_data,subject_data,y_data)
##define the column titles and add to dataframe.
feature_names=as.character(features$V2)
colnames(master_data)=c(feature_names,"subject","activity")
##Now find the features that are mean() or std().
meanindex=which(grepl("mean()",feature_names,fixed=TRUE))
mean_names=feature_names[meanindex]
stdindex=which(grepl("std()",feature_names,fixed=TRUE))
std_names=feature_names[stdindex]
mean_std_names=c(mean_names,std_names)
tidymaster=master_data[,c(mean_std_names,"subject","activity")]
##Now I will add descriptive names for the activities.
tidymaster$activity=sub(1,"WALKING",tidymaster$activity)
tidymaster$activity=sub(2,"WALKING_UPSTAIRS",tidymaster$activity)
tidymaster$activity=sub(3,"WALKING_DOWNSTAIRS",tidymaster$activity)
tidymaster$activity=sub(4,"SITTING",tidymaster$activity)
tidymaster$activity=sub(5,"STANDING",tidymaster$activity)
tidymaster$activity=sub(6,"LAYING",tidymaster$activity)
tidyint=aggregate(tidymaster,by=list(tidymaster$subject,tidymaster$activity),FUN=mean)
tidyfinal=tidyint[,1:68]
colnames(tidyfinal)=c("subject","activity",mean_std_names)
write.table(tidyfinal,file="tidyfinal.txt",row.names=FALSE)