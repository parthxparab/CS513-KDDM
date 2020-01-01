# Knowledge Discovery and Data Mining (CS 513A)

# Course      : CS 513A
# First Name  : Parth
# Last Name   : Parab
# CWID        : 10444835
# Purpose     : Assignment #8

rm(list=ls())
library(neuralnet)

dataSet<-read.csv("wisc_bc_ContinuousVar.csv",na.strings = '?')
View(dataSet)
table(dataSet$diagnosis)

#To factor the data set
dataSet<-data.frame(lapply(na.omit(dataSet),as.numeric))

# To split the data set into test and testing 
idx<-sort(sample(nrow(dataSet),as.integer(.70*nrow(dataSet))))
training<-dataSet[idx,]
test<-dataSet[-idx,]
?neuralnet()
model<- neuralnet(diagnosis~.,training[-1], hidden=5, threshold=0.01)

#Plot the neural network
plot(model)

## test should have only the input colum
ann <-compute(model,test)
ann$net.result 

ann_cat<-ifelse(ann$net.result <1.5,1,2)
length(ann_cat)
length(test$diagnosis)
table(ann_cat,test$diagnosis)

wrong<- (test$diagnosis!=ann_cat)
errorRate<-sum(wrong)/length(wrong)