# Knowledge Discovery and Data Mining (CS 513A)

# Course      : CS 513A
# First Name  : Parth
# Last Name   : Parab
# CWID        : 10444835
# Purpose     : MidTerm Q6

##########################################################

library(e1071)
library(class)

rm(list=ls())
data = read.csv('adult_income_Bayes.csv',header=TRUE, sep=",", na.string = " ?")
head(data, n=5)
#Summarizing each column
summary(data)

#Check the number of rows before
nrow(data)

#Remove the rows with missing values 
data <- na.omit(data)

#Check the number of rows after
nrow(data)

#Convert labels to factor class
data$Income <- factor(data$Income, levels = c(" <=50K"," >50K"),labels = c(0, 1))

data$Income
test = data[seq(1, nrow(data), 5), ]
nrow(test)
head(test)

train = data[-seq(5, nrow(data), by = 5),]
nrow(train)
head(train)

nb<- naiveBayes(Income ~ ., data = train)
#Predicting class for test set
predict <- predict(nb, test)

#Confusion Matrix
conf_matrix <- table(nb=predict,class=test$Income)
print(conf_matrix)

#Accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(conf_matrix)

wrong<-sum(test$Income!=predict)
error_rate<-wrong/length(test$Income)
error_rate