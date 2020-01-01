###### Knowledge Discovery and Data Mining (CS 513B) ######
#         (Homework 4 - Naïve Bayes Methodology)

# Course      : CS 513A
# First Name  : PARTH
# Last Name   : PARAB
# CWID        : 10444835
# Purpose     : Homework 4

###### ******************************************** ######

################### Question ###################
####The “breast cancer dataset” in CANVAS was obtained from the University of Wisconsin Hospitals, Madison from Dr. William H. Wolberg. The features in the dataset, described below, have been categorized from 1 to 10.Use the Naïve Bayes methodology to develop a classification model for the Diagnosis. 

# clearing object environment
rm(list=ls())

# set working directory
setwd("/Users/parthxparab/Documents/Fall 2019/CS513/HW3")

#Import package 'e1071' for Naive Bayes Classifier and class package
#install.packages("e1071")
#install.packages(class)
library(e1071)
library(class)

#Load Breast cancer data file CSV
df <- read.csv("breast-cancer-wisconsin.data.csv",na.string="?")

#Remove any row with a missing value in any of the columns.
df<-na.omit(df)

View(df)
#Converting the type of column F6 from character to numeric
df$F6<-as.integer(df$F6)

#Converting the Class into type factor
df$Class<- factor(df$Class , levels = c("2","4") , labels = c("Benign","Malignant"))
is.factor(df$Class)

newData<- df[2:11]

#70% of the sample size
smp_size <- floor(0.70 * nrow(newData))

#Set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(newData)), size = smp_size)

#Loading 70% Breast cancer record in training dataset
training <- newData[train_ind, ]

#Loading 30% Breast cancer in test dataset
test <- newData[-train_ind, ]

#Implementing NaiveBayes
model_naive<- naiveBayes(Class ~ ., data = training)

#Predicting target class for the Validation set
predict_naive <- predict(model_naive, test)

conf_matrix <- table(predict_nb=predict_naive,class=test$Class)
print(conf_matrix)

#Output of Naive Bayes Classifier
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(conf_matrix)


################### THE END ###################

