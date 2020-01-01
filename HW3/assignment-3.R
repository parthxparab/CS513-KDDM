###### Knowledge Discovery and Data Mining (CS 513B) ######
#         (Homework 3 - K Nearest Neighbors(knn))

# Course      : CS 513A
# First Name  : PARTH
# Last Name   : PARAB
# CWID        : 10444835
# Purpose     : Homework 3

###### ******************************************** ######


rm(list=ls())
setwd("/Users/parthxparab/Documents/Fall 2019/CS513/HW3")
df = read.csv('breast-cancer-wisconsin.data.csv',header=TRUE, sep=",")

#Here we see that the summary for only column F6 hasn't been calculated on account of non-numeric characters in the column
n <- as.numeric(as.character(df$F6))
df$F6 <- n

#Remove the rows with missing values 
df <- na.omit(df)

#Convert labels to factor class
df$Class<- factor(df$Class , levels = c("2","4") , labels = c("Benign","Malignant"))

#KNN

#Generate train and test in the ratio 70% to 30%
size <- sample(1:nrow(df), 0.7 * nrow(df)) 
nor <-function(x) { (x -min(x))/(max(x)-min(x))   }

##Run nomalization on first 4 coulumns of dataset because they are the predictors
norm <- as.data.frame(lapply(df[,c(2,3,4,5,6,7,8,9,10)], nor))

df2 = df['Class']
#train set
train <- norm[size,] 
cl_train <- df2[size,]
##test set
test <- norm[-size,] 
cl_test <- df2[-size,]

#load the package class
library(class)

#run knn function for k = 3
clf <- knn(train,test,cl=cl_train,k=3)

#create confusion matrix
conf_matrix <- table(clf, cl_test)
print(conf_matrix)

#Accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(conf_matrix)

#run knn function for k = 5
clf <- knn(train,test,cl=cl_train,k=5)

#create confusion matrix
conf_matrix <- table(clf, cl_test)
print(conf_matrix)

#Accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(conf_matrix)

#run knn function for k = 10
clf <- knn(train,test,cl=cl_train,k=5)

#create confusion matrix
conf_matrix <- table(clf, cl_test)
print(conf_matrix)

#Accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(conf_matrix)

