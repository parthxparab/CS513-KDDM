# Knowledge Discovery and Data Mining (CS 513A)

# Course      : CS 513A
# First Name  : Parth
# Last Name   : Parab
# CWID        : 10444835
# Purpose     : MidTerm Q8
#####################################################

rm(list=ls())
library(C50)


dataSet<-read.csv("adult_income_Dtree.csv",na.strings = ' ?')
View(dataSet)
dataSet<-as.data.frame(apply(dataSet,2,function(x)gsub('\\s+', '',x)))
View(dataSet)


#a)Select every fifth record, starting with the first record, as the test dataset and the remaining records as the training dataset
index<-seq(1,nrow(dataSet),by=5)
test<-dataSet[index,]
train<-dataSet[-index,]

#b)Perform C5.0 analysis 
model<-C5.0(Income~.,train)
plot(model)
#Prediction using te111st 
prediction<-predict(model,test,type="class")

#c)Score the test dataset
conf_matrix<-table(test$Income,prediction)
conf_matrix
str(prediction)

#d)Measure the error rate. 
wrong<-sum(test$Income!=prediction)
error_rate<-wrong/length(test$Income)
error_rate

