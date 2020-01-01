# Knowledge Discovery and Data Mining (CS 513A)

# Course      : CS 513A
# First Name  : Parth
# Last Name   : Parab
# CWID        : 10444835
# Purpose     : Assignment #7


rm(list=ls())
library(randomForest)

dataSet<-read.csv("breast-cancer-wisconsin.data.csv",na.strings = '?')
View(dataSet)
table(dataSet$Class)

#To factor the data set
dataSet$Class <- factor(dataSet$Class, levels = c(2,4),labels = c("Benign", "Malignant"))
dataSet<-na.omit(dataSet)

# To split the data set into test and testing 
idx<-sort(sample(nrow(dataSet),as.integer(.70*nrow(dataSet))))
training<-dataSet[idx,]
test<-dataSet[-idx,]

fit <- randomForest( Class~., data=training, importance=TRUE, ntree=1000)
importance(fit)
varImpPlot(fit)

Prediction <- predict(fit, test)
table(actual=test$Class,Prediction)
wrong<- (test$Class!=Prediction )

errorRate<-sum(wrong)/length(wrong)
errorRate 