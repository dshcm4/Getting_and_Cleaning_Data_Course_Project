## run_analysis.R - script to produce desired 'tidy' dataset for Coursera course: "Getting and Cleaning Data"
## 
## David Heeszel - 8/15/2016
## 

#Load necessary libraries
library(plyr)


#Step 1 - Check for the existence of the necessary files - if they don't exist; get them
filename1<- "wearable_dataset.zip"

if (!file.exists(filename1)){
      fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL,filename1)
}

if (!file.exists("UCI HAR Dataset")) {
      unzip(filename1)
}

#Step 2 - Invoke some bookeping for filenames - so that I don't have to type as much!
dloc<-"UCI HAR Dataset"
tloc<-"train"
ttloc<-"test"

#set filenames
activityfile<-paste(dloc,"activity_labels.txt",sep="/") # Activities
featurefile<-paste(dloc,"features.txt",sep="/") # Features
tfile<-paste(dloc,tloc,"X_train.txt",sep="/") #Xdata train
tafile<-paste(dloc,tloc,"y_train.txt",sep="/") #Ydata train
tsfile<-paste(dloc,tloc,"subject_train.txt",sep="/") #train subject
ttfile<-paste(dloc,ttloc,"X_test.txt",sep="/") # Xdata test
ttafile<-paste(dloc,ttloc,"y_test.txt",sep="/") #Ydata test
ttsfile<-paste(dloc,ttloc,"subject_test.txt",sep="/") #test subject

#Step 3 - Read in the data and merge the datasets
#Get data and merge
xtrain<-read.table(tfile)
ytrain<-read.table(tafile)
subtrain<-read.table(tsfile)

xtest<-read.table(ttfile)
ytest<-read.table(ttafile)
subtest<-read.table(ttsfile)

x_data<-rbind(xtrain,xtest)
y_data<-rbind(ytrain,ytest)
subject_data<-rbind(subtrain,subtest)

#Step 4 - Extract measurements we care about (mean and std. deviation)

features<-read.table(featurefile)

#use grep to get mean and std deviation data
mn_std_ft<-grep("-(mean|std)\\(\\)",features[,2])

#subset data
x_data<-x_data[,mn_std_ft]

#correct names
names(x_data)<-features[mn_std_ft,2]

#Step 5 - Get the names of the activities so we can tie activity names to the data
activities <- read.table(activityfile)

#Update the y-data or activity data with the proper names
y_data[,1]<-activities[y_data[,1],2]
names(y_data)<-"activity"

names(subject_data)<-"subject"


#Step 6 - Bind data into single dataset
all_data<- cbind(x_data,y_data,subject_data)


#Step 7 - Create tidy dataset by determining mean of each variable for each activity at the subject level

data_averages<-ddply(all_data, .(subject,activity),function(x) colMeans(x[,1:66]))
data_names<-names(data_averages)

# This just makes the column headers prettier in the resulting output file
data_names=gsub('-mean','Mean',data_names)
data_names=gsub('-std','Std',data_names)
data_names=gsub('[-()]','',data_names)
names(data_averages)<-data_names

write.table(data_averages,"tidy_data.txt",row.name=FALSE, quote=FALSE)